using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace AG_L1
{
    public partial class addArcForm : Form
    {
        int[][] matrix;
        public addArcForm(int[][] m)
        {
            matrix = m;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int dela = int.Parse(textBox1.Text);
            int la = int.Parse(textBox2.Text);
            matrix[--dela][--la] = 1;
            this.Dispose();
            

        }

        private void addArcForm_Load(object sender, EventArgs e)
        {

        }
    }
}
