using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManage
{
    public partial class ChangePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtOName.Enabled = false;
             this.txtOName.Text= Session["opname"].ToString();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (this.txtNewPwd.Text != this.txtEnPwd.Text)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('两次密码输入不一致！');", true);
        }
        else if (this.txtOldPwd.Text != Session["pwd"].ToString())
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('管理员原始密码错误！');", true);
        }
        else if (this.txtOldPwd.Text == "" || this.txtNewPwd.Text == "" || this.txtEnPwd.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码不能为空！');", true);

        }

        else
        {
            string name = Session["opname"].ToString();
            string pwd = this.txtEnPwd.Text;
            BLL_Hotel.Gai_OPPwd(name, pwd);
            Session.Clear();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "alert('密码修改成功，请重新登录。');window.top.location.href='OPlogin.aspx';", true);


        }
    }
}
}