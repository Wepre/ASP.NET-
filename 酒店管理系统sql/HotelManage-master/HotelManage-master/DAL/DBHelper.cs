using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace DAL
{
    public class DBHelper
    {
        //public static SqlConnection sqlconn;
        //public static void conn() {
        //private static string str = "server=(LocalDB);integrated security= true;Catalog=|DataDirectory|\\HotelManage1.mdf";
        private static string str = ConfigurationManager.ConnectionStrings["myconnect"].ConnectionString;
        //sqlconn = new SqlConnection(sql);
        //sqlconn.Open();
        //}
        public static DataTable Query(string sql)
        {
            SqlConnection conn = new SqlConnection(str);
            SqlCommand comm = new SqlCommand(sql, conn);
            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public static int Modify(string sql)
        {
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand comm = new SqlCommand(sql, conn);
            int res = comm.ExecuteNonQuery();
            conn.Close();
            return res;
        }
    }
}
