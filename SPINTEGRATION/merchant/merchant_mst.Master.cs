using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPINTEGRATION.merchant
{
    public partial class merchant_mst : System.Web.UI.MasterPage
    {
        public string mid;

        protected void Page_Load(object sender, EventArgs e)
        {
            mid = Session["MID"].ToString();

        }
    }
}