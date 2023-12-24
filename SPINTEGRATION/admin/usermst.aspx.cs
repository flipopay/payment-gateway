using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SPINTEGRATION.admin
{
    public partial class usermst : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            //try
            //{
                DataTable dtIntTrans = new DataTable();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_insert_merchant";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;
                cmdIntTrans.Parameters.AddWithValue("@Name", txt_name.Text);
                cmdIntTrans.Parameters.AddWithValue("@BName", txt_BName.Text);
                cmdIntTrans.Parameters.AddWithValue("@Mobile", txt_mobile.Text);
                cmdIntTrans.Parameters.AddWithValue("@Email", txt_email.Text);
                cmdIntTrans.Parameters.AddWithValue("@Sex", "M");
                cmdIntTrans.Parameters.AddWithValue("@Password", "spin@123");
                cmdIntTrans.Parameters.AddWithValue("@Web", txt_web.Text);
                cmdIntTrans.Parameters.AddWithValue("@Pan", txt_GST.Text);
                cmdIntTrans.Parameters.AddWithValue("@GST", txt_GST.Text);
                cmdIntTrans.Parameters.AddWithValue("@Address", txt_add.Text);
                cmdIntTrans.Parameters.AddWithValue("@Pin", txt_Pin.Text);

                cmdIntTrans.Parameters.AddWithValue("@Account", txt_acc.Text);
                cmdIntTrans.Parameters.AddWithValue("@IFSC", txt_ifsc.Text);
                cmdIntTrans.Parameters.AddWithValue("@Payout_Tax", txt_payout_rate.Text);
                cmdIntTrans.Parameters.AddWithValue("@Payin_Tax", txt_payin_rate.Text);
                cmdIntTrans.Parameters.AddWithValue("@Payout_Url", txt_payUrl.Text);
                cmdIntTrans.Parameters.AddWithValue("@Payin_Url", txt_payUrl.Text);
                cmdIntTrans.Parameters.AddWithValue("@SID", txt_sid.Text);
                cmdIntTrans.Parameters.AddWithValue("@IP", txt_ip.Text);
                SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                daIntTrans.Fill(dtIntTrans);
                if (dtIntTrans.Rows.Count > 0)
                {
                    Response.Redirect("userlist.aspx");
                }
                //}
                //catch (Exception)
                //{

                //    Response.Redirect("~/login_admin.aspx");
                //}
            }
    }
}