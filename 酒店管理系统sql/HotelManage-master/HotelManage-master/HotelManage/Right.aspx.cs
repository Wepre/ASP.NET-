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
    public partial class Right : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
            imgtype();
        }
        // 获取动态分页的总页数，每页显示36项
        public int ye()
        {
            int allye = BLL_Hotel.Img_Table().Rows.Count;
            int ye = 0;
            if (allye % 36 == 0)
            {
                ye = (allye / 36);
            }
            else
            {
                ye = (allye / 36 + 1);
            }
            return ye;
        }
        //将查询到的图标方式展示房间信息（分页）/即将到期的客房绑定到表格
        public void bind()
        {
            DataTable dt = BLL_Hotel.Img_Table(1);//图标方式展示房间信息（分页）
            this.DataList1.DataSource = dt;
            this.DataList1.DataBind();
            DataTable dt1 = BLL_Hotel.Cha_OutDay();//即将到期的客房
        }
        // 动态显示所有房间类型图标
        public void imgtype()
        {
            this.Image1.ImageUrl = "images/ico/type1.jpg";
            this.Image2.ImageUrl = "images/ico/type2.jpg";
            this.Image3.ImageUrl = "images/ico/type3.jpg";
            this.Image4.ImageUrl = "images/ico/type4.jpg";
            this.Image5.ImageUrl = "images/ico/type5.jpg";
            this.Image6.ImageUrl = "images/ico/type6.jpg";
        }
        /// <summary>
        /// 只查看某一类房间类型图标
        /// </summary>
        /// <param name="type">房间类型</param>
        public void imgtype(int type)
        {
            this.Image1.ImageUrl = "images/ico/type" + type + ".jpg";
            this.Image2.ImageUrl = "images/ico/type" + type + ".jpg";
            this.Image3.ImageUrl = "images/ico/type" + type + ".jpg";
            this.Image4.ImageUrl = "images/ico/type" + type + ".jpg";
            this.Image5.ImageUrl = "images/ico/type" + type + ".jpg";
            this.Image6.ImageUrl = "";
            DataTable dt = BLL_Hotel.image_TableType(type);//只查看单独类型的房间
            this.DataList1.DataSource = dt;
            this.DataList1.DataBind();
        }
        // 分页划分数据
        protected void btnPaging_Click(object sender, EventArgs e)
        {
            int hehe = Convert.ToInt32(this.txtCPage.Text);//获取当前页
            DataTable dt = BLL_Hotel.Img_Table(hehe);
            this.DataList1.DataSource = dt;
            this.DataList1.DataBind();
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "click", "$('.tcdPageCode').createPage({pageCount:" + ye() + ",current:" + this.txtCPage.Text + "});", true);//注册分页js脚本
        }
        //只查看普通单人房间
        protected void Button1_Click(object sender, EventArgs e)
        {
            imgtype(1);
        }
        //只查看豪华单人房间
        protected void Button2_Click(object sender, EventArgs e)
        {
            imgtype(2);
        }
        //只查看普通双人房间
        protected void Button4_Click(object sender, EventArgs e)
        {
            imgtype(3);
        }
        //只查看豪华双人房间
        protected void Button5_Click(object sender, EventArgs e)
        {
            imgtype(4);
        }
        //只查看贵宾房间
        protected void Button6_Click(object sender, EventArgs e)
        {
            imgtype(5);
        }
        //只查看总统房间
        protected void Button7_Click(object sender, EventArgs e)
        {
            imgtype(6);
        }
    }
}