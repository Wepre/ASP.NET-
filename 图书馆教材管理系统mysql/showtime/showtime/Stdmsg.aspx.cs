using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class Studentmsg : System.Web.UI.Page
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
            string sql = "select * from std_msg";
            MySqlDataAdapter da = new MySqlDataAdapter(sql,conn.conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GG.DataSource = ds;
            GG.DataKeyNames = new string[] { "id" };
            GG.DataBind();
        }

        

      

      
        public bool update(string sql)
        {
            
            return false;
        }

        

        

      

        protected void GG_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GG.DataKeys[e.RowIndex].Value.ToString();
            //string name = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[1])).Text.ToString().Trim();
            string name = ((TextBox)(GG.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string classid = ((TextBox)(GG.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
            string a = ((TextBox)(GG.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
            string bookid = ((TextBox)(GG.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
            string note = ((TextBox)(GG.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim();
            string update = "update std_msg set name=@name,classid=@classid,academy=@a,bookid=@bookid,note=@note where id=@id";
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
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('修改成功')</script>");
            GG.EditIndex = -1;
            BindData();
        }

        protected void GG_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GG.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GG_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GG.EditIndex = -1;
            BindData();
        }
    }
}