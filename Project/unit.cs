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

namespace Project.manjot
{
    public partial class unit : Form
    {
        //SqlConnection con = new SqlConnection(@"Data Source=SQLSERVERDEV;Initial Catalog=Inventory;Integrated Security=True");
        //SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=Inventory;Integrated Security=True");
        SqlConnection con = new SqlConnection(@"Data Source=ROBOT\SQLEXPRESS;Initial Catalog=Inventory;Integrated Security=True");

        public unit()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int count = 0;
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            cmd1.CommandText = "select * from units where unit='" + textBox1.Text + "'";
            cmd1.ExecuteNonQuery();
            DataTable dt1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(dt1);
            count = Convert.ToInt32(dt1.Rows.Count.ToString());
            if (count == 0)
            {


                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into units values('" + textBox1.Text + "')";
                cmd.ExecuteNonQuery();
                disp();


            }
            else
            {
                MessageBox.Show("this unit already added");
            }
        }
        private void unit_Load(object sender, EventArgs e)
        {
            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
            disp();
        }
        public void disp()
        {
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from units";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            dataGridView3.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id;
            id=Convert.ToInt32(dataGridView3.SelectedCells[0].Value.ToString());
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from units where id =" + id + "";
            cmd.ExecuteNonQuery();
            disp();
        }

    }
}
