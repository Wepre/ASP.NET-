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
    public partial class RoomDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
                textTurnOff();
            }



        }
        public void bind() {

           
            //int roomid = Convert.ToInt32(Request.QueryString["roomid"]);

            //DataTable dt = BLL_Hotel.Cha_OneRecord(roomid);
            //this.txtGid.Text = dt.Rows[0]["gid"].ToString();
            //this.txtGname.Text = dt.Rows[0]["gname"].ToString();
            //this.txtSex.Text = dt.Rows[0]["sex"].ToString();
            //this.txtMobile.Text = dt.Rows[0]["mobile"].ToString();
            //this.txtTName.Text = dt.Rows[0]["tname"].ToString();
            //this.txtPid.Text = dt.Rows[0]["pid"].ToString();
            //this.txtMark.Text = dt.Rows[0]["mark"].ToString();
            //this.txtFName.Text = dt.Rows[0]["fname"].ToString();
            //this.txtRTName.Text = dt.Rows[0]["rtname"].ToString();
            //this.txtInTime.Text = dt.Rows[0]["intime"].ToString();
            //this.txtRoomName.Text = dt.Rows[0]["number"].ToString();
            //this.txtOutTime.Text = dt.Rows[0]["outtime"].ToString();
            //this.txtCharge.Text = dt.Rows[0]["charge"].ToString()+"元";
            //this.txtDayNum.Text = dt.Rows[0]["daynum"].ToString();
            //this.txtChargeSum.Text = dt.Rows[0]["chargesum"].ToString()+"元";
        
        
        }
        
        public void textTurnOn() {
           
            this.txtGid.Enabled = true;
            this.txtGname.Enabled = true;
            this.txtSex.Enabled = true;
            this.txtMobile.Enabled = true;
            this.txtTName.Enabled = true;
            this.txtPid.Enabled = true;
            this.txtMark.Enabled = true;
            this.txtFName.Enabled = true;
            this.txtRTName.Enabled = true;
            this.txtInTime.Enabled = true;
            this.txtRoomName.Enabled = true;
            this.txtOutTime.Enabled = true;
            this.txtCharge.Enabled = true;
            this.txtDayNum.Enabled = true;
            this.txtChargeSum.Enabled = true;
        }

        public void textTurnOff()
        {
            this.txtGid.Enabled = false;
            this.txtGname.Enabled = false;
            this.txtSex.Enabled = false;
            this.txtMobile.Enabled = false;
            this.txtTName.Enabled = false;
            this.txtPid.Enabled = false;
            this.txtMark.Enabled = false;
            this.txtFName.Enabled = false;
            this.txtRTName.Enabled = false;
            this.txtInTime.Enabled = false;
            this.txtRoomName.Enabled = false;
            this.txtOutTime.Enabled = false;
            this.txtCharge.Enabled = false;
            this.txtDayNum.Enabled = false;
            this.txtChargeSum.Enabled = false;
        }


        //续房操作
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("AddDays.aspx?roomid="+roomid);
        }
        //退房操作
        protected void btnCheckOut_Click(object sender, EventArgs e) //退房操作
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("QuitHome.aspx?roomid="+roomid);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

             ClientScript.RegisterStartupScript(this.GetType(), "打印", "window.print();", true);

     
        }

        protected void Button5_Click1(object sender, EventArgs e)
        {
            this.btnChangeR.Visible = false;
            this.btnCheckOut.Visible = false;
            
        
        }
        //换房操作
        protected void btnChangeR_Click(object sender, EventArgs e)
        {
            int roomid = Convert.ToInt32(Request.QueryString["roomid"]);
            Response.Redirect("Transform.aspx?roomid=" + roomid);
            
        }
    }
}