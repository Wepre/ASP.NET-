using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_MangerFoods : System.Web.UI.Page
{
    DataTable dt;
    public void BindFoodsGridView()
    {
        if (Session["currentAdmin"] != null)
        {
            SqlHelper sh = new SqlHelper();
            SqlConnection con = sh.getCon();
            String sql = "select * from foodDetails;";
            dt = new DataTable();
            dt = sh.Query(sql);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
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
            BindFoodsGridView();
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

    // 编辑
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindFoodsGridView();
    }

    // 更新
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
       /*
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        */
        int rowIndex = e.RowIndex; // 获取当前行
       // String foodID = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox1"))).Text;
        
        String foodClassID = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox2"))).Text;
        String foodName = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox3"))).Text;
        String foodPrice = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox4"))).Text;
        String foodSaleNum = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox5"))).Text;
        String foodImgUrl = ((TextBox)(GridView1.Rows[rowIndex].Cells[1].FindControl("TextBox6"))).Text;
        String keys = GridView1.DataKeys[rowIndex].Value.ToString();
        String sql = String.Format("update foodDetails set foodClassID={0},foodName='{1}',foodPrice='{2}',foodSaleNum={3},foodImgUrl='{4}' where foodID={5}",  foodClassID, foodName, foodPrice,foodSaleNum,foodImgUrl,keys);
        sh.ExeNonQuery(sql);

        //cmd.CommandText = sql;
        //cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindFoodsGridView();
        Response.Write("<script>document.location=document.location;alert('更改 " + foodName + " 成功')</script>");
    }
    // 取消编辑
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindFoodsGridView();
    }
    // 删除
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();

        int rowIndex = e.RowIndex;
        String keys = GridView1.DataKeys[rowIndex].Value.ToString();
        String sql = "delete from foodDetails where foodID='"+keys+"'";
        sh.ExeNonQuery(sql);
        con.Close();
        BindFoodsGridView();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindFoodsGridView();
    }

   
    // 新增菜
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add") {
            Response.Redirect("AddFood.aspx");

            //Response.Write("<script>document.location=document.location;alert(' "  + "Add 成功')</script>");
        }
    }
}