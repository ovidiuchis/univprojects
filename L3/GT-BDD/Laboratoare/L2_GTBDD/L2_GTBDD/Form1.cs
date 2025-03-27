using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace L2_GTBDD
{
    public partial class Form1 : Form
    {
        public SqlConnection con;
        private int codS;
        private int codC;
        private int codP;
  
       

        public Form1()
        {
            Initialize();
            InitializeComponent();
           

        }

        private void LoadDataforCatalog()
        {
            SqlCommand com = new SqlCommand("Select distinct data from Catalog ", con);
            SqlDataReader r = com.ExecuteReader();
            while (r.Read())
                comboBox5.Items.Add(r[0]);
            r.Close();

        }

        private void LoadStores()
        {
            String s = "Select * from SistemeCE";
            SqlCommand com = new SqlCommand(s, con);
            SqlDataReader r = com.ExecuteReader();
            while (r.Read())
            {
                comboBox2.Items.Add(r["denumire"]);
            }
            r.Close();


        }

        private void LoadClients()
        {
            String s = "Select * from Clienti";
            SqlCommand com = new SqlCommand(s, con);
            SqlDataReader r = com.ExecuteReader();

            while (r.Read())
            {
                comboBox1.Items.Add(r["nume"]);
            }
            r.Close();

        }
        private bool Initialize()
        {
            con = new SqlConnection("Data Source=OVI\\SQLEXPRESS;Initial Catalog=GTBDD;Integrated Security=True");
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
                return true;
            }
            return false;

        }

 

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("Select codc from Clienti where nume=@den", con);
            com.Parameters.AddWithValue("@den", comboBox1.SelectedItem.ToString());
            SqlDataReader r = com.ExecuteReader();
            r.Read();
            codC = System.Convert.ToInt32(r[0]);
            r.Close();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox3.Items.Clear();
            SqlCommand com = new SqlCommand();
            com.Connection = con;
            SqlCommand com3=new SqlCommand();
            com.CommandText = "Select distinct data from Catalog where cods=@codstore";
            SqlCommand com2=new SqlCommand();
            //com3.Connection = con;
            com2.Connection = con;
            com2.CommandText="Select cods from SistemeCE where denumire=@den";
            com2.Parameters.AddWithValue("@den",comboBox2.SelectedItem);
            SqlDataReader reader=com2.ExecuteReader();
            reader.Read();
            codS = System.Convert.ToInt32(reader[0]);
            com.Parameters.AddWithValue("@codstore", reader[0]);
            reader.Close();
            reader = com.ExecuteReader();

            while (reader.Read())
                comboBox3.Items.Add(reader[0]);
            reader.Close();

        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox4.Items.Clear();      

            SqlCommand com3 = new SqlCommand("Select cods from SistemeCE where denumire=@store", con);
            com3.Parameters.AddWithValue("@store", comboBox2.SelectedItem.ToString());
            SqlDataReader reader = com3.ExecuteReader();
            reader.Read();

            SqlCommand com2 = new SqlCommand("Select distinct codp from Catalog where data=", con);
            com2.CommandText += "'";
            com2.CommandText += comboBox3.SelectedItem.ToString();
            com2.CommandText += "' and cods=";
            com2.CommandText += System.Convert.ToInt32(reader[0]);
            reader.Close();
            reader = com2.ExecuteReader();
            String s = null;
            while (reader.Read())
            {
                s += reader[0].ToString();

                s += ",";
            }
            reader.Close();
         
            s = s.TrimEnd(',');       
            s += ")";
            SqlCommand com = new SqlCommand("Select denumire from Produse where codp in (", con);
            com.CommandText += s;  
            reader = com.ExecuteReader();
            while (reader.Read())
                comboBox4.Items.Add(reader[0]);
            reader.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            // adaugam o tranzactie

            SqlCommand tranz = new SqlCommand();
            tranz.Connection = con;
            String data =DateTime.Now.ToShortDateString();
            tranz.CommandText = "exec add_transaction  @cods ,@codc ,@data,@codp,@cant ";
            tranz.Parameters.AddWithValue("@cods", codS);
            tranz.Parameters.AddWithValue("@codc", codC);
            tranz.Parameters.AddWithValue("@codp", codP);
            tranz.Parameters.AddWithValue("@data", data);
            tranz.Parameters.AddWithValue("@cant", System.Convert.ToInt32(textBox1.Text));
            SqlDataReader r = tranz.ExecuteReader();
            
            if (r.Read())
            {
                MessageBox.Show("Am adaugat o tranzactie de valoare: "+ System.Convert.ToInt32(r[0]));
            }
            r.Close();

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("Select codp from Produse where denumire=@den", con);
            com.Parameters.AddWithValue("@den", comboBox4.SelectedItem.ToString());
            SqlDataReader r = com.ExecuteReader();
            r.Read();
            codP = System.Convert.ToInt32(r[0]);
            r.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            MessageBox.Show(" CodP: " + codP + " CodC: " + codC + " CodS: " + codS);
         
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowCatalogFrame scf = new ShowCatalogFrame(con, comboBox5.SelectedItem.ToString());
            scf.Show();

        }

        private void creazaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("exec create_tables", con);
            com.ExecuteNonQuery();
        }

        private void populeazaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("exec populate_tables", con);
            com.ExecuteNonQuery();
        }

        private void loadDataToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LoadClients();
            LoadStores();
            LoadDataforCatalog();

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

       

       
    }
}
