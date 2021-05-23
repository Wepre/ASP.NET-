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
    public partial class ChangeGuest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bind();
            }
        }
        //数据绑定
        public void bind()
        {
            DataTable dt = BLL_Hotel.bind_GuestTname();
            this.ddlTName.DataSource = dt;
            this.ddlTName.DataValueField = "GTid";
            this.ddlTName.DataTextField = "Tname";
            this.ddlTName.DataBind();
            int idd = Convert.ToInt32(Request.QueryString["gid"]);//顾客编号
            DataTable dt1 = BLL_Hotel.Cha_Guestinfo(idd);
            this.txtGname.Text = dt1.Rows[0]["gname"].ToString();
            this.txtMobile.Text = dt1.Rows[0]["mobile"].ToString();
            this.txtPid.Text = dt1.Rows[0]["pid"].ToString();
            this.txtChargeSum.Text = dt1.Rows[0]["chargesum"].ToString();

            if (dt1.Rows[0]["sex"].ToString() == "女")
            {
                this.rdoFemaile.Checked = true;
            }
            this.ddlTName.SelectedValue = dt1.Rows[0]["gtid"].ToString();



        }
        //提交顾客修改信息
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = this.txtGname.Text;
            string mobile = this.txtMobile.Text;
            string pid = this.txtPid.Text;
            int chargesum = Convert.ToInt32(this.txtChargeSum.Text);
            int GTid = Convert.ToInt32(this.ddlTName.SelectedValue);
            string sex = "男";
            if (this.rdoFemaile.Checked == true)
            {
                sex = "女";
            }
            int idd = Convert.ToInt32(Request.QueryString["gid"]);
            BLL_Hotel.ChangeGuestInfo(name, GTid, sex, mobile, chargesum, pid, idd);//修改顾客信息
            Response.Write("<script> alert('信息修改!');  location.href = 'GuestMan.aspx';</script>");
        }
    }
}