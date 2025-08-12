using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ShowFoods : System.Web.UI.Page
{
    private DataTable dt;
    static int i; // 定义翻页变量
   
    // 绑定数据库方法 方便多出调用
    public void Bind()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        DataTable dt = new DataTable();
        String sql = "select top 10 * from foodDetails fd,foodClass fc where fd.foodClassID=fc.foodClassID order by foodSaleNum desc";
        dt = sh.Query(sql);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        con.Close();
    }

    // 绑定DropDownList
    public void getDropDownList()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        DataTable dt2 = new DataTable();

        ListItem itemAll = new ListItem();
        itemAll.Text = "全部";
        itemAll.Value = "全部";

        String sql = "select * from foodClass";
        dt = sh.Query(sql);
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "foodClassName";
        DropDownList1.DataValueField = "foodClassID";
        
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, itemAll);

        ListItem item = DropDownList1.Items.FindByText("全部");
        if (!IsPostBack && item != null)
        {
            item.Selected = true;
        }
        con.Close();
    }




    public DataTable getData_Product()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        dt = new DataTable();
        String fcID = DropDownList1.SelectedValue.ToString();
        String sql;
        if ((!fcID.Equals("") || fcID != null) && !fcID.Equals("全部"))
            sql = "select * from foodDetails where foodClassID='" + fcID + "'";
        else
            sql = "select * from foodDetails";
        dt = sh.Query(sql);
       // DataList1.DataSource = dt;
       // DataList1.DataBind();
        con.Close();
        return dt;
    }



    private void getData(int pageIndex)
    {

        PagedDataSource pd = new PagedDataSource();
        pd.AllowPaging = true;  // 是AllowPaging 不是AllowCustomerPaging
        pd.PageSize = 12;
        pd.CurrentPageIndex = pageIndex - 1;
        pd.DataSource = getData_Product().DefaultView;
        DataList1.DataSource = pd;
        DataList1.DataBind();
        lblCurrent.Text = Convert.ToString(pd.CurrentPageIndex + 1);
        i = pd.PageCount;
        if (pd.IsFirstPage)
        {
            lbtnFirst.Visible = false;
            lbtnPrveious.Visible = false;
        }
        else
        {
            lbtnFirst.Visible = true;
            lbtnPrveious.Visible = true;
        }
        if (pd.IsLastPage)
        {
            lbtnLast.Visible = false;
            lbtnNext.Visible = false;
        }
        else
        {
            lbtnLast.Visible = true;
            lbtnNext.Visible = true;

        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
         // 获取数据绑定到GridView数据表
        //DataListGet_data();  // 获取数据绑定到DataList数据表
        
        if (!Page.IsPostBack)
        {
            Bind();
            
            getDropDownList();//绑定DropDownList
            getData(1);
            
        }

       // flag = false;
    }


    // 点击翻页，处理页码改变
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Bind();
    }



    // 翻页处理
    protected void lbtnFirst_Click(object sender, EventArgs e)
    {
        getData(1);
    }
    protected void lbtnLast_Click(object sender, EventArgs e)
    {
        getData(i);
    }
    protected void lbtnPrveious_Click(object sender, EventArgs e)
    {
        getData(Convert.ToInt32(lblCurrent.Text) - 1);
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        getData(Convert.ToInt32(lblCurrent.Text) + 1);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        // DropDownList1.SelectedValue.ToString();
        //getDropDownList();//绑定DropDownList
        
            getData(1);
        
    }

    // 用于判断 购物车中是否已经有该信息
    public bool IsAddShoppingcart(String username,String foodname) {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String sql = "select * from shoppingCart where userName='" + username + "'and foodName='" + foodname + "'";
        dt = new DataTable();
        dt = sh.Query(sql);
        
        DataRow[] dr = dt.Select("userName='" + username + "' and foodName='" + foodname+"'");  // 拿已知查询
        //dr.Length
        con.Close();
        if ((dr.Length!=0) && (dr[0][0].ToString().Equals(username) && dr[0][1].ToString().Equals(foodname)))
        {
            // 表明已经存在该数据
            return false;
        }
        else
        {
            // 表明表中还不存在
            return true;
        }
    }

   

    // 用于处理模板内按钮点击事件 需要绑定CommandName
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //System.Web.UI.WebControls.Label lblBarcode = e.Item.Controls[0].FindControl("UCProduct1")
          //          .FindControl("lblBarcode") as System.Web.UI.WebControls.Label;


        if (e.CommandName == "addShoppingCart")
        {
            if (Session["currentUser"] != null)  // 已经登录
            {
                String sql;
                String username = Session["currentUser"].ToString();   // 获取当前用户名
                Label lbfname = e.Item.FindControl("LbFName") as Label;  // 成功找到索引
                Label lbPrice = e.Item.FindControl("LbPrice") as Label;
                Label lbSaleNum = e.Item.FindControl("LbSaleNum") as Label;
                //将以上内容写入数据库  
                // 调用自己写的SqlHelper executeNonQuery函数
                SqlHelper sh = new SqlHelper();
                SqlConnection con = sh.getCon();
                //String.Format将指定的 String类型的数据中的每个格式项替换为相应对象的值的文本等效项
                bool flag = IsAddShoppingcart(username, lbfname.Text);
                if (flag)
                {
                    sql = String.Format("insert into shoppingCart values('{0}','{1}',{2},'{3}')", username, lbfname.Text, 1, lbPrice.Text);
                }
                else
                {
                    sql = "update shoppingCart set foodNum+="+1+" where userName='"+username+"' and foodName='"+lbfname.Text+"'";
                }
                sh.ExeNonQuery(sql);   // 提交到数据库
                con.Close();
                // Label lb
                Response.Write("<script>document.location=document.location;alert('添加 " + lbfname.Text + " 成功')</script>");
            }
            else
            {
                Response.Write("<script>document.location=document.location;alert('请先登录以便我们更好的为您服务')</script>");
            }
        }
        //"<script language=JavaScript>alert('禁用 "+ name +" 成功')</script>"
        else
        {
            Response.Write("<script>document.location=document.location;alert('抱歉！运行出错！')</script>");
        }
       
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName == "grAddToCart")
        {
            
            if (Session["currentUser"] != null)  // 已经登录
            {
           
            Button btn = e.CommandSource as Button;
            GridViewRow row = btn.Parent.Parent as GridViewRow;
            Label fname = row.Cells[0].FindControl("LbFname") as Label;// 获取商品名称 .ToString();//获得第一个单元格的值  
            String username = Session["currentUser"].ToString(); // 获取当前用户
            Label fprice = row.Cells[0].FindControl("LbFPrice") as Label;
            Label fnum = row.Cells[0].FindControl("LbFNum") as Label;
                //LbFPrice

            Response.Write("<script>document.location=document.location;alert('添加 " + fname.Text+"-"+fprice.Text+"-"+fnum.Text  + " 成功')</script>");
            }
            else
            {
                Response.Write("<script>document.location=document.location;alert('请先登录以便我们更好的为您服务')</script>");
            }
           }
       // Response.Write("<script>document.location=document.location;alert('GridView没劲了')</script>");
    }
}