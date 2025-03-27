using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
//using GraphRepresentationConverter;

namespace AG_L1
{
    public partial class Form1 : Form
    {
        public int[][] matrix;

        public Form1()
        {
            InitializeComponent();
        }

        public void addArcForm(int dela, int la)
        {
            matrix[dela][la] = 1;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            richTextBox1.Visible = true;
            button2.Visible = true;
            textBox1.Visible = false;
            label1.Visible = false;
            button3.Visible = true;
            button4.Visible = true;
            label2.Visible = true;
            //pictureBox1.Visible = false;
            

            int m = int.Parse( textBox1.Text);
            matrix = new int[m][];


            for (int i = 0; i < m; i++)
            {
                matrix[i] = new int[m];
                for (int j = 0; j < m; j++)
                    matrix[i][j] = 0;
            }
            updateVisualMatrix();


            


            

      }
        public  void updateVisualMatrix()
        {
            richTextBox1.Text = getVisualMatrix();
        }

        private string getVisualMatrix()
        {
            string s = "";
            for (int i=0;i<matrix.Length;i++)
            {
                for (int j = 0; j < matrix.Length; j++)
                {
                    s = s + matrix[i][j].ToString();
                    s = s + "  ";
                }
                s = s + "\n";
                
            }
            return s;




        }

        private void button2_Click(object sender, EventArgs e)
        {
            richTextBox2.Visible = true;
            button5.Visible = true;

           
          

            GraphRepresentationConverver grc = new GraphRepresentationConverver(matrix);
            grc.convert();
            string s = "";
            List<ListEntries> l = grc.getLista();
            ListEntries a = new ListEntries();
            for (int k = 0; k < l.Count; k++)
            {
                int kk = k;
                kk++;
                s = s + kk.ToString();
                s = s + ": ";
                a = l[k];
                for (int p = 0; p < a.size(); p++)
                {
                    int pp = a.getEntryAt(p);
                    pp++;
                    s = s + pp.ToString();
                    s = s + " , ";

                }
                s = s.Remove(s.Length - 3, 3);
                s = s + "\n";
            }
            richTextBox2.Text = s;
        }


        private void button3_Click(object sender, EventArgs e)
        {
            addArcForm adf = new addArcForm(matrix);
            adf.Show();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            updateVisualMatrix();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Pe hartie!");
        }
    }
}
