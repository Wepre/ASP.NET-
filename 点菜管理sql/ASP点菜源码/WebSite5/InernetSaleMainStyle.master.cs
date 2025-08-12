using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InernetSaleMainStyle : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["currentUser"] != null && Session["userStatus"] != null)
        {
            LBLogin.Visible = false;
            LBRegister.Visible = false;
            String status = Session["userStatus"].ToString();
            String username = Session["currentUser"].ToString();
            LBUserStatus.Text =status+":"+username;
            BtnExit.Visible = true;
        }
        else
        {
            BtnExit.Visible = false;
        }
    }
    protected void IBLogin_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login2.aspx");
    }
    protected void BtnExit_Click(object sender, EventArgs e)
    {
        Session["currentUser"] = null;
        Response.Redirect("ShowFoods.aspx");
    }
    protected void LBRegister_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

        // 搜索按钮
    protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
    {
        String key = TBSearch.Text;
        Session["searchKey"] = key;
        Response.Redirect("searchResultPage.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["currentUser"] != null)
            Response.Redirect("shoppingCart.aspx");
        else
            Response.Write("<script>document.location=document.location;alert('您还未登录！')</script>");
    }


    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        if (Session["currentUser"] != null)
            Response.Redirect("myOrder.aspx");
        else
            Response.Write("<script>document.location=document.location;alert('您还未登录！')</script>");
    

    }
}
