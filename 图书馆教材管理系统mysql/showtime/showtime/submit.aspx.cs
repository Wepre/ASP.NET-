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
    public partial class submit : System.Web.UI.Page
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
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn.conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GG.DataSource = ds;
            GG.DataKeyNames = new string[] { "id" };
            GG.DataBind();
        }
    }
}