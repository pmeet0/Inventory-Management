﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace Project.LogIn
{
    public partial class LogIn : Form
    {

        //SqlConnection con = new SqlConnection(@"Data Source=SQLSERVERDEV;Initial Catalog=Inventory;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=ROBOT\SQLEXPRESS;Initial Catalog=Inventory;Integrated Security=True");

        public LogIn()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int i;
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from registration where username = '"+ textBox1.Text +"' and password = '"+ textBox2.Text  +"'";
            cmd.ExecuteNonQuery();

            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            i = Convert.ToInt32(dt.Rows.Count.ToString());

            if(i == 0)
            {
                MessageBox.Show("Username and password doesnt match");
            }
            else
            {
                this.Hide();
                MDIParent1 mdi = new MDIParent1();
                mdi.Show();
            }
        }

        private void LogIn_Load(object sender, EventArgs e)
        {
            if(con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.ResetText();
            textBox2.ResetText();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}