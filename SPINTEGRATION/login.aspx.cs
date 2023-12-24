using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SPINTEGRATION
{
    public partial class login : System.Web.UI.Page
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
            cmdIntTrans.CommandText = "usp_user_login";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@Email", txt_email.Text);
            cmdIntTrans.Parameters.AddWithValue("@Password", txt_password.Text);
           
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(dtLogin);
            if (dtLogin.Rows.Count>0)
            {
                Session["MID"] = dtLogin.Rows[0]["MID"].ToString();
                Session["Key"] = dtLogin.Rows[0]["Secrete_Key"].ToString();
                Session["AStatus"] = dtLogin.Rows[0]["Approved_Status"].ToString();
                Response.Redirect("merchant/dashboard.aspx");
            }
        }
    }
}