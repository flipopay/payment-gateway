using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SPINTEGRATION.admin
{
    public partial class admin_mst : System.Web.UI.MasterPage
    {
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {if (!string.IsNullOrEmpty(Session["Name"].ToString())) { name = Session["Name"].ToString(); }
                
            }
            catch (Exception)
            {

                Response.Redirect("~/login_admin.aspx");
            }
            
        }
    }
}