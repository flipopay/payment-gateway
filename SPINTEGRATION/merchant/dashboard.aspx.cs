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
    public partial class dashboard : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

        public string totalAmt, totalTrans, totalSuccess, totalFail;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string key = Session["MID"].ToString();
                if (!string.IsNullOrEmpty(key))
                {
                    BindRealTimeData();
                    DataSet ds = new DataSet();
                    SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                    SqlCommand cmdIntTrans = new SqlCommand();
                    cmdIntTrans.Connection = connIntTrans;
                    cmdIntTrans.CommandText = "usp_payin_payout_db_By_Merchant";
                    cmdIntTrans.CommandType = CommandType.StoredProcedure;
                    cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
                    SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                    daIntTrans.Fill(ds);
                    if (ds.Tables.Count > 0)
                    {
                        totalAmt = ds.Tables[0].Rows[0]["Payin_Amt"].ToString();
                        totalTrans = ds.Tables[1].Rows[0]["totalTrans"].ToString();
                        totalSuccess = ds.Tables[2].Rows[0]["totalSucess"].ToString();
                        totalFail = ds.Tables[3].Rows[0]["totalFailure"].ToString();

                    }
                }
            }
            catch (Exception)
            {

                Response.Redirect("~/login.aspx");
            }
            

        }
        public void BindRealTimeData()
        {

            DataTable ds = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_user_db_payout_payin";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                GridView_Real_Time.DataSource = ds;
                GridView_Real_Time.DataBind();

            }

        }
    }
}