using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Lab4
{
    public partial class RezervariForm : Form
    {
        SqlConnection conn;
        SqlTransaction transaction;
        public RezervariForm(String s)
        {
            InitializeComponent();
            conn = new SqlConnection(s);
            conn.Open();

            dataGridView.ColumnCount=3;
            dataGridView.ColumnHeadersVisible = true;
            dataGridView.Columns[0].Name = "Curse";
            dataGridView.Columns[1].Name = "Nr_locuri";
            dataGridView.Columns[2].Name = "Locuri_libere";
            izolareComboBox.Items.Add("Read Uncommitted");
            izolareComboBox.Items.Add("Read Committed");
            startButton.Enabled = true;
            commitButton.Enabled = false;
        }

        private void afiseazaButton_Click(object sender, EventArgs e)
        {
            dataGridView.Rows.Clear();
            dataGridView.Refresh();
            SqlCommand c = new SqlCommand("SELECT * FROM Rezervari", conn,transaction);
            c.CommandTimeout = 30;
            try{
                SqlDataReader dr = c.ExecuteReader();
                while (dr.Read()) {
                    dataGridView.Rows.Add(dr.GetString(0), dr.GetValue(1), dr.GetValue(2));
                    
                }
                dr.Close();
            }
            finally
            {
             
               
            }
            
        }


        private void commitButton_Click(object sender, EventArgs e)
        {
            transaction.Commit();
            commitButton.Enabled = false;
            startButton.Enabled = true;
        
        }


        private void startButton_Click_1(object sender, EventArgs e)
        {
           
            SqlCommand set = new SqlCommand("SET TRANSACTION ISOLATION LEVEL " + izolareComboBox.SelectedItem.ToString(), conn);
            set.ExecuteNonQuery();

            transaction = conn.BeginTransaction();
            startButton.Enabled = false;
            commitButton.Enabled = true;

        }

        private void adaugaButton_Click(object sender, EventArgs e)
        {

            string cursa=null;
            int nr_locuri=0,locuri_libere=0;
       
            foreach (DataGridViewRow row in dataGridView.SelectedRows)
            {
                cursa = row.Cells[0].FormattedValue.ToString();
                
                nr_locuri = Convert.ToInt32(row.Cells[1].FormattedValue.ToString());
                locuri_libere = Convert.ToInt32(row.Cells[2].FormattedValue.ToString());
            }
            try
            {
                SqlCommand comm = new SqlCommand("INSERT INTO Rezervari Values ('" + cursa + "'," + nr_locuri +","+ locuri_libere + ")", conn, transaction);
                comm.ExecuteNonQuery();
            }
            finally
            {
            }

        }

        private void stergeButton_Click(object sender, EventArgs e)
        {
                
                try
                {
                    SqlCommand comm = new SqlCommand("DELETE FROM Rezervari where cursa = '"+ textBox1.Text + "'", conn, transaction);
                    comm.ExecuteNonQuery();
                }
                finally
                {
                }
        
        }

  
        private void rezervaButton_Click(object sender, EventArgs e)
        {
            string cursa = null;
            int locuri_libere = 0;

            foreach (DataGridViewRow row in dataGridView.SelectedRows)
            {
                cursa = row.Cells[0].FormattedValue.ToString();
                locuri_libere = Convert.ToInt32(row.Cells[2].FormattedValue.ToString());
            }

            textBox1.Text = cursa;
            try
            {
                int locuri = Convert.ToInt32(locuriTextBox.Text);
                if (locuri <= locuri_libere)
                {

                    locuri_libere = locuri_libere - locuri;
                    SqlCommand comm = new SqlCommand("Update Rezervari set nr_locuri_libere= " + locuri_libere + "where cursa = '" + textBox1.Text + "'", conn, transaction);
                    comm.ExecuteNonQuery();
                }
                else
                    MessageBox.Show("Nu exista suficiente locuri libere!");

            }
            finally
            {
            }

        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            conn.Close();
            this.Close();

        }

        private void dataGridView_SelectionChanged(object sender, EventArgs e)
        {
            string cursa = null;
            int nr_locuri = 0, locuri_libere = 0;

            foreach (DataGridViewRow row in dataGridView.SelectedRows)
            {
                cursa = row.Cells[0].FormattedValue.ToString();
                nr_locuri = Convert.ToInt32(row.Cells[1].FormattedValue.ToString());
                locuri_libere = Convert.ToInt32(row.Cells[2].FormattedValue.ToString());
            }

            textBox1.Text = cursa;
            cursaLabel.Text = cursa;

          

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string cursa = null;

            foreach (DataGridViewRow row in dataGridView.SelectedRows)
            {
                cursa = row.Cells[0].FormattedValue.ToString();
            }
            try{
                SqlDataReader dr = new SqlCommand("SELECT * FROM Rezervari where cursa= '"+ cursa +"'", conn, transaction).ExecuteReader();
                while(dr.Read()){
                    int total= Convert.ToInt32(dr.GetValue(1).ToString());
                    int rez= Convert.ToInt32(dr.GetValue(2).ToString());
                    int libere = total - rez;

                    totalLabel.Text = total.ToString();
                    rezervatLabel.Text = libere.ToString();
                    freeLabel.Text = rez.ToString();
                  
                }
                
                    dr.Close();
            }finally{
            }
        }

        private void izolareComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

       
 
    }
}