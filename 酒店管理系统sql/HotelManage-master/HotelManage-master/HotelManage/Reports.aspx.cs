using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HotelManage
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        public void bind()
        {
            this.DropDownList1.DataSource = BLL_Hotel.Bind_DropDwonListBindYear();
            this.DropDownList1.DataTextField = "year";
            this.DropDownList1.DataValueField = "year";
            this.DropDownList1.DataBind();


        }

        public string year()
        {
            string year = this.DropDownList1.SelectedValue;
            return year;
        }
    }
}