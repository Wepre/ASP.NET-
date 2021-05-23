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
    public partial class Report_Ave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int year() {
            int year = Convert.ToInt32(Request.QueryString["year"]);
            return year;       
        }


        public string AveNow()
        { int year = Convert.ToInt32(Request.QueryString["year"].ToString());
            StringBuilder sb = new StringBuilder();


            for (int i = 1; i < 13; i++)
            {
                DataTable dt3 = BLL_Hotel.Cha_MonthChargeCount(i, year);
                if (dt3.Rows.Count != 0)
                {
                    if (i == 12)
                    {
                        sb.Append(dt3.Rows[0][1].ToString());
                    }
                    else
                    {
                        sb.Append(dt3.Rows[0][1].ToString() + ",");
                    }
                }
                else
                {
                    if (i == 12)
                    {
                        sb.Append("0");
                    }
                    else
                    {
                        sb.Append("0,");
                    }

                }
            }

            return sb.ToString();
        }

        public string AveLast()
        {
            int year = Convert.ToInt32(Request.QueryString["year"].ToString());
            StringBuilder sb = new StringBuilder();


            for (int i = 1; i < 13; i++)
            {
                DataTable dt3 = BLL_Hotel.Cha_MonthChargeCount(i, year-1);
                if (dt3.Rows.Count != 0)
                {
                    if (i == 12)
                    {
                        sb.Append(dt3.Rows[0][1].ToString());
                    }
                    else
                    {
                        sb.Append(dt3.Rows[0][1].ToString() + ",");
                    }
                }
                else
                {
                    if (i == 12)
                    {
                        sb.Append("0");
                    }
                    else
                    {
                        sb.Append("0,");
                    }

                }




            }

            return sb.ToString();
        }
    }
}

