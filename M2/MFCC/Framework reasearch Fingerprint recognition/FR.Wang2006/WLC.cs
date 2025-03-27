using System;
using System.Collections.Generic;
using PatternRecognition.FingerprintRecognition.Core;

namespace PatternRecognition.FingerprintRecognition.Matchers
{
    /// <summary>
    ///     An implementation of the algorithm proposed by Wang et al. in 2006.
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
    ///                W. Wang, J. Li, and W. Chen, "Fingerprint minutiae matching based on coordinate system bank and global optimum alignment," in 18th International Conference on Pattern Recognition, 2006, vol. 4, pp. 401-404.
    ///             </item>
    ///         </list>
    ///     </para>
    /// </remarks>
    public class WLC : Matcher<List<Minutia>>, IMinutiaMatcher
    {
        /// <summary>
        ///     Matches the specified minutia lists.
        /// </summary>
        /// <param name="query">
        ///     The query minutia list.
        /// </param>
        /// <param name="template">
        ///     The template minutia list.
        /// </param>
        /// <returns>
        ///     The fingerprint similarity value.
        /// </returns>
        public override double Match(List<Minutia> query, List<Minutia> template)
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
            try
            {
                matchingMtiae = new List<MinutiaPair>();
                List<Minutia> queryMinutiae = query as List<Minutia>;
                List<Minutia> templateMinutiae = template as List<Minutia>;

                MinutiaPair refPair = GetRotationParams(queryMinutiae, templateMinutiae);
                if (refPair == null)
                    return 0;
                matchingMtiae = GlobalMatch(queryMinutiae, templateMinutiae, refPair);

                if (matchingMtiae.Count >= mtiaCountThr)
                    return 1.0 * (queryMinutiae.Count + templateMinutiae.Count) * matchingMtiae.Count / (queryMinutiae.Count * queryMinutiae.Count + templateMinutiae.Count * templateMinutiae.Count);
                else
                    return 0;
            }
            catch (Exception e)
            {
                if (query.GetType() != typeof(List<Minutia>) || template.GetType() != typeof(List<Minutia>))
                {
                    string msg = "Unable to match fingerprints: Invalid features type!";
                    throw new ArgumentOutOfRangeException(msg, e);
                }
                throw e;
            }
        }

        private List<MinutiaPair> GlobalMatch(List<Minutia> queryMinutiae, List<Minutia> templateMinutiae, MinutiaPair refPair)
        {
            Minutia mappedMtia;
            // Calculando las posibles coincidencias
            List<MinutiaPair> currMatchingMtiae = new List<MinutiaPair>(queryMinutiae.Count);
            for (int k = 0; k < queryMinutiae.Count; k++)
            {
                mappedMtia = MapMinutia(refPair.QueryMtia, refPair.TemplateMtia, queryMinutiae[k]);
                for (int m = 0; m < templateMinutiae.Count; m++)
                {
                    double sim = MatchMinutiae(mappedMtia, templateMinutiae[m]);
                    if (sim > 0)
                    {
                        currMatchingMtiae.Add(new MinutiaPair
                        {
                            QueryMtia = queryMinutiae[k],
                            TemplateMtia = templateMinutiae[m],
                            MatchingValue = sim
                        });
                        queryMinutiae[k].Flag = false;
                        templateMinutiae[m].Flag = false;
                    }
                }
            }

            // Reduciendo las coincidencias
            double currentSim = 0;
            currMatchingMtiae.Sort(new MtiaPairComparer());
            var finalMatching = new List<MinutiaPair>(60);
            for (int k = 0; k < currMatchingMtiae.Count; k++)
            {
                var pair = currMatchingMtiae[k];
                if (!pair.QueryMtia.Flag && !pair.TemplateMtia.Flag)
                {
                    finalMatching.Add(pair);
                    pair.QueryMtia.Flag = true;
                    pair.TemplateMtia.Flag = true;
                    currentSim += pair.MatchingValue;
                }
            }

            return finalMatching;
        }

        private MinutiaPair GetRotationParams(List<Minutia> queryMinutiae, List<Minutia> templateMinutiae)
        {
            List<MinutiaPair> matchingMtiae = new List<MinutiaPair>();

            Minutia mappedMtia;
            // Doble ciclo para alinear por todos los posibles pares de minucias coincidentes
            for (int i = 0; i < queryMinutiae.Count; i++)
                for (int j = 0; j < templateMinutiae.Count; j++)
                {
                    // Calculando las posibles coincidencias
                    List<MinutiaPair> currMatchingMtiae = new List<MinutiaPair>(queryMinutiae.Count);
                    for (int k = 0; k < queryMinutiae.Count; k++)
                    {
                        mappedMtia = MapMinutia(queryMinutiae[i], templateMinutiae[j], queryMinutiae[k]);
                        for (int m = 0; m < templateMinutiae.Count; m++)
                            if (
                                MatchBetaAngle(queryMinutiae[i], templateMinutiae[j], mappedMtia, templateMinutiae[m]))
                            {
                                double sim = MatchMinutiae(mappedMtia, templateMinutiae[m]);
                                if (sim > 0)
                                {
                                    currMatchingMtiae.Add(new MinutiaPair
                                    {
                                        QueryMtia = queryMinutiae[k],
                                        TemplateMtia = templateMinutiae[m],
                                        MatchingValue = sim
                                    });
                                    queryMinutiae[k].Flag = false;
                                    templateMinutiae[m].Flag = false;
                                }
                            }
                    }

                    // Reduciendo las coincidencias
                    double currentSim = 0;
                    currMatchingMtiae.Sort(new MtiaPairComparer());
                    var finalMatching = new List<MinutiaPair>(60);
                    for (int k = 0; k < currMatchingMtiae.Count; k++)
                    {
                        var pair = currMatchingMtiae[k];
                        if (!pair.QueryMtia.Flag && !pair.TemplateMtia.Flag)
                        {
                            finalMatching.Add(pair);
                            pair.QueryMtia.Flag = true;
                            pair.TemplateMtia.Flag = true;
                            currentSim += pair.MatchingValue;
                        }
                    }
                    matchingMtiae.AddRange(finalMatching);
                }

            if (matchingMtiae.Count > 0)
                return AvgMinutiae.Compute(matchingMtiae);
            else
                return null;
        }
        
        #region private

        private static Minutia MapMinutia(Minutia query, Minutia template, Minutia toMap)
        {
            double dAngle = template.Angle - query.Angle;
            double newAngle = toMap.Angle + dAngle;
            return new Minutia
            {
                Angle = (newAngle > 2 * Math.PI) ? newAngle - 2 * Math.PI : (newAngle < 0) ? newAngle + 2 * Math.PI : newAngle,
                X = Convert.ToInt16(Math.Round((toMap.X - query.X) * Math.Cos(dAngle) - (toMap.Y - query.Y) * Math.Sin(dAngle) + template.X)),
                Y = Convert.ToInt16(Math.Round((toMap.X - query.X) * Math.Sin(dAngle) + (toMap.Y - query.Y) * Math.Cos(dAngle) + template.Y))
            };
        }

        private static bool MatchBetaAngle(Minutia qMtia0, Minutia tMtia0, Minutia qMtia1, Minutia tMtia1)
        {
            double qbeta = Angle.Difference2Pi(qMtia0.Angle, qMtia1.Angle);
            double tbeta = Angle.Difference2Pi(tMtia0.Angle, tMtia1.Angle);
            return Angle.DifferencePi(qbeta, tbeta) > gaThr ? false : true;
        }

        private static double MatchDistance(Minutia query, Minutia template)
        {
            double d = MtiaDistance(query, template);
            return (d > gdThr) ? 0 : 1 - d / gdThr;
        }

        private static double MatchDirections(Minutia query, Minutia template)
        {
            double d = Angle.DifferencePi(query.Angle, template.Angle);
            return (d > gaThr) ? 0 : 1 - d / gaThr;
        }

        private static double MatchMinutiae(Minutia query, Minutia template)
        {
            double distSim = MatchDistance(query, template);
            if (distSim == 0)
                return 0;
            double dirSim = MatchDirections(query, template);
            if (dirSim == 0)
                return 0;
            return distSim * dirSim;
        }

        private static double MtiaDistance(Minutia m0, Minutia m1)
        {
            double diff0 = m0.Y - m1.Y;
            double diff1 = m0.X - m1.X;
            return Math.Sqrt(diff0 * diff0 + diff1 * diff1);
        }

        private class MtiaPairComparer : IComparer<MinutiaPair>
        {
            public int Compare(MinutiaPair x, MinutiaPair y)
            {
                return (x == y) ? 0 : (x.MatchingValue < y.MatchingValue) ? 1 : -1;
            }
        }

        private const byte gdThr = 12;

        private const double gaThr = Math.PI / 6;

        private const int mtiaCountThr = 4;

        #endregion
    }
}
