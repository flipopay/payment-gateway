using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPINTEGRATION.merchant
{
    public partial class rptsettel : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string key = Session["MID"].ToString();
                if (!string.IsNullOrEmpty(key))
                {
                    DataTable ds = new DataTable();
                    SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                    SqlCommand cmdIntTrans = new SqlCommand();
                    cmdIntTrans.Connection = connIntTrans;
                    cmdIntTrans.CommandText = "usp_user_settlement";
                    cmdIntTrans.CommandType = CommandType.StoredProcedure;
                    cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
                    SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                    daIntTrans.Fill(ds);
                    if (ds.Rows.Count > 0)
                    {
                        GridView_Settlement.DataSource = ds;
                        GridView_Settlement.DataBind();

                    }

                }
            }
            catch (Exception)
            {

                Response.Redirect("~/login.aspx");
            }
           
        }
    }
}