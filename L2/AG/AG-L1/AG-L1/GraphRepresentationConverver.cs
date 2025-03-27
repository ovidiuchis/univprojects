using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AG_L1
{
    class GraphRepresentationConverver
    {
        public int[][] matrix;
        public List <ListEntries> listaA;
        public GraphRepresentationConverver(int[][] m)
        {
            this.matrix = m;
            listaA = new List<ListEntries>();
        }
        public void convert()
        {
            for (int i=0; i<matrix.Length; i++)
            {
                ListEntries en = new ListEntries();
                for( int j=0; j< matrix.Length ; j++)
                {                    
                    if (matrix[i][j] == 1 )                       
                       en.addEntry((j));
                }
                listaA.Add(en);                

            }
                      

        
        }
        public List<ListEntries> getLista()
        {
            return listaA;
        }


 
    }
}
