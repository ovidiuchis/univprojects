/*
 * Created by: Miguel Angel Medina P�rez (miguel.medina.perez@gmail.com)
 *             Andr�s Eduardo Guti�rrez Rodr�guez (andres@bioplantas.cu)
 * Created: 
 * Comments by: Miguel Angel Medina P�rez (miguel.medina.perez@gmail.com)
 */

using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using PatternRecognition.FingerprintRecognition.Core;
using PatternRecognition.FingerprintRecognition.FeatureRepresentation;

namespace PatternRecognition.FingerprintRecognition.Matchers
{
    /// <summary>
    ///     An implementation of the minutiae matching algorithm proposed by Qi et al. in 2005. 
    /// </summary>
    /// <remarks>
    ///     <para>
    ///         This is an implementation of the minutiae matching algorithm proposed by Qi et al. [1] in 2005. 
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
    ///                J. Qi, S. Yang, and Y. Wang, "Fingerprint matching combining the global orientation field with minutia," Pattern Recognition Letters, vol. 26, pp. 2424-2430, 2005.
    ///             </item>
    ///         </list>
    ///     </para>
    /// </remarks>
    public class QYW : Matcher<Qi2005Features>, IMinutiaMatcher
    {
        #region public

        /// <summary>
        ///     Distance threshold for the global minutia matching step.
        /// </summary>
        /// <remarks>
        ///     This threshold is used to compare minutia distances in the global minutia matching step. For more information refer to the original paper.
        /// </remarks>
        public int GlobalDistThr
        {
            get { return gDistThr; }
            set { gDistThr = value; }
        }

        /// <summary>
        ///     Angle threshold for the global minutia matching step.
        /// </summary>
        /// <remarks>
        ///     This threshold is used to compare angles in the global minutia matching step. For more information refer to the original paper.
        /// </remarks>
        public double GlobalAngleThr
        {
            get { return gAngThr * 180 / Math.PI; }
            set { gAngThr = value * Math.PI / 180; }
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
        public override double Match(Qi2005Features query, Qi2005Features template)
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
            Qi2005Features qQi2005Features = query as Qi2005Features;
            Qi2005Features tQi2005Features = template as Qi2005Features;
            try
            {
                matchingMtiae = null;
                double[,] simArr;
                var localMatchingMtiae = GetLocalMatchingMtiae(qQi2005Features, tQi2005Features, out simArr);
                if (localMatchingMtiae.Count == 0)
                    return 0;
                matchingMtiae = GetGlobalMatchingMtiae(localMatchingMtiae, localMatchingMtiae[0]);

                return Eval(qQi2005Features, tQi2005Features, matchingMtiae, simArr);
            }
            catch (Exception e)
            {
                if (query.GetType() != typeof(Qi2005Features) || template.GetType() != typeof(Qi2005Features))
                {
                    string msg = "Unable to match fingerprints: Invalid features type!";
                    throw new ArgumentOutOfRangeException(msg, e);
                }
                throw e;
            }
        }

        #endregion

        #region private

        private IList<MinutiaPair> GetLocalMatchingMtiae(Qi2005Features query, Qi2005Features template, out double[,] simArr)
        {
            var mtiaPairs = new List<MinutiaPair>(query.Minutiae.Count * template.Minutiae.Count);
            simArr = new double[query.Minutiae.Count, template.Minutiae.Count];

            for (int i = 0; i < query.Minutiae.Count; i++)
            {
                var qMtia = query.Minutiae[i];
                for (int j = 0; j < template.Minutiae.Count; j++)
                {
                    var tMtia = template.Minutiae[j];
                    double currSim = qMtia.Compare(tMtia);

                    simArr[i, j] = currSim;

                    if (currSim != 0)
                    {
                        var currMtiaPair = new MinutiaPair
                        {
                            QueryMtia = qMtia,
                            TemplateMtia = tMtia,
                            MatchingValue = currSim
                        };
                        mtiaPairs.Add(currMtiaPair);
                    }
                }
            }
            mtiaPairs.Sort(new MtiaPairComparer());
            return mtiaPairs;
        }

        private List<MinutiaPair> GetGlobalMatchingMtiae(IList<MinutiaPair> localMatchingPairs, MinutiaPair refMtiaPair)
        {
            var globalMatchingMtiae = new List<MinutiaPair>(localMatchingPairs.Count);
            var qMatches = new Dictionary<Minutia, Minutia>(localMatchingPairs.Count);
            var tMatches = new Dictionary<Minutia, Minutia>(localMatchingPairs.Count);
            qMatches.Add(refMtiaPair.QueryMtia, refMtiaPair.TemplateMtia);
            tMatches.Add(refMtiaPair.TemplateMtia, refMtiaPair.QueryMtia);

            MtiaMapper mm = new MtiaMapper(refMtiaPair.QueryMtia, refMtiaPair.TemplateMtia);
            Minutia refQuery = mm.Map(refMtiaPair.QueryMtia);
            Minutia refTemplate = refMtiaPair.TemplateMtia;
            for (int i = 1; i < localMatchingPairs.Count; i++)
            {
                MinutiaPair mtiaPair = localMatchingPairs[i];
                if (!qMatches.ContainsKey(mtiaPair.QueryMtia) && !tMatches.ContainsKey(mtiaPair.TemplateMtia))
                {
                    Minutia query = mm.Map(mtiaPair.QueryMtia);
                    Minutia template = mtiaPair.TemplateMtia;
                    if (MatchDistance(refQuery, refTemplate, query, template) && MatchDirections(query, template) && MatchPosition(refQuery, refTemplate, query, template))
                    {
                        globalMatchingMtiae.Add(mtiaPair);
                        qMatches.Add(mtiaPair.QueryMtia, mtiaPair.TemplateMtia);
                        tMatches.Add(mtiaPair.TemplateMtia, mtiaPair.QueryMtia);
                    }
                }
            }
            globalMatchingMtiae.Add(refMtiaPair);
            return globalMatchingMtiae;
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

        private bool MatchDistance(Minutia refQuery, Minutia refTemplate, Minutia query, Minutia template)
        {
            double d0 = dist.Compare(refQuery, query);
            double d1 = dist.Compare(refTemplate, template);
            return Math.Abs(d0 - d1) <= gDistThr;
        }

        private bool MatchPosition(Minutia refQuery, Minutia refTemplate, Minutia query, Minutia template)
        {
            Minutia qMtiai = refQuery;
            Minutia qMtiaj = query;
            double x = qMtiai.X - qMtiaj.X;
            double y = qMtiai.Y - qMtiaj.Y;
            double qAngle = Angle.ComputeAngle(x, y);

            Minutia tMtiai = refTemplate;
            Minutia tMtiaj = template;
            x = tMtiai.X - tMtiaj.X;
            y = tMtiai.Y - tMtiaj.Y;
            double tAngle = Angle.ComputeAngle(x, y);

            return Angle.DifferencePi(qAngle, tAngle) <= gAngThr;
        }

        private bool MatchDirections(Minutia query, Minutia template)
        {
            return Angle.DifferencePi(query.Angle, template.Angle) <= gAngThr;
        }

        private class MtiaPairComparer : IComparer<MinutiaPair>
        {
            public int Compare(MinutiaPair x, MinutiaPair y)
            {
                return (x == y) ? 0 : (x.MatchingValue < y.MatchingValue) ? 1 : -1;
            }
        }

        private double Eval(Qi2005Features query, Qi2005Features template, List<MinutiaPair> matchingPair, double[,] simArr)
        {
            var qIndex = new Dictionary<Minutia, int>(query.Minutiae.Count);
            for (int i = 0; i < query.Minutiae.Count; i++)
                qIndex.Add(query.Minutiae[i], i);
            var tIndex = new Dictionary<Minutia, int>(template.Minutiae.Count);
            for (int i = 0; i < template.Minutiae.Count; i++)
                tIndex.Add(template.Minutiae[i], i);

            var qCenterMtia = matchingPair[matchingPair.Count - 1].QueryMtia;
            var tCenterMtia = matchingPair[matchingPair.Count - 1].TemplateMtia;

            // Computing query bounding region
            var qPolygon = GetBounds(query);
            qPolygon =
                (new PolygonMapper(qCenterMtia, tCenterMtia)).Map(qPolygon);
            var qBoundingRegion = new FingerprintRegion(qPolygon);
            // Computing template bounding region
            var tPolygon = GetBounds(template);
            var tBoundingRegion = new FingerprintRegion(tPolygon);

            // Mapping query minutiae
            var mtiaMapper = new MtiaMapper(qCenterMtia, tCenterMtia);
            var qMtiae = new List<Minutia>(query.Minutiae.Count);
            for (int i = 0; i < query.Minutiae.Count; i++)
            {
                var mtia = query.Minutiae[i];
                qMtiae.Add(mtiaMapper.Map(mtia));
            }

            int qCount = 0;
            for (int i = 0; i < qMtiae.Count; i++)
            {
                var mtia = qMtiae[i];
                if (tBoundingRegion.Contains(mtia))
                    qCount++;
            }
            int tCount = 0;
            foreach (var mtia in template.Minutiae)
                if (qBoundingRegion.Contains(mtia))
                    tCount++;

            double sum = 0;
            foreach (var mtiaPair in matchingPair)
            {
                int i = qIndex[mtiaPair.QueryMtia];
                int j = tIndex[mtiaPair.TemplateMtia];
                sum += simArr[i, j];
            }

            return qCount >= 6 && tCount >= 6 ? 1.0 * sum / Math.Max(qCount, tCount) : 0;
        }

        private class FingerprintRegion
        {
            public FingerprintRegion(Point[] polygon)
            {
                byte[] types = new byte[polygon.Length];
                int i;
                for (i = 0; i < polygon.Length; i++)
                    types[i] = (byte)PathPointType.Line;
                path = new GraphicsPath(polygon, types);
            }

            public bool Contains(Minutia m)
            {
                return path.IsVisible(m.X, m.Y);
            }

            private readonly GraphicsPath path;
        }

        private Point[] GetBounds(Qi2005Features features)
        {
            int minX = int.MaxValue;
            int minY = int.MaxValue;
            int maxX = int.MinValue;
            int maxY = int.MinValue;
            foreach (var mtiaDesc in features.Minutiae)
            {
                if (minX > mtiaDesc.Minutia.X)
                    minX = mtiaDesc.Minutia.X;

                if (minY > mtiaDesc.Minutia.Y)
                    minY = mtiaDesc.Minutia.Y;

                if (maxX < mtiaDesc.Minutia.X)
                    maxX = mtiaDesc.Minutia.X;

                if (maxY < mtiaDesc.Minutia.Y)
                    maxY = mtiaDesc.Minutia.Y;
            }
            var resultingBound = new Point[5];
            resultingBound[0] = new Point(minX - 1, maxY + 1);
            resultingBound[1] = new Point(maxX + 1, maxY + 1);
            resultingBound[2] = new Point(maxX + 1, minY - 1);
            resultingBound[3] = new Point(minX - 1, minY - 1);
            resultingBound[4] = new Point(minX - 1, maxY + 1);
            return resultingBound;
        }

        private class PolygonMapper
        {
            public PolygonMapper(Minutia query, Minutia template)
            {
                dAngle = template.Angle - query.Angle;
                this.template = template;
                this.query = query;
            }

            public Point[] Map(Point[] polygon)
            {
                var newPolygon = new Point[polygon.Length];
                for (int i = 0; i < polygon.Length; i++)
                {
                    newPolygon[i].X =
                        Convert.ToInt16(
                            Math.Round((polygon[i].X - query.X) * Math.Cos(dAngle) -
                                       (polygon[i].Y - query.Y) * Math.Sin(dAngle) + template.X));
                    newPolygon[i].Y =
                        Convert.ToInt16(
                            Math.Round((polygon[i].X - query.X) * Math.Sin(dAngle) +
                                       (polygon[i].Y - query.Y) * Math.Cos(dAngle) + template.Y));
                }
                return newPolygon;
            }

            private double dAngle;
            private Minutia template;
            private Minutia query;
        }

        private int gDistThr = 8;

        private double gAngThr = Math.PI / 6;

        private readonly MtiaEuclideanDistance dist = new MtiaEuclideanDistance();

        #endregion
    }
}