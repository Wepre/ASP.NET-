using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    /*验证码处理*/
    public void RandomCheckCode()
    {
        Random r = new Random();
        yanzhengma.Text = Convert.ToString(r.Next(1000, 9999));
    }
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        RandomCheckCode();

        TxtAccount.Focus();
    }
    protected void BtnReset_Click(object sender, EventArgs e)
    {
        TxtAccount.Text = "";
        TxtCheck.Text = "";
        TxtPwd.Text = "";
        TxtRePwd.Text = "";
        TxtTel.Text = "";
        TxTAdress.Text = "";
        CBAgree.Checked = false;
    }
    protected void TxtRePwd_TextChanged(object sender, EventArgs e)
    {
        if (TxtPwd.Text != TxtRePwd.Text)
        {
            BtnRgister.Enabled = false;
        }
        else
        {
            BtnRgister.Enabled = true;
        }
    }
    protected void BtnRgister_Click(object sender, EventArgs e)
    {
        SqlHelper sh = new SqlHelper();
        IDbConnection con = sh.getCon();
        String sql = String.Format("Insert into users(username,password,tel,address)Values('{0}','{1}','{2}','{3}')",TxtAccount.Text,TxtPwd.Text,TxtTel.Text,TxTAdress.Text);
        if (CBAgree.Checked)
        {
            bool flag = sh.ExeNonQuery(sql);
            if (flag)
            {
                Response.Write("<script>alert('恭喜您注册成功！');location.href='ShowFoods.aspx';</script>");
                //Response.Write("<script>document.location=document.location;alert('恭喜您注册成功！')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('请阅读相关协议！')</script>");
        }
        /*
         if (CBAgree.Checked)
        {
            TxtPolicy.Text = "你选中了同意条款";
        }else
            TxtPolicy.Text = "你没选中了同意条款";
        
         * /
         
         /*
        String ConnString = "Data Source=.;Initial Catalog=MySmart;User Id=sa;Pwd=123456;";
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConnString;
        con.Open();  //连接并打开数据库
        TxtPolicy.Text = "连接成功";
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con; //拿到连接
       
        String sql = String.Format("Insert into T_Customer Values('{0}','{1}','{2}','{3}','{4}')", TxtAccount.Text, TxtPwd.Text, TxtTel.Text, TxtMail.Text, TxtAge.Text);
        cmd.CommandText = sql;
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<Script>alert('
            */
    }
}