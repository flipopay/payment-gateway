using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;

namespace SPINTEGRATION.admin
{
    public partial class edituser : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            string mid = Request.QueryString["MID"].ToString();
            DataTable dtIntTrans = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_admin_get_merchant_details_by_mid";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@MID",mid);
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(dtIntTrans);
            if (dtIntTrans.Rows.Count>0)
            {
                txt_name.Text = dtIntTrans.Rows[0]["Name"].ToString();
                txt_BName.Text = dtIntTrans.Rows[0]["BName"].ToString();
                txt_mobile.Text = dtIntTrans.Rows[0]["Mobile"].ToString();
                txt_email.Text = dtIntTrans.Rows[0]["Email"].ToString();
                txt_web.Text = dtIntTrans.Rows[0]["Web"].ToString();
                txt_GST.Text = dtIntTrans.Rows[0]["GST"].ToString();
                txt_pan.Text = dtIntTrans.Rows[0]["Pan"].ToString();
                txt_add.Text = dtIntTrans.Rows[0]["Address"].ToString();
                txt_Pin.Text = dtIntTrans.Rows[0]["Pin"].ToString();
                txt_payout_rate.Text = dtIntTrans.Rows[0]["Payout_Tax"].ToString();
                txt_payin_rate.Text = dtIntTrans.Rows[0]["Payin_Tax"].ToString();
                txt_payUrl.Text = dtIntTrans.Rows[0]["Payout_Url"].ToString();
                txt_sid.Text = dtIntTrans.Rows[0]["SID"].ToString();
                txt_ip.Text = dtIntTrans.Rows[0]["IP_Address"].ToString();
                txt_acc.Text = dtIntTrans.Rows[0]["Account"].ToString();
                txt_ifsc.Text = dtIntTrans.Rows[0]["IFSC"].ToString();

            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string mid = Request.QueryString["MID"].ToString();
            DataTable dtIntTrans = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_admin_update_merchant_details_by_mid";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@Name", txt_name.Text);
            cmdIntTrans.Parameters.AddWithValue("@BName", txt_BName.Text);
            cmdIntTrans.Parameters.AddWithValue("@Mobile", txt_mobile.Text);
            cmdIntTrans.Parameters.AddWithValue("@Email", txt_email.Text);
            cmdIntTrans.Parameters.AddWithValue("@Account", txt_acc.Text);
            cmdIntTrans.Parameters.AddWithValue("@IFSC", txt_ifsc.Text);
            cmdIntTrans.Parameters.AddWithValue("@Web", txt_web.Text);
            cmdIntTrans.Parameters.AddWithValue("@Pan", txt_pan.Text);
            cmdIntTrans.Parameters.AddWithValue("@GST", txt_GST.Text);
            cmdIntTrans.Parameters.AddWithValue("@Address", txt_add.Text);
            cmdIntTrans.Parameters.AddWithValue("@Pin", txt_Pin.Text);
            cmdIntTrans.Parameters.AddWithValue("@MID", mid);
            cmdIntTrans.Parameters.AddWithValue("@Payout_Tax", txt_payout_rate.Text);
            cmdIntTrans.Parameters.AddWithValue("@Payin_Tax", txt_payin_rate.Text);
            cmdIntTrans.Parameters.AddWithValue("@Payout_Url", txt_payUrl.Text);
            cmdIntTrans.Parameters.AddWithValue("@Payin_Url", txt_payUrl.Text);
            cmdIntTrans.Parameters.AddWithValue("@SID", txt_sid.Text);
            cmdIntTrans.Parameters.AddWithValue("@IP", txt_ip.Text);
            cmdIntTrans.Parameters.AddWithValue("@Approved_Status", 1);
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(dtIntTrans);
            Response.Redirect("userlist.aspx");
        }
    }
}