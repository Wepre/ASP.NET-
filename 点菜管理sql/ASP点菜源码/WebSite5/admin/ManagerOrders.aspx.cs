using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
/**
 * @Athor MaxineHehe 
 * */
public partial class admin_ManagerOrders : System.Web.UI.Page
{
    DataTable dt;
    public void BindOrdersGridView() 
    {
        if (Session["currentAdmin"] != null)
        {
            SqlHelper sh = new SqlHelper();
            SqlConnection con = sh.getCon();
            String sql = "select orderID 订单ID,username 用户名,foodName 商品名称,foodClassName 菜品分类,foodNum 订购量,foodPrice 单价,foodImgUrl 展示图片路径,address 收货地址,employerTel 商家电话,orderStatus 状态,orderTime 下单时间 from Orders";
            dt = new DataTable();
            dt = sh.Query(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script>alert('未登录！');location.href='adminLogin.aspx';</script>");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrdersGridView();
        }

    }

    // 四大跳转法王
    protected void LBtnUserManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerUsers.aspx");
    }
    protected void LBtnFoodManager_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerFoods.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerOrders.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManagerSalesCount.aspx");
    }

    // 翻页操作
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindOrdersGridView();
    }

    // 编辑
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindOrdersGridView();  // 主要是接下来的更新操作
    }


    // 更新操作
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        
         
        int rowIndex = e.RowIndex; // 获取当前行
        // String foodID = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox1"))).Text;
        TextBox userName = (TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0]);
        TextBox foodName = (TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0]);

        TextBox foodClassName = (TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0]);
        TextBox foodNum = (TextBox)(GridView1.Rows[e.RowIndex].Cells[6].Controls[0]);
        TextBox foodPrice = (TextBox)(GridView1.Rows[e.RowIndex].Cells[7].Controls[0]);
        TextBox foodImgUrl = (TextBox)(GridView1.Rows[e.RowIndex].Cells[8].Controls[0]);
        TextBox address = (TextBox)(GridView1.Rows[e.RowIndex].Cells[9].Controls[0]);
        TextBox employerTel = (TextBox)(GridView1.Rows[e.RowIndex].Cells[10].Controls[0]);
        TextBox orderStatus = (TextBox)(GridView1.Rows[e.RowIndex].Cells[11].Controls[0]);
        TextBox orderTime = (TextBox)(GridView1.Rows[e.RowIndex].Cells[12].Controls[0]);
        String key = GridView1.DataKeys[rowIndex].Value.ToString();  // 更新关键钥匙
        String sql = String.Format("update orders set userName='{0}',foodName='{1}',foodClassName='{2}',foodNum={3},foodPrice='{4}',foodImgUrl='{5}',address='{6}',employerTel='{7}',orderStatus='{8}',orderTime='{9}' where orderID={10}",
            userName.Text, foodName.Text, foodClassName.Text,Convert.ToInt32(foodNum.Text), foodPrice.Text, foodImgUrl.Text, address.Text, employerTel.Text, orderStatus.Text, orderTime.Text,Convert.ToInt32(key));
        sh.ExeNonQuery(sql); // 执行SQL语句
        con.Close();

        GridView1.EditIndex = -1;
        BindOrdersGridView(); // 
        Response.Write("<script>document.location=document.location;alert('更改 " + userName.Text+"-"+foodName.Text + " 成功')</script>");
 
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindOrdersGridView();
    }

    // 处理发货
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
       
        if (e.CommandName == "send")
        {
            int rowIndex =Convert.ToInt32(e.CommandArgument);  // 获取当前行
            String key = GridView1.DataKeys[rowIndex].Value.ToString();
            String text = "已发货";
            String sql = "update orders set orderStatus='"+text+"' where orderID='"+key+"'";
            sh.ExeNonQuery(sql);
            con.Close();

            Response.Write("<script>alert('已更改发货状态');location.href='ManagerOrders.aspx';</script>");
            //Response.Write("<script>document.location=document.location;alert('更改发货状态')</script>");

           //  int rowIndex = e.RowIndex; // 获取当前行
            //string key = GridView1.DataKeys[]
            //String sql;
        }
    }
}