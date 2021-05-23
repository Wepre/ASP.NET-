using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using System.Text;

namespace HotelManage
{
    public partial class Report_Pie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int year()
        {
            int year = Convert.ToInt32(Request.QueryString["year"]);
            return year;
        }

        public string pie() {
          int year = Convert.ToInt32(Request.QueryString["year"].ToString());
          StringBuilder sb = new StringBuilder();
          DataTable dt=  BLL_Hotel.Cha_YearChargeCount(year);
          for (int i = 0; i < dt.Rows.Count; i++) {
              sb.Append("['" + dt.Rows[i][0] + "月', " + dt.Rows[i][1] + "],");  
          }
            return sb.ToString();

        }
    }
}