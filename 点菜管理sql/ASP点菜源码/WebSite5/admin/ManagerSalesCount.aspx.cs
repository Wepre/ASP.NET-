using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class admin_ManagerSalesCount : System.Web.UI.Page
{
    DataTable dt;
    public void BindSaleGridView() {
        if (Session["currentAdmin"] != null)
        {
            SqlHelper sh = new SqlHelper();
            SqlConnection con = sh.getCon();

            dt = new DataTable();
            String sql = "select * from foodDetails order by foodSaleNum desc";
            dt = sh.Query(sql);
            con.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else {

            Response.Write("<script>alert('未登录！');location.href='adminLogin.aspx';</script>");
        }
    }

    public void BindSaleDataList()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();

        DataTable dt = new DataTable();
        String sql = "select * from foodDetails fd,foodclass fc where fd.foodClassID = fc.foodClassID";
        dt = sh.Query(sql);
        con.Close();
        DataList1.DataSource = dt;
        DataList1.DataBind();
    }


    public void ToLabel() {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        String sql = "select top 1 * from foodDetails order by foodSaleNum desc;";
        String sql2 = "select SUM( CONVERT(float,foodPrice)*convert(float,foodSaleNum)) from foodDetails";
        dt = sh.Query(sql);
        dt2 = sh.Query(sql2);
       con.Close();
       String allMoney = dt2.Rows[0][0].ToString();  // 总价
       Label1.Text = allMoney;
       String foodName = dt.Rows[0][2].ToString();
       String foodPrice = dt.Rows[0][3].ToString();
       String foodSaleNum = dt.Rows[0][4].ToString();
       double sinMoney = Convert.ToDouble(foodPrice) * Convert.ToInt32(foodSaleNum);
       Label2.Text = foodName;
       Label3.Text = foodSaleNum;
       Label4.Text = sinMoney.ToString();
       //Response.Write("<script>document.location=document.location;alert('更改 " + x+ " 成功')</script>");
        
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSaleGridView();
            ToLabel();
        }
    }

    // 左侧四大跳转法王
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



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindSaleGridView();
    }

    // 选择改变
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        int index = e.NewSelectedIndex;
        String foodName = GridView1.Rows[index].Cells[3].Text;
        String foodClassID = GridView1.Rows[index].Cells[2].Text;
        String foodSaleNum = GridView1.Rows[index].Cells[5].Text;
        String foodImgUrl = GridView1.Rows[index].Cells[6].Text;
        String sql = "select foodClassName from foodclass where foodClassID='"+foodClassID+"'";
        DataTable dt = new DataTable();
        dt = sh.Query(sql);
        con.Close();
        String foodClassName = dt.Rows[0][0].ToString();

        dt.Clear(); // 清空
        dt.Columns.Add("foodName",typeof(String));
        dt.Columns.Add("foodClassNum",typeof(string));
        dt.Columns.Add("foodSaleNum", typeof(string));
        dt.Columns.Add("foodImgUrl", typeof(string));
        // 添加新行
        DataRow rr = dt.NewRow();
        rr["foodName"] = foodName; // 0 0
        rr["foodClassName"] = foodClassName;  // 0 1
        rr["foodSaleNum"] = foodSaleNum;  // 0 3 
        rr["foodImgUrl"] = foodImgUrl;  // 0  4

        dt.Rows.Add(rr);

        DataList1.DataSource = dt;
        DataList1.DataBind();

      //  Response.Write("<script>document.location=document.location;alert('选中了 "  + dt.Rows[0][4].ToString() + " 成功')</script>");
    }
}