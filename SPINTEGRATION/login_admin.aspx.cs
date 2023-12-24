using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPINTEGRATION
{
    public partial class login_admin : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            DataTable dtLogin = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_admin_login";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@UserID", txt_email.Text);
            cmdIntTrans.Parameters.AddWithValue("@PWD", txt_password.Text);

            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(dtLogin);
            if (dtLogin.Rows.Count > 0)
            {
                Session["Name"] = dtLogin.Rows[0]["Name"].ToString();
                Response.Redirect("admin/dashboard.aspx");
            }
            
        }
    }
}