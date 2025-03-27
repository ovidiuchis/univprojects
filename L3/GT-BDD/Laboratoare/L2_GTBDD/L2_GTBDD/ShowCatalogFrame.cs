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
    public partial class ShowCatalogFrame : Form
    {
        private SqlConnection con;
        private String date;
        public ShowCatalogFrame(SqlConnection s,String data)

        {
            con = s;
            date = data;
            InitializeComponent();
            loadGrid();
        }

        private void loadGrid()
        {
            SqlCommand com = new SqlCommand("Select s.denumire as Store,p.denumire as produs,c.pret as pret from Catalog c, Produse p,SistemeCE s where p.codp=c.codp and c.cods=s.cods and data= '" + date + " '", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(com);
            da.Fill(ds, "Catalog");
            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "Catalog";
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Dispose();

        }

        private void ShowCatalogFrame_Load(object sender, EventArgs e)
        {

        }

        
    }
}
