using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教材管理系统
{
    public partial class mains : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null|| Session["shenfen"]==null)
            {
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["name"] == null || Request.QueryString["shenfen"] == null)
            {
                username.Text = Session["username"].ToString();
                shenfen.Text = Session["shenfen"].ToString();
            }
            else
            {
                username.Text = Request.QueryString["name"];
                shenfen.Text = Request.QueryString["shenfen"];
            }
            Sqlclass d = new Sqlclass();
            string s = "select * from loginLog";
            DataTable dr = d.GetDataTable(s);
            fagnwenliang.Text =dr.Rows.Count.ToString();
            s = "select * from [User] where online=1";
           dr = d.GetDataTable(s);
            online.Text= dr.Rows.Count.ToString();
        }

        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {

        }

        public void Clear(object sender, EventArgs e)
        {
            Session["username"] = null;
            Session["shenfen"] = null;
            ClearClientPageCache();
            Response.Redirect("mains.aspx");
        }

        public void ClearClientPageCache()
        {
            //清除浏览器缓存
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1));
            Response.Expires = 0;
            Response.CacheControl = "no-cache";
            Response.Cache.SetNoStore();
        }
    }
}