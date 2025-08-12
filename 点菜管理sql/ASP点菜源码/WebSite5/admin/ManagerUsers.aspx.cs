using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_ManagerUsers : System.Web.UI.Page
{
    DataTable dt;
    public void BindUsersGridView()
    {// 绑定数据库
        if (Session["currentAdmin"] != null)
        {
            SqlHelper sh = new SqlHelper();
            SqlConnection con = sh.getCon();
            dt = new DataTable();
            String sql = "select userID,username 用户名,password 密码,tel 电话,address 地址,memName 会员等级,userToConsum 消费额度 from users;";
            dt = sh.Query(sql);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            con.Close();
        }
        else {
            Response.Write("<script>alert('未登录！');location.href='adminLogin.aspx';</script>");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            BindUsersGridView();
        }

    }

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

    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        BindUsersGridView();
    }
    protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        BindUsersGridView();
    }

    // 更新操作
    protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        int rowIndex = e.RowIndex;
        //int i = 3;
        //String test = GridView2.Rows[rowIndex].Cells[1].Text;
        TextBox username = (TextBox)(GridView2.Rows[e.RowIndex].Cells[3].Controls[0]);
        TextBox password = (TextBox)(GridView2.Rows[e.RowIndex].Cells[4].Controls[0]);
        TextBox tel = (TextBox)(GridView2.Rows[e.RowIndex].Cells[5].Controls[0]);
        TextBox address = (TextBox)(GridView2.Rows[e.RowIndex].Cells[6].Controls[0]);
        TextBox memName = (TextBox)(GridView2.Rows[e.RowIndex].Cells[7].Controls[0]);
        TextBox userToConsum = (TextBox)(GridView2.Rows[e.RowIndex].Cells[8].Controls[0]);
        // 使用DataKeys 记住 需要在GridView属性中设置DataKeysNames中关键字段 即数据库中1关键字段
        String keys = GridView2.DataKeys[rowIndex].Value.ToString();  // 唯一标示
        
        String sql = String.Format("update users set username='{0}',password='{1}',tel='{2}',address='{3}',memName='{4}',userToConsum='{5}' where userID='{6}'",username.Text,password.Text,tel.Text,address.Text,memName.Text,userToConsum.Text,keys);
        sh.ExeNonQuery(sql);
        con.Close();
        //String test2 = GridView2.Rows[rowIndex].FindControl();//.Cells[1].Text;
        Response.Write("<script>document.location=document.location;alert('更改 " +username.Text+ " 成功')</script>");
    }

    // 删除
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // 根据DataKeys进行删除  应用前提【DataKeyNames设置】
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();

        int rowIndex = e.RowIndex; // 获取当前行
        String keys = GridView2.DataKeys[rowIndex].Value.ToString();
        String sql = "delete from users where userID='" + keys + "'";   // SQl删除语句
        sh.ExeNonQuery(sql);
        con.Close();
        BindUsersGridView(); // 重新绑定数据
    }
    // 新增用户
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "addUser")
        {
            Response.Redirect("addUser.aspx");
            //Response.Write("<script>document.location=document.location;alert('添加 "  + " 成功')</script>");
        }

    }
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        BindUsersGridView();
    }
}