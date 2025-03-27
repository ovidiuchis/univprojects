using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Collections;

namespace Lab5
{
    public partial class Form1 : Form
    {
        private SqlTransaction tranzactie;
        private SqlConnection conexiune;
        private int[] ids;
        public int idTranzactie=0;

        public SqlConnection Conexiune
        {
            get { return conexiune; }
            set { conexiune = value; }
        }

     
        public Form1()
        {
            InitializeComponent();
            conexiune = new SqlConnection("Data Source=(local); Initial Catalog=Lab5b; Integrated Security=true;");
            
        }

        private ArrayList getCurse()
        {
            SqlCommand com = new SqlCommand("select cursa from Rezervari", conexiune);
            SqlDataReader dr = com.ExecuteReader();
            ArrayList curse = new ArrayList();
            while (dr.Read())
            {
                curse.Add(dr[0]);
            }
            dr.Close();
            return curse;
        }
       

        private void Vizbutton_Click(object sender, EventArgs e)
        {
            dataGridView1.Rows.Clear();
            setIdResurse();
            try
            {
                foreach (int id in ids)
                {
                    SqlCommand cmd = new SqlCommand("SelectOCC", conexiune);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_t", idTranzactie);
                    cmd.Parameters.AddWithValue("@id_r", id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Read();
                   // Cursa c = new Cursa((int)dr[0], (string)dr[1], (int)dr[2], (int)dr[3]);
                    dataGridView1.Rows.Add(new object[] { dr[1], dr[2], dr[3] });
                    dr.Close();
                }
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }

       
        }

        private void Beginbutton_Click(object sender, EventArgs e)
        {
            conexiune.Open();

            object[] curse = getCurse().ToArray();

            comboBox2.Items.AddRange(curse);
            comboBox3.Items.AddRange(curse);

            setIdResurse();
            SqlCommand cmd = new SqlCommand("incepeTranzactieOCC", conexiune);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            idTranzactie = (int)cmd.Parameters["@id"].Value;
   
        }

        private void setIdResurse()
        {
            SqlCommand cmd = new SqlCommand("select id from Rezervari", conexiune);
            SqlDataReader dr = cmd.ExecuteReader();
            List<int> l = new List<int>();
            while (dr.Read())
            {
                l.Add((int)dr[0]);
            }
            dr.Close();
            ids = l.ToArray();
        }


        private void Commitbutton_Click(object sender, EventArgs e) //adica validare
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ValidareOCC", conexiune);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_t", idTranzactie);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Validare reusita!");

            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
                conexiune.Close();
            }
           
            //conexiune.Close();
        }

        private void Abortbutton_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("RollbackOCC", conexiune);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@id_t", SqlDbType.Int).Value = idTranzactie;
            cmd.ExecuteNonQuery();
            MessageBox.Show("Tranzactie anulata!");
            conexiune.Close();
        }

        private void Rezervabutton_Click(object sender, EventArgs e)
        {
            string cursa = comboBox2.SelectedItem.ToString();
            int nr = (int)numericUpDown1.Value;
            int id=0, nr_locuri=0, nr_locuri_libere=0;

            SqlCommand com1 = new SqlCommand();
            com1.CommandText = "select id, nr_locuri, nr_locuri_libere from rezervari where cursa = '" + cursa + "'";
            com1.Connection = conexiune;
            SqlDataReader dr = com1.ExecuteReader();
            if (dr.Read())
            {
                id = Convert.ToInt32(dr[0]);
                nr_locuri = Convert.ToInt32(dr[1]);
                nr_locuri_libere = Convert.ToInt32(dr[2]);
            }
            dr.Close();

            nr_locuri_libere = nr_locuri_libere - nr;

            SqlCommand com = new SqlCommand("UpdateOCC", conexiune);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@id_t", SqlDbType.Int).Value = idTranzactie;
            com.Parameters.Add("@id_r", SqlDbType.Int).Value = id;
            com.Parameters.Add("@cursa", SqlDbType.VarChar).Value = cursa;
            com.Parameters.Add("@nr_locuri", SqlDbType.Int).Value = nr_locuri;
            com.Parameters.Add("@nr_locuri_libere", SqlDbType.Int).Value = nr_locuri_libere;
            com.ExecuteNonQuery();
 
      
        }

        private void Adaugabutton_Click(object sender, EventArgs e)
        {
            string cursa = textBox1.Text;
            int nr_locuri = int.Parse(textBox2.Text);
            int locuri_libere = int.Parse(textBox3.Text);
            SqlCommand com2 = new SqlCommand("Select max(id) from Rezervari", conexiune);
            int id = Convert.ToInt32(com2.ExecuteScalar()) + 1;

            SqlCommand com = new SqlCommand("UpdateOCC", conexiune);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add("@id_t", SqlDbType.Int).Value = idTranzactie;
            com.Parameters.Add("@id_r", SqlDbType.Int).Value = id;
            com.Parameters.Add("@cursa", SqlDbType.VarChar).Value = cursa;
            com.Parameters.Add("@nr_locuri", SqlDbType.Int).Value = nr_locuri;
            com.Parameters.Add("@nr_locuri_libere", SqlDbType.Int).Value = locuri_libere;

            com.ExecuteNonQuery();
            comboBox2.Items.Add(cursa);
            comboBox3.Items.Add(cursa);

            MessageBox.Show("Cursa adaugata!");
        }

        private void Stergebutton_Click(object sender, EventArgs e)
        {
            string cursa = comboBox3.SelectedItem.ToString();
            SqlCommand com = new SqlCommand("select id from Rezervari where cursa = '" + cursa + "'", conexiune);
            int id = Convert.ToInt32(com.ExecuteScalar());
            try
            {
                SqlCommand cmd = new SqlCommand("DeleteOCC", conexiune);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_t", idTranzactie);
                cmd.Parameters.AddWithValue("@id_r", id);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Cursa a fost stearsa!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Cursa nu a putut fi stearsa");
            }
        }

       
        private void button1_Click(object sender, EventArgs e)
        {
            Monitorizare m = new Monitorizare();
            m.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand("ScriereOCC", conexiune);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_t", idTranzactie);
                cmd.ExecuteNonQuery();
                MessageBox.Show("S-a efectuat actualizarea in baza de date!");
                conexiune.Close();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

      

        

        }

       

       
    }

