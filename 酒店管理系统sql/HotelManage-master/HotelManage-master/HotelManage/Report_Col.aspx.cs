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
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
 

        }
        public int year()
        {
            int year = Convert.ToInt32(Request.QueryString["year"]);
            return year;
        }

        public string month() {
           int year = Convert.ToInt32(Request.QueryString["year"]);
        StringBuilder sb= new StringBuilder();
        //DataTable dt = BLL_Hotel.Cha_YearChargeCount(2015);
        //DataTable dt1 = BLL_Hotel.Cha_YearChargeCount(2014);
       
        for (int i = 1; i <13; i++)
        { 
            DataTable dt3 = BLL_Hotel.Cha_MonthChargeCount(i, year);
            if (dt3.Rows.Count!=0)
            {

                sb.Append("<tr><th>" + dt3.Rows[0][0].ToString()+ "月</th><td>" + dt3.Rows[0][1].ToString() + "</td>");

            }
            else {
                sb.Append("<tr><th>"+i+"月</th><td>0</td>");
            
            }
            
       
            
            DataTable dt2 = BLL_Hotel.Cha_MonthChargeCount(i,year-1);
             
            
            
            if (dt2.Rows.Count !=0) {
                 sb.Append("<td>" + dt2.Rows[0][1].ToString() + "</td></tr>");            
             }

             else
             {
                 sb.Append("<td>0</td></tr>");
             }

        }

        return sb.ToString();


       

        }
    }
}