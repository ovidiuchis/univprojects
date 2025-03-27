using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Lab4
{
    public partial class Start : Form
    {
        public Start()
        {
            InitializeComponent();
        
        }

        private void Start_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String s = textBox1.Text.ToString();
           MessageBox.Show(s);        
           RezervariForm f1= new RezervariForm(s);
           //Data Source=OVI\SQLEXPRESS;Initial Catalog=GTBDD;Integrated Security=True
            f1.Show();
            

        }

        private void button2_Click(object sender, EventArgs e)
        {
    
        }
    }
}
