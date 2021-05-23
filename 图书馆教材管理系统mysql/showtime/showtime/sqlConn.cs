using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
namespace showtime
{
    
    public class sqlConn
    {
       public string name;
       public string pwd;
       public MySqlConnection conn = null;
       public MySqlCommand cmd = null;
        public sqlConn()
        {

            string sql = "server=localhost;user id=root;password=xfn123;persistsecurityinfo=True;database=bigwork";
            conn = new MySqlConnection(sql);
            cmd = new MySqlCommand();
            cmd.Connection = conn;
        }
        public bool alter(string xing,string jiu, string name)
        {
            try
            {
                string sql = "update user set pwd=@pwd1 where (name=@name and pwd=@pwd2)";
                cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("pwd1", xing);
                cmd.Parameters.AddWithValue("pwd2", jiu);
                cmd.Parameters.AddWithValue("name", name);

                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
            finally
            {
                conn.Close();
            }
        }
        public int insert(string name,string pwd)
        {
            string sql_oper = "insert into user(name,pwd) values('" + name + "','" + pwd + "')";
            cmd.CommandText = sql_oper;
            if (conn.State==System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            return cmd.ExecuteNonQuery(); ;

        }
        public int select(string name,string pwd)
        {
            int flag = 0;
            string sqll = "SELECT * FROM bigwork.user where name='" + name + "' and pwd='" + pwd + "''";
            cmd.CommandText = sqll;
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
            }
            object o = cmd.ExecuteScalar();
            //if (cmd.ExecuteScalar()!=DBNull.Value)
            //{
            //    flag = 1;
            //}
            return flag;
        }
        public bool verifyUser(string name,string password)
        {
            
                string sqll = "select * from user where name=@name and pwd=@password";
                cmd = new MySqlCommand(sqll, conn);
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("password", password);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    return true;
                }
                return false;
           
        }
        
    }
}