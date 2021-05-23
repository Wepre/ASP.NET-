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
    public partial class search : System.Web.UI.Page
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
            string word = Session["word"]+"";
            sqlConn conn = new sqlConn();
            string sql = "select * from book where name='"+word+ "' or type='" + word + "'";
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn.conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            G.DataSource = ds;
            G.DataKeyNames = new string[] { "id" };
            G.DataBind();
        }

        protected void G_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //借书操作
            
            Response.Write("<script>alert('借书成功')</script>");
            G.EditIndex = -1;
            BindData();
        }
    }
}