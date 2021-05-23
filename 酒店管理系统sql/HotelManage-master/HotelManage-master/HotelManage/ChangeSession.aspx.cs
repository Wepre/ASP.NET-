using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManage
{
    public partial class ChangeSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int sd = Convert.ToInt32(Request.QueryString["sd"]);
            if (sd == 1)
            {
                Session["oldopname"] = Session["opname"];
                Session["opname"] = "";
            }

            else
            {
                Session["opname"] = Session["oldopname"];

            }

        }
    }
}