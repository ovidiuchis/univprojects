/*
 * Created by: Miguel Angel Medina Pérez (miguel.medina.perez@gmail.com)
 * Created: 
 * Comments by: Miguel Angel Medina Pérez (miguel.medina.perez@gmail.com)
 */

using System;
using System.Collections.Generic;
using System.IO;

namespace PatternRecognition.FingerprintRecognition.Core
{
    /// <summary>
    ///     Allows loading minutiae from files with ISO/IEC 19794-2:2005 format.
    /// </summary>
    /// <remarks>
    ///     <para>
    ///         This class assumes that there is only one fingerprint for each template file.
    ///     </para>
    /// </remarks>
    public static class ISOMinutiaeLoader
    {
        /// <summary>
        ///     Load minutiae from the file in the specified location.
        /// </summary>
        /// <param name="fileName">
        ///     The location of the file with the minutiae.
        /// </param>
        /// <returns>
        ///     The minutia list loaded from the specified file.
        /// </returns>
        public static List<Minutia> Load(string fileName)
        {
            FileStream fs = new FileStream(fileName, FileMode.Open);
            List<Minutia> list = new List<Minutia>(60);
            try
            {
                byte[] data = new byte[28];
                fs.Read(data, 0, 28);
                byte mtiaeCount = data[27];
                data = new byte[6];
                // Reading minutiae
                for (int i = 0; i < mtiaeCount; i++)
                {
                    fs.Read(data, 0, 6);
                    int mtiaTypeCode = (data[0] >> 6) & 3;
                    MinutiaType mtiaType = mtiaTypeCode == 0
                                               ? MinutiaType.Unknown
                                               : mtiaTypeCode == 1 ? MinutiaType.End : MinutiaType.Bifurcation;

                    int x = ((data[0] & 63) << 8) | (data[1]);
                    int y = ((data[2] & 63) << 8) | (data[3]);
                    double angle = data[4] * 2.0 * Math.PI / 256.0;

                    Minutia mtia = new Minutia((short)x, (short)y, angle);
                    mtia.MinutiaType = mtiaType;
                    list.Add(mtia);
                }
            }
            finally
            {
                fs.Close();
            }

            return list;
        }
    }
}