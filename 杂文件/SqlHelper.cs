using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
///SqlHelper 的摘要说明
/// </summary>
public class SqlHelper
{
    String connStr = "Data Source=.;Initial Catalog=OrderFoodData;Uid=sa;Pwd=123456";
    SqlConnection con;
    public SqlHelper()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
        con = new SqlConnection(connStr);
    }

    /*
    public SqlCommand getsqlCmd()
    {

        SqlCommand cmd;
        return cmd;
    }*/
    // 拿到数据库连接
    public SqlConnection getCon()
    {
        return con;
    }
    //查询类语句
    public DataTable Query(String sql)
    {
        if (con.State == ConnectionState.Closed)
            con.Open();
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(sql, con);
        sda.Fill(dt);
        return dt;
    }
    // 非查询语句
    public bool ExeNonQuery(String sql)
    {
        if (con.State == ConnectionState.Closed)
            con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = sql;
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
            return false;
        }
        return true;
    }
}