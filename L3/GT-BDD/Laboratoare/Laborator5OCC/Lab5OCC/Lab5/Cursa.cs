using System;
using System.Collections.Generic;
using System.Text;

namespace Lab5
{
    public class Cursa
    {
        private int id;
        private string denumire;
        private int nrLocuri;
        private int nrLocuriDisponibile;

        public Cursa(int id, string den, int locuri, int locuriD)
        {
            this.id = id;
            this.denumire = den;
            this.nrLocuri = locuri;
            this.nrLocuriDisponibile = locuriD;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int NrLocuriDisponibile
        {
            get { return nrLocuriDisponibile; }
            set { nrLocuriDisponibile = value; }
        }
        public int NrLocuri
        {
            get { return nrLocuri; }
            set { nrLocuri = value; }
        }
        public string Denumire
        {
            get { return denumire; }
            set { denumire = value; }
        }


        public override String ToString()
        {
            return denumire;
        }
    }
}

