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
    public partial class AddDays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind()
        {
            //int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            //DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            //this.txtGid.Text = dt.Rows[0]["Gid"].ToString();
            //this.txtGname.Text = dt.Rows[0]["gname"].ToString();
            //this.txtMobile.Text = dt.Rows[0]["mobile"].ToString();
            //this.txtTname.Text = dt.Rows[0]["Tname"].ToString();
            //this.txtInTime.Text = dt.Rows[0]["intime"].ToString();
            //this.txtOutTime.Text = dt.Rows[0]["outtime"].ToString();
            //this.txtRTName.Text = dt.Rows[0]["rtname"].ToString();
            //this.txtRoomNum.Text = dt.Rows[0]["number"].ToString();
        }
        public void price()
        { //根据天数计算押金金额
            if (this.txtAddDay.Text != "")
            {
                int day = Convert.ToInt32(this.txtAddDay.Text);
                int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
                DataTable dt = BLL_Hotel.Cha_One(roomid);//查询该房间每日金额以计算押金
                int DP = Convert.ToInt32(dt.Rows[0]["rtprice"]);
                this.txtAddCharge.Text = ((day) * DP).ToString();
                DateTime outtime = Convert.ToDateTime(this.txtOutTime.Text);
                this.txtOutTime.Text = outtime.AddDays(+day).ToString();
            }
        }
        protected void txtAddDay_TextChanged(object sender, EventArgs e)
        {
            price();
        }
        //续房
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int gid = Convert.ToInt32(this.txtGid.Text);
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            int day = Convert.ToInt32(this.txtAddDay.Text);
            DateTime intime = Convert.ToDateTime(this.txtInTime.Text);
            DateTime outtime = Convert.ToDateTime(this.txtOutTime.Text);
            int charge = Convert.ToInt32(this.txtAddCharge.Text);
            BLL_Hotel.Gai_AddDay(intime, outtime, day, charge, roomid);//用户房间续费该表
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "alert('房间续费成功');location.href='Roomdetail.aspx?roomid=" + roomid + "'", true);
        }
        protected void txtInTime_TextChanged(object sender, EventArgs e)
        {
            price();
        }
    }
}