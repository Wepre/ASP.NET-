using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class bookout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }
        public void BindData()
        {
            sqlConn conn = new sqlConn();
            string sql = "select * from bookout";
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn.conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            G.DataSource = ds;
            G.DataKeyNames = new string[] { "id" };
            G.DataBind();
        }

      

        protected void G_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            G.EditIndex = -1;
            BindData();

        }

       

        protected void G_RowUpdatin(object sender, GridViewUpdateEventArgs e)
        {
            string id = G.DataKeys[e.RowIndex].Value.ToString();
            string bookname = ((TextBox)(G.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
            //string name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[1])).Text.ToString().Trim();
            string name = ((TextBox)(G.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string classid = ((TextBox)(G.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string a = ((TextBox)(G.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
            string bookid = ((TextBox)(G.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            string note = ((TextBox)(G.Rows[e.RowIndex].Cells[7].Controls[0])).Text.ToString().Trim();
            string update = "update bookout set name=@name,classid=@classid,academy=@a,bookid=@bookid,note=@note,bookname=@bookname where id=@id";
            //Response.Write("id:"+id+"name:"+name+"classid:"+classid);
            //string update = "update std_msg set name='xiefangnan' where id='1'";
            //string update = "update std_msg set name='" + name + "' where id='" + id + "'";
            MySqlConnection conn = new MySqlConnection("server=localhost;user id=root;password=xfn123;persistsecurityinfo=True;database=bigwork");
            MySqlCommand cmd = new MySqlCommand(update, conn);
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("classid", classid);
            cmd.Parameters.AddWithValue("a", a);
            cmd.Parameters.AddWithValue("bookid", bookid);
            cmd.Parameters.AddWithValue("note", note);
            cmd.Parameters.AddWithValue("bookname", bookname);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('修改成功')</script>");
            G.EditIndex = -1;
            BindData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = G.DataKeys[e.RowIndex].Value.ToString();
            string bookname = ((TextBox)(G.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
            //string name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[1])).Text.ToString().Trim();
            string name = ((TextBox)(G.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string classid = ((TextBox)(G.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string a = ((TextBox)(G.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim();
            string bookid = ((TextBox)(G.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            string note = ((TextBox)(G.Rows[e.RowIndex].Cells[7].Controls[0])).Text.ToString().Trim();
            string update = "update bookout set name=@name,classid=@classid,academy=@a,bookid=@bookid,note=@note,bookname=@bookname where id=@id";
            //Response.Write("id:"+id+"name:"+name+"classid:"+classid);
            //string update = "update std_msg set name='xiefangnan' where id='1'";
            //string update = "update std_msg set name='" + name + "' where id='" + id + "'";
            MySqlConnection conn = new MySqlConnection("server=localhost;user id=root;password=xfn123;persistsecurityinfo=True;database=bigwork");
            MySqlCommand cmd = new MySqlCommand(update, conn);
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("classid", classid);
            cmd.Parameters.AddWithValue("a", a);
            cmd.Parameters.AddWithValue("bookid", bookid);
            cmd.Parameters.AddWithValue("note", note);
            cmd.Parameters.AddWithValue("bookname", bookname);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('修改成功')</script>");
            G.EditIndex = -1;
            BindData();
        }

        protected void G_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}