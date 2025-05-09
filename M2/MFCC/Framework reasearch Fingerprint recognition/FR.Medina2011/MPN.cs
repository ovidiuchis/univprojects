/*
 * Created by: Miguel Angel Medina P�rez (miguel.medina.perez@gmail.com)
 * Created: 
 * Comments by: Miguel Angel Medina P�rez (miguel.medina.perez@gmail.com)
 */

using System;
using System.Collections.Generic;
using PatternRecognition.FingerprintRecognition.Core;
using PatternRecognition.FingerprintRecognition.FeatureRepresentation;

namespace PatternRecognition.FingerprintRecognition.Matchers
{
    /// <summary>
    ///     An implementation of the algorithm proposed by Medina-P&eacute;rez et al. in 2011.
    /// </summary>
    /// <remarks>
    ///     <para>
    ///         This is an implementation of the algorithm proposed in [1].
    ///     </para>
    ///     <para>
    ///         Take into account that this algorithm is created to work with fingerprint images at 500 dpi. Proper modifications have to be made for different image resolutions.
    ///     </para>
    ///     <para>
    ///         References:
    ///     </para>
    ///     <para>
    ///         <list type="number">
    ///             <item>
    ///                M. A. Medina-P&eacute;rez, M. Garc&iacute;a-Borroto, A. E. Gutierrez-Rodriguez, L. Altamirano-Robles, "Robust fingerprint verification using m-triplets," in: International Conference on Hand-Based Biometrics (ICHB 2011), Hong Kong, 2011, pp. 1-5. (DOI: 10.1109/ICHB.2011.6094348. E-ISBN: 978-1-4577-0489-5. Print ISBN: 978-1-4577-0491-8).
    ///             </item>
    ///         </list>
    ///     </para>
    /// </remarks>
    public class MPN : Matcher<MtripletsFeature>, IMinutiaMatcher
    {
        #region public

        public double LocalAngleThr
        {
            get { return MTriplet.AngleThreshold * 180 / Math.PI; }
            set { MTriplet.AngleThreshold = value * Math.PI / 180; }
        }

        public double LocalDistThr
        {
            get { return MTriplet.DistanceThreshold; }
            set { MTriplet.DistanceThreshold = value; }
        }

        public int GlobalDistThr
        {
            get { return gdThr; }
            set { gdThr = value; }
        }

        public double GlobalAngleThr
        {
            get { return gaThr * 180 / Math.PI; }
            set { gaThr = value * Math.PI / 180; }
        }


        /// <summary>
        ///     Matches the specified fingerprint features.
        /// </summary>
        /// <param name="query">
        ///     The query fingerprint features.
        /// </param>
        /// <param name="template">
        ///     The template fingerprint features.
        /// </param>
        /// <returns>
        ///     The fingerprint similarity value.
        /// </returns>
        public override double Match(MtripletsFeature query, MtripletsFeature template)
        {
            List<MinutiaPair> matchingMtiae;
            return Match(query, template, out matchingMtiae);
        }

        /// <summary>
        ///     Matches the specified fingerprint features and outputs the matching minutiae.
        /// </summary>
        /// <param name="query">
        ///     The query fingerprint features.
        /// </param>
        /// <param name="template">
        ///     The template fingerprint features.
        /// </param>
        /// <param name="matchingMtiae">
        ///     The matching minutiae.
        /// </param>
        /// <exception cref="ArgumentOutOfRangeException">Thrown when the specified features has invalid type.</exception>
        /// <returns>
        ///     The fingerprint similarity value.
        /// </returns>
        public double Match(object query, object template, out List<MinutiaPair> matchingMtiae)
        {
            MtripletsFeature qMtripletsFeature = query as MtripletsFeature;
            MtripletsFeature tMtripletsFeature = template as MtripletsFeature;
            try
            {
                matchingMtiae = new List<MinutiaPair>();
                IList<MtripletPair> matchingTriplets = GetMatchingTriplets(qMtripletsFeature, tMtripletsFeature);
                if (matchingTriplets.Count == 0)
                    return 0;

                List<MinutiaPair> localMatchingMtiae = new List<MinutiaPair>(3600);
                foreach (var qMtia in qMtripletsFeature.Minutiae)
                    foreach (var tMtia in tMtripletsFeature.Minutiae)
                        localMatchingMtiae.Add(new MinutiaPair() { QueryMtia = qMtia, TemplateMtia = tMtia, MatchingValue = 1 });
                //List<MinutiaPair> localMatchingMtiae = GetLocalMatchingMtiae(qMtripletsFeature, tMtripletsFeature, matchingTriplets);
                //if (localMatchingMtiae.Count == 0)
                //    return 0;

                List<MinutiaPair> refMtiaePairs = GetReferenceMtiae(matchingTriplets);

                // Iterating over the reference Minutia pair
                int max = 0;
                int notMatchingCount = int.MaxValue;
                for (int i = 0; i < refMtiaePairs.Count; i++)
                {
                    List<MinutiaPair> currMatchingMtiae =
                        GetGlobalMatchingMtiae(localMatchingMtiae, refMtiaePairs[i], ref notMatchingCount);
                    if (currMatchingMtiae != null && currMatchingMtiae.Count > max)
                    {
                        max = currMatchingMtiae.Count;
                        matchingMtiae = currMatchingMtiae;
                    }
                }

                return 100 * Math.Sqrt(1.0 * max * max / (qMtripletsFeature.Minutiae.Count * tMtripletsFeature.Minutiae.Count));
            }
            catch (Exception e)
            {
                if (query.GetType() != typeof(MtripletsFeature) || template.GetType() != typeof(MtripletsFeature))
                {
                    string msg = "Unable to match fingerprints: Invalid features type!";
                    throw new ArgumentOutOfRangeException(msg, e);
                }
                throw e;
            }
        }

        #endregion

        #region private

        private List<MtripletPair> GetMatchingTriplets(MtripletsFeature t1, MtripletsFeature t2)
        {
            var mostSimilar = new List<MtripletPair>();
            foreach (MTriplet queryTriplet in t1.MTriplets)
            {
                var mtpPairs = t2.FindSimilarMTriplets(queryTriplet);
                if (mtpPairs != null)
                    mostSimilar.AddRange(mtpPairs);
            }
            //mostSimilar.Sort(new MtpPairComparer());
            return mostSimilar;
        }

        private List<MinutiaPair> GetReferenceMtiae(IList<MtripletPair> matchingTriplets)
        {
            var pairs = new List<MinutiaPair>();
            var matches = new Dictionary<MinutiaPair, byte>(60);
            var qMatches = new Dictionary<MTriplet, byte>(matchingTriplets.Count);
            var tMatches = new Dictionary<MTriplet, byte>(matchingTriplets.Count);
            foreach (MtripletPair pair in matchingTriplets)
                if (!qMatches.ContainsKey(pair.queryMTp) || !tMatches.ContainsKey(pair.templateMTp))
                {
                    Minutia qMtia0 = pair.queryMTp[0];
                    Minutia qMtia1 = pair.queryMTp[1];
                    Minutia qMtia2 = pair.queryMTp[2];

                    Minutia tMtia0 = pair.templateMTp[0];
                    Minutia tMtia1 = pair.templateMTp[1];
                    Minutia tMtia2 = pair.templateMTp[2];

                    Minutia qRefMtia = new Minutia();
                    qRefMtia.X = Convert.ToInt16(Math.Round((qMtia0.X + qMtia1.X + qMtia2.X) / 3.0));
                    qRefMtia.Y = Convert.ToInt16(Math.Round((qMtia0.Y + qMtia1.Y + qMtia2.Y) / 3.0));
                    double diffY = (Math.Sin(qMtia0.Angle) + Math.Sin(qMtia1.Angle) + Math.Sin(qMtia2.Angle)) / 3.0;
                    double diffX = (Math.Cos(qMtia0.Angle) + Math.Cos(qMtia1.Angle) + Math.Cos(qMtia2.Angle)) / 3.0;
                    qRefMtia.Angle = Angle.ComputeAngle(diffX, diffY);

                    Minutia tRefMtia = new Minutia();
                    tRefMtia.X = Convert.ToInt16(Math.Round((tMtia0.X + tMtia1.X + tMtia2.X) / 3.0));
                    tRefMtia.Y = Convert.ToInt16(Math.Round((tMtia0.Y + tMtia1.Y + tMtia2.Y) / 3.0));
                    diffY = (Math.Sin(tMtia0.Angle) + Math.Sin(tMtia1.Angle) + Math.Sin(tMtia2.Angle)) / 3.0;
                    diffX = (Math.Cos(tMtia0.Angle) + Math.Cos(tMtia1.Angle) + Math.Cos(tMtia2.Angle)) / 3.0;
                    tRefMtia.Angle = Angle.ComputeAngle(diffX, diffY);

                    var mPair = new MinutiaPair { QueryMtia = qRefMtia, TemplateMtia = tRefMtia };
                    if (!matches.ContainsKey(mPair))
                    {
                        matches.Add(mPair, 0);
                        pairs.Add(mPair);
                    }
                    if (!qMatches.ContainsKey(pair.queryMTp))
                        qMatches.Add(pair.queryMTp, 0);
                    if (!tMatches.ContainsKey(pair.templateMTp))
                        tMatches.Add(pair.templateMTp, 0);
                }
            return pairs;
        }

        private List<MinutiaPair> GetLocalMatchingMtiae(MtripletsFeature query, MtripletsFeature template, IList<MtripletPair> matchingTriplets)
        {
            var minutiaMatches = new List<MinutiaPair>();
            var qMatches = new Dictionary<Minutia, Minutia>(60);
            var tMatches = new Dictionary<Minutia, Minutia>(60);
            foreach (MtripletPair pair in matchingTriplets)
            {
                Minutia qMtia0 = pair.queryMTp[0];
                Minutia qMtia1 = pair.queryMTp[1];
                Minutia qMtia2 = pair.queryMTp[2];
                Minutia tMtia0 = pair.templateMTp[pair.templateMtiaOrder[0]];
                Minutia tMtia1 = pair.templateMTp[pair.templateMtiaOrder[1]];
                Minutia tMtia2 = pair.templateMTp[pair.templateMtiaOrder[2]];

                //if ((qMatches.ContainsKey(qMtia0) && qMatches[qMtia0] != tMtia0) ||
                //    (qMatches.ContainsKey(qMtia1) && qMatches[qMtia1] != tMtia1) ||
                //    (qMatches.ContainsKey(qMtia2) && qMatches[qMtia2] != tMtia2))
                //    continue;

                if (!qMatches.ContainsKey(qMtia0) || !tMatches.ContainsKey(tMtia0))
                {
                    if (!qMatches.ContainsKey(qMtia0))
                        qMatches.Add(qMtia0, tMtia0);
                    if (!tMatches.ContainsKey(tMtia0))
                        tMatches.Add(tMtia0, qMtia0);
                    minutiaMatches.Add(new MinutiaPair { QueryMtia = qMtia0, TemplateMtia = tMtia0 });
                }
                if (!qMatches.ContainsKey(qMtia1) || !tMatches.ContainsKey(tMtia1))
                {
                    if (!qMatches.ContainsKey(qMtia1))
                        qMatches.Add(qMtia1, tMtia1);
                    if (!tMatches.ContainsKey(tMtia1))
                        tMatches.Add(tMtia1, qMtia1);
                    minutiaMatches.Add(new MinutiaPair { QueryMtia = qMtia1, TemplateMtia = tMtia1 });
                }
                if (!qMatches.ContainsKey(qMtia2) || !tMatches.ContainsKey(tMtia2))
                {
                    if (!qMatches.ContainsKey(qMtia2))
                        qMatches.Add(qMtia2, tMtia2);
                    if (!tMatches.ContainsKey(tMtia2))
                        tMatches.Add(tMtia2, qMtia2);
                    minutiaMatches.Add(new MinutiaPair { QueryMtia = qMtia2, TemplateMtia = tMtia2 });
                }
            }
            return minutiaMatches;
        }

        private class MtiaMapper
        {
            public MtiaMapper(Minutia query, Minutia template)
            {
                dAngle = template.Angle - query.Angle;
                this.template = template;
                this.query = query;
            }

            public Minutia Map(Minutia m)
            {
                return new Minutia
                {
                    Angle = m.Angle + dAngle,
                    X = Convert.ToInt16(Math.Round((m.X - query.X) * Math.Cos(dAngle) - (m.Y - query.Y) * Math.Sin(dAngle) + template.X)),
                    Y = Convert.ToInt16(Math.Round((m.X - query.X) * Math.Sin(dAngle) + (m.Y - query.Y) * Math.Cos(dAngle) + template.Y))
                };
            }

            private double dAngle;
            private Minutia template;
            private Minutia query;
        }

        private class MtpPairComparer : IComparer<MtripletPair>
        {
            public int Compare(MtripletPair x, MtripletPair y)
            {
                return (x == y) ? 0 : (x.matchingValue < y.matchingValue) ? 1 : -1;
            }
        }

        private List<MinutiaPair> GetGlobalMatchingMtiae(List<MinutiaPair> localMatchingPairs, MinutiaPair refMtiaPair, ref int notMatchingCount)
        {
            List<MinutiaPair> globalMatchingMtiae = new List<MinutiaPair>(localMatchingPairs.Count);
            var qMatches = new Dictionary<Minutia, Minutia>(localMatchingPairs.Count);
            var tMatches = new Dictionary<Minutia, Minutia>(localMatchingPairs.Count);

            MtiaMapper mm = new MtiaMapper(refMtiaPair.QueryMtia, refMtiaPair.TemplateMtia);
            int currNotMatchingMtiaCount = 0;
            int i;
            for (i = 0; i < localMatchingPairs.Count; i++)
            {
                MinutiaPair mtiaPair = localMatchingPairs[i];
                if (!qMatches.ContainsKey(mtiaPair.QueryMtia) && !tMatches.ContainsKey(mtiaPair.TemplateMtia))
                {
                    Minutia query = mm.Map(mtiaPair.QueryMtia);
                    Minutia template = mtiaPair.TemplateMtia;
                    if (dist.Compare(query, template) <= gdThr && MatchDirections(query, template))
                    {
                        globalMatchingMtiae.Add(mtiaPair);
                        qMatches.Add(mtiaPair.QueryMtia, mtiaPair.TemplateMtia);
                        tMatches.Add(mtiaPair.TemplateMtia, mtiaPair.QueryMtia);
                    }
                    else
                        currNotMatchingMtiaCount++;
                }
                if (currNotMatchingMtiaCount >= notMatchingCount)
                    break;
            }
            if (i == localMatchingPairs.Count)
            {
                notMatchingCount = currNotMatchingMtiaCount;
                return globalMatchingMtiae;
            }
            return null;
        }

        private bool MatchDirections(Minutia query, Minutia template)
        {
            return Angle.DifferencePi(query.Angle, template.Angle) <= gaThr;
        }

        private int gdThr = 12;

        private double gaThr = Math.PI / 6;

        private readonly MtiaEuclideanDistance dist = new MtiaEuclideanDistance();

        #endregion
    }
}