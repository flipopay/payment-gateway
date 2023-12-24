using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace SPINTEGRATION.merchant
{
    public partial class basicdetails : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dtLogin = new DataTable();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_get_basic_details";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;
                cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"].ToString());
                cmdIntTrans.Parameters.AddWithValue("@KEY", Session["Key"].ToString());

                SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                daIntTrans.Fill(dtLogin);
                if (dtLogin.Rows.Count > 0)
                {
                    txt_name.Text = dtLogin.Rows[0]["Name"].ToString();
                    txt_BName.Text = dtLogin.Rows[0]["BName"].ToString();
                    txt_email.Text = dtLogin.Rows[0]["Email"].ToString();
                    txt_mobile.Text = dtLogin.Rows[0]["Mobile"].ToString();
                    txt_GST.Text = dtLogin.Rows[0]["GST"].ToString();
                    txt_Pin.Text = dtLogin.Rows[0]["Pin"].ToString();
                    txt_acc.Text = dtLogin.Rows[0]["Account"].ToString();
                    txt_ifsc.Text = dtLogin.Rows[0]["IFSC"].ToString();
                    txt_add.Text = dtLogin.Rows[0]["Address"].ToString();
                }
            }
            catch (Exception)
            {

                Response.Redirect("~/login.aspx");
            }
           
        }
    }
}