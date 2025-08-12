using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class shoppingCart : System.Web.UI.Page
{
    DataTable dt;
    public void BindGridView()
    {
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        if (Session["currentUser"] != null)
        {
            String username = Session["currentUser"].ToString();
            String sql = "select u.address,fd.foodImgUrl,fd.foodName,fc.foodClassName,fd.foodPrice,sc.foodNum,m.youHui from foodDetails fd,shoppingCart sc,users u,foodclass fc,member m where fd.foodClassID=fc.foodClassID and fd.foodName = sc.foodName and u.username=sc.userName and u.memName=m.memName and u.username='"+username+"'";
            //TBAdd.Text
            dt = new DataTable();
            dt = sh.Query(sql);
            con.Close();
            if (dt.Rows.Count != 0)
            {

                String addr = dt.Rows[0][0].ToString();
                TBAdd.Text = addr;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else {
                Response.Write("<script>alert('您的购物车还空空如也，赶快去添加吧！');location.href='ShowFoods.aspx';</script>");
                //Response.Write("<script languge='javascript'>document.location=document.location;alert('您的购物车还空空如也，赶快去添加吧');windows.location.href='shoppingCart.aspx';</script>");
                //Response.Write("<script>window.location ='ShowFoods.aspx'</script>");
                // Response.End();
                
                //Response.Redirect("ShowFoods.aspx");
            }
            
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
       //Convert.ToInt32(Eval(""));
        if (!IsPostBack)
        {
            BindGridView();
          
            
        }
        
    }
    /*
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGridView();
    }
     * */

    // 合计按钮
    protected void BtnAll_Click(object sender, EventArgs e)
    {
        double sum = 0.0;
       // Response.Write("<script>document.location=document.location;alert('添加 " + GridView1.Rows.Count + " 成功')</script>");
       for (int ii = 0; ii < GridView1.Rows.Count; ii++)
        {
            CheckBox cc = (CheckBox)GridView1.Rows[ii].Cells[0].FindControl("CheckBox1");
            if (cc.Checked)
            {
                int num = int.Parse(((TextBox)(GridView1.Rows[ii].Cells[5].FindControl("TBNum"))).Text); // 更改后的数量
                double youhui = double.Parse(((Label)(GridView1.Rows[ii].Cells[6].FindControl("LbYouHui"))).Text); 

                sum = sum + Convert.ToDouble(((Label)(GridView1.Rows[ii].Cells[4].FindControl("LBPrice"))).Text)*num;
               // Response.Write("<script>document.location=document.location;alert('添加 " + num + "-" + sum+"-" + youhui + " 成功')</script>");
            }
        }
        TBAll.Text = sum.ToString();
    }

    //修改用户状态
    public void modifyUser(String username) {
        // 判断用户消费金额
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        String sql4 = "select sum(foodNum*convert(int,foodPrice)) from Orders where userName='"+username+"' group by userName";// '" + username + "'";
        DataTable dt2 = new DataTable();
        dt2 = sh.Query(sql4);
        if (dt2.Rows.Count != 0)
        {
            String memStatus="普通用户";
            double money = Convert.ToDouble(dt2.Rows[0][0]);//.ToString();
            if (money >= 500 && money<1000)
            { 
                // 通盘用户
                memStatus = "铜牌用户";

            }
            else if (money >= 1000 && money < 1500)
            {
                memStatus = "银牌用户";
            }
            else if (money >= 1500)
            {
                memStatus = "金牌用户";
            }
            String sql = "update users set memName='" + memStatus + "'" + ",userToConsum='"+money.ToString()+"' where username='"+username+"'";
            sh.ExeNonQuery(sql);
            con.Close();
            //Response.Write("<script>document.location=document.location;alert('添加 " + memStatus+ money + " 成功')</script>");
        }
    
    }


    // 点击结账按钮  //转发到我的账单
    protected void pay_Click(object sender, EventArgs e)
    {
        
        // 模拟结账 
        //imgUrl
        SqlHelper sh = new SqlHelper();
        SqlConnection con = sh.getCon();
        //SqlCommand cmd;
       // con.Open();
        //SqlTransaction trans = con.BeginTransaction();
       
            //cmd = sh.getsqlCmd();// 获取cmd
            //cmd.Transaction = trans; //设置trans属性
            for (int ii = 0; ii < GridView1.Rows.Count; ii++)
            {
                CheckBox cc = (CheckBox)GridView1.Rows[ii].Cells[0].FindControl("CheckBox1");
                if (cc.Checked)
                {
                    String username = Session["currentUser"].ToString();  // 用户名
                    String foodname = ((Label)GridView1.Rows[ii].Cells[2].FindControl("LbFName")).Text;  // 菜名
                    String foodClassName = ((Label)GridView1.Rows[ii].Cells[2].FindControl("LbFCName")).Text;  // 菜品名称

                    String price = ((Label)GridView1.Rows[ii].Cells[2].FindControl("LBPrice")).Text;    // 价格

                    String imgurl = ((Image)(GridView1.Rows[ii].Cells[1].FindControl("imgUrl"))).ImageUrl;   // 图片地址   // 图片地址
                    String address = TBAdd.Text;  // 收货地址
                    String ordertime = DateTime.Now.ToString();
                    int num = int.Parse(((TextBox)(GridView1.Rows[ii].Cells[5].FindControl("TBNum"))).Text); // 更改后的数量
                    //double youhui = double.Parse(((Label)(GridView1.Rows[ii].Cells[6].FindControl("LbYouHui"))).Text);
                    String sql = "insert into Orders (userName,foodName,foodClassName,foodNum,foodPrice,foodImgUrl,address,orderTime)values('" + username + "'," + "'" + foodname + "'," + "'" + foodClassName + "'," + "'" + num + "'," + "'" + price + "'," + "'" + imgurl + "'," + "'" + address + "'," + "'" + ordertime + "')";
                    sh.ExeNonQuery(sql);
                    // 当购物完成后 清空相应购购物车
                    String sql2 = "delete from shoppingCart where username='" + username + "'";
                    sh.ExeNonQuery(sql2);

                    // 对相应食品的销售数量增加
                    String sql3 = "update foodDetails set foodSaleNum+=" + num + " where foodName='" + foodname + "'";
                    sh.ExeNonQuery(sql3);

                    // 判断用户消费金额 并修改会员状态和消费总额
                    modifyUser(username);

                    con.Close();
                    // sum = sum + Convert.ToDouble(((Label)(GridView1.Rows[ii].Cells[4].FindControl("LBPrice"))).Text) * num;
                    Response.Write("<script>document.location=document.location;alert('添加 " + "新订单" + " 成功')</script>");
                }
            }
            //trans.Commit();
            //con.Close();
        
       
        
    }
}