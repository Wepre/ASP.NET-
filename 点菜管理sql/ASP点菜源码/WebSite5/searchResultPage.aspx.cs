using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class searchResultPage : System.Web.UI.Page
{
    String key;
    DataTable dt;
    static int i;
    public void BindSearchKey()
    {
        if (Session["searchKey"] != null)
        {
            key = Session["searchKey"].ToString().Trim();


            SqlHelper sh = new SqlHelper();
            SqlConnection con = sh.getCon();
            String sql = "select * from foodDetails fd,foodClass fc where fd.foodClassID=fc.foodClassID and foodName like '%" + key + "%'";
            dt = new DataTable();
            dt = sh.Query(sql);
            DataList1.DataSource = dt;
            
            DataList1.DataBind();
            con.Close();
        }
        
    }



    public DataTable getData_Product()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        dt = new DataTable();
        if (Session["searchKey"] != null)
        {
            key = Session["searchKey"].ToString().Trim();

            String sql = "select * from foodDetails fd,foodClass fc where fd.foodClassID=fc.foodClassID and foodName like '%" + key + "%'";

            dt = sh.Query(sql);
            // DataList1.DataSource = dt;
            // DataList1.DataBind();
            con.Close();
            
        }
        return dt;
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        //DataView1
        if (!IsPostBack)
        {
            //BindSearchKey();
            getData(1);
        }
        
    }


    public bool IsAddShoppingcart(String username, String foodname)
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String sql = "select * from shoppingCart where userName='" + username + "'and foodName='" + foodname + "'";
        dt = new DataTable();
        dt = sh.Query(sql);

        DataRow[] dr = dt.Select("userName='" + username + "' and foodName='" + foodname + "'");  // 拿已知查询
        //dr.Length
        con.Close();
        if ((dr.Length != 0) && (dr[0][0].ToString().Equals(username) && dr[0][1].ToString().Equals(foodname)))
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

    // 点击添加购物车即相当于加入将其加入数据库的购物车表中


    protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
    {

        if (e.CommandName == "addShoppingCartSearch")
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
                    sql = "update shoppingCart set foodNum+=" + 1 + " where userName='" + username + "' and foodName='" + lbfname.Text + "'";
                }
                sh.ExeNonQuery(sql);   // 提交到数据库
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









    private void getData(int pageIndex)
    {

        PagedDataSource pd = new PagedDataSource();
        pd.AllowPaging = true;  // 是AllowPaging 不是AllowCustomerPaging
        pd.PageSize = 6;
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







}