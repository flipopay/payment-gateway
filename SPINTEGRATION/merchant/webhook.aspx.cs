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
    public partial class webhook : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dtIntTrans = new DataTable();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_get_IP_By_Merchant";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;
                cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"].ToString());
                SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                daIntTrans.Fill(dtIntTrans);
                if (dtIntTrans.Rows.Count > 0)
                {

                    if (dtIntTrans.Rows[0]["IPS"].ToString() != "IP")
                    {
                        txt_payouturl.Text = dtIntTrans.Rows[0]["Payout_Url"].ToString();
                        txt_payinurl.Text = dtIntTrans.Rows[0]["Payin_Url"].ToString();
                        txt_IP.Text = dtIntTrans.Rows[0]["IPS"].ToString();
                        txt_payouturl.ReadOnly = true;
                        txt_payinurl.ReadOnly = true;
                        txt_IP.ReadOnly = true;
                    }


                }
            }
            catch (Exception)
            {

                Response.Redirect("~/login.aspx");
            }
            
        }

        protected void btn_urlsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dtIntTrans = new DataTable();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_Update_IP_By_Merchant";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;
                cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"].ToString());
                cmdIntTrans.Parameters.AddWithValue("@Payout_Url", txt_payouturl.Text);
                cmdIntTrans.Parameters.AddWithValue("@Payin_Url", txt_payinurl.Text);
                cmdIntTrans.Parameters.AddWithValue("@IP", txt_IP.Text);

                SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                daIntTrans.Fill(dtIntTrans);
            }
            catch (Exception)
            {

               // throw;
            }
            
        }
    }
}