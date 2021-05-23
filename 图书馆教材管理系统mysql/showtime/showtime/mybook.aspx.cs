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
    public partial class mybook : System.Web.UI.Page
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
            string sql = "select * from mybook";
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn.conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            G.DataSource = ds;
            G.DataKeyNames = new string[] { "id" };
            G.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = G.DataKeys[e.RowIndex].Value.ToString();
            string sql = "delete from mybook where id='"+id+"'";
            MySqlConnection conn = new MySqlConnection("server=localhost;user id=root;password=xfn123;persistsecurityinfo=True;database=bigwork");
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('还书成功')</script>");
            G.EditIndex = -1;
            BindData();
        }

        protected void G_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            G.EditIndex = -1;
            BindData();
        }
    }
}