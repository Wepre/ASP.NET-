using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace 教材管理系统
{
    public class Sqlclass
    {
        //SqlConnection conn = new SqlConnection(@"Server=(localdb)\mssqllocaldb;Database=bookDB;Trusted_Connection=True;MultipleActiveResultSets=true");
        SqlConnection conn = new SqlConnection(@"server=.;database=bookDB;uid=sa;pwd=xfn123");
        public int GetRun(string sqlstr)//对添加，修改，删除的操作，Flag返回影响的行数
        {
            int Flag;
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            Flag = cmd.ExecuteNonQuery();
            conn.Close();
            return Flag;
           
   
        }
     
        public SqlDataReader GetReader(string sqlstr)//返回查找查找数据库的一条记录
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }

 
        public DataTable GetDataTable(string sqlstr)//返回datatable类型的数据
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlstr, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
    }
}
