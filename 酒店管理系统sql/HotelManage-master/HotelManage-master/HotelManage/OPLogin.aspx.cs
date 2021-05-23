using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManage
{
    public partial class OPLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string opname = this.Request["username"];
            string oppwd = this.Request["passowrd"];
            DataTable dt = BLL_Hotel.OP_login(opname, oppwd);
            if(dt.Rows.Count>0)
            {
                Session["opname"] = dt.Rows[0]["oname"].ToString();
                Session["pwd"] = dt.Rows[0]["pwd"].ToString();
                Response.Redirect("Right.aspx");
            }
            else
            {
                this.Label1.Text = "帐号或密码错误！";
            }
        }
    }
}