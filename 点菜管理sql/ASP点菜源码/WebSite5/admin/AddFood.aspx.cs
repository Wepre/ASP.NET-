using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_AddFood : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();

        String foodName = TextBox1.Text; // 商品名称
        String foodClassID = TextBox2.Text;  // 商品类型ID
        String foodPrice = TextBox3.Text; // 价格
        String foodImgUrl = TextBox4.Text; // 图片路径

        String sql = String.Format("insert into foodDetails(foodClassID,foodName,foodPrice,foodImgUrl)values({0},'{1}','{2}','{3}')", foodClassID, foodName, foodPrice, foodImgUrl);
        sh.ExeNonQuery(sql);
        con.Close();
        Response.Write("<script>alert('添加 " + foodName + " 成功');location.href='ManagerFoods.aspx';</script>");
        
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ManagerFoods.aspx");
    }
}