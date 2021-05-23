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
    public partial class GuestReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        public void bind()
        {
            DataTable dt = BLL_Hotel.bind_GuestTname();
            this.ddlGTid.DataSource = dt;
            this.ddlGTid.DataValueField = "GTid";
            this.ddlGTid.DataTextField = "Tname";
            this.ddlGTid.DataBind();



        }
        //提交新增客户信息到数据库
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = this.txtGname.Text;
            string mobile = this.txtMobile.Text;
            string pid = this.txtPid.Text;
            int chargesum = Convert.ToInt32(this.txtChargeSum.Text);
            int GTid = Convert.ToInt32(this.ddlGTid.SelectedValue);
            string sex = "男";
            if (this.rdoFemale.Checked == true)
            {
                sex = "女";
            }

            BLL_Hotel.Add_GuestInfo(name, GTid, sex, mobile, chargesum, pid);//新增顾客信息
            Response.Write("<script>alert('客户信息添加成功！');location.href='Guestinfo.aspx';</script>");
        }
    }
}