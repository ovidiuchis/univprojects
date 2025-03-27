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
    public partial class AddColFrame : Form
    {
        private SqlConnection con;
        private String tabName;
        public AddColFrame(SqlConnection c,String tab)
        {
            con = c;
            tabName = tab;
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            String s = "Select * from sys.types";
            cmd.CommandText = s;
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                comboBox1.Items.Add(reader["name"]);
            }
            reader.Close();

           
        }
        public void addCol(String numeCol, String tipCol)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            String s = "alter table ";
            s += tabName;
            s += " add ";
            s += numeCol;
            s += " ";
            s += tipCol;
            cmd.CommandText = s;
            cmd.ExecuteNonQuery(); 
               
           // updateColumns(listBox1.SelectedItem.ToString());
        }

        private void button1_Click(object sender, EventArgs e)
        {
            addCol(textBox1.Text, comboBox1.SelectedItem.ToString());
            this.Dispose();
        }

    }
}
