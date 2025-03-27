using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Lab5
{
    public partial class Monitorizare : Form
    {
        public Monitorizare()
        {
            InitializeComponent();
        }

        private void Monitorizare_Load(object sender, EventArgs e)
        {
            SqlConnection conexiune;
            conexiune = new SqlConnection("Data Source=(local); Initial Catalog=Lab5b; Integrated Security=true;");
            SqlCommand com1 = new SqlCommand();
            com1.CommandText = "Select * from Tranzactii";
            com1.Connection = conexiune;
            conexiune.Open();

            SqlDataReader dr = com1.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(new object[] { dr[0], dr[1], dr[2] });
            }
            dr.Close();
            conexiune.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection conexiune;
            conexiune = new SqlConnection("Data Source=(local); Initial Catalog=Lab5b; Integrated Security=true;");
            SqlCommand com1 = new SqlCommand();
            com1.CommandText = "Select * from Tranzactii";
            com1.Connection = conexiune;
            conexiune.Open();

            SqlDataReader dr = com1.ExecuteReader();
            dataGridView1.Rows.Clear();
            while (dr.Read())
            {
                dataGridView1.Rows.Add(new object[] { dr[0], dr[1], dr[2] });
            }
            dr.Close();
            conexiune.Close();
        }
    }
}
