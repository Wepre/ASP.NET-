using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace showtime
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text += Session["user"].ToString();
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string word = search.Text;
            Session.Add("word",word);
            Response.Redirect("search.aspx");

        }

        protected void btn_exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btn_pwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("changepwd.aspx");
        }

        protected void btn_std_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stdmsg.aspx");

        }

        protected void btn_book_Click(object sender, EventArgs e)
        {

            Response.Redirect("bookout.aspx");

        }

        protected void btn_letout_Click(object sender, EventArgs e)
        {
            Response.Redirect("bookout.aspx");

        }

        protected void btn_buy_Click(object sender, EventArgs e)
        {
            Response.Redirect("submit.aspx");

        }
    }
}