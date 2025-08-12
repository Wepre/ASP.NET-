using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class myOrder : System.Web.UI.Page
{
    DataTable dt;
    public void BindOrder() 
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        
            
            if (Session["currentUser"] != null)
            {
                String username = Session["currentUser"].ToString();
                String sql = "select * from orders ord,member mem ,users u where ord.username=u.username and u.memName=mem.memName and ord.userName='"+username+"'";
                dt = new DataTable();
                dt = sh.Query(sql);
                con.Close();
                if (dt.Rows.Count != 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('您还没有订单哦！');location.href='ShowFoods.aspx';</script>");
                   
                }
                
            }
        
        
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrder();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex=e.NewPageIndex;
        BindOrder();
    }
}