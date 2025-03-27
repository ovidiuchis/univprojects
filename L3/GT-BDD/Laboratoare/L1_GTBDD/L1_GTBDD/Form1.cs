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
    public partial class MainFrame : Form
    {
        public SqlConnection con;
        public MainFrame()
        {
            InitializeComponent();
        }
        private bool Initialize()
        {
            con = new SqlConnection("Data Source=SQL-SERVER\\SQLEXPRESS;Initial Catalog=gr225;User ID=coir0354;Password=coir0354");
            if (con.State == ConnectionState.Closed )
            {
                con.Open();
                return true;
            }
            return false;

        }
        private void Form1_Load(object sender, EventArgs e)
        {
            if (Initialize())
            {
                MessageBox.Show("Conectat cu succes");
            }
            LoadTables();
           
        }
        private void LoadTables()
        {
            SqlCommand sqlcmd = new SqlCommand();
            sqlcmd.Connection = con;
            sqlcmd.CommandText = "select * from sys.tables";
            SqlDataReader reader = sqlcmd.ExecuteReader();
            listBox1.Items.Clear();
            while (reader.Read())
            {
                listBox1.Items.Add(reader[0]);
               // MessageBox.Show(reader[0].ToString());
            }
            reader.Close();
        }
        private void updateColumns(String tableName)
        {
            SqlCommand cmd=new SqlCommand();
            cmd.Connection=con;
            String s = "select * from sys.columns where object_id=(select object_id from sys.tables where name=";
            s+="'";
            s+=tableName;
            s+="'";
            s += ")";
            cmd.CommandText=s;

       
            SqlDataReader reader=cmd.ExecuteReader();
            listBox2.Items.Clear();
            while(reader.Read())
                listBox2.Items.Add(reader[1]);
            reader.Close();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            updateColumns(listBox1.SelectedItem.ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            String sql = "drop table ";
            sql+=listBox1.SelectedItem.ToString();
            cmd.CommandText=sql;
            cmd.ExecuteNonQuery();
            LoadTables();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            String sql = "alter table ";
            sql += listBox1.SelectedItem.ToString();
            sql += " drop column ";
            sql += listBox2.SelectedItem.ToString();
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            updateColumns(listBox1.SelectedItem.ToString());

        }
        
        private void button3_Click(object sender, EventArgs e)
        {
            AddColFrame f = new AddColFrame(con, listBox1.SelectedItem.ToString());
            
            f.Show();
            updateColumns(listBox1.SelectedItem.ToString());
          
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AddTableFrame f = new AddTableFrame(con);
            f.Show();
        }

        private void listBox2_DoubleClick(object sender, EventArgs e)
        {
            SqlCommand cmd=new SqlCommand("select * from systypes where xtype = (select system_type_id from sys.columns where object_id=(select object_id from sys.tables where name= @Tabel) and name= @Coloana)",con);
           
            SqlParameter p1 = new SqlParameter();
            p1.ParameterName = "@Tabel";
            p1.Value = listBox1.SelectedItem;

            SqlParameter p2 = new SqlParameter();
            p2.ParameterName = "@Coloana";
            p2.Value = listBox2.SelectedItem;

            cmd.Parameters.Add(p1);
            cmd.Parameters.Add(p2);

            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            MessageBox.Show("Tipul Coloanei: " + reader[0].ToString());
            reader.Close();



        }


    }
}
