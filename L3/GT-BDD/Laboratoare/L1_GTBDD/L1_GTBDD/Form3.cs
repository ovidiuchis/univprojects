using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace L1_GTBDD
{
    public partial class AddTableFrame : Form
    {
        private SqlConnection con;

        public AddTableFrame(SqlConnection conection)
            
        {
            con = conection;
            InitializeComponent();
        }
        private void Initialize()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            String s = "Select * from sys.types";
            cmd.CommandText = s;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                comboBox1.Items.Add(reader[0]);
            }
            reader.Close();

        }
        private void button1_Click(object sender, EventArgs e)
        {
           SqlCommand cmd=new SqlCommand();
           String s = "Create table ";
                s+=textBox1.Text;
            s+=" ( ";
            s+=textBox2.Text;
            s+=" ";
            s+=comboBox1.SelectedItem.ToString();
            s+=" )";
            cmd.Connection=con;
            cmd.CommandText = s;
            cmd.ExecuteNonQuery();
            this.Dispose();

        }

        private void Form3_Load(object sender, EventArgs e)
        {
            Initialize();
        }
    }
}
