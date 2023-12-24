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
    public partial class dashboard : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

        public string totalAmt, totalTrans, totalSuccess, totalFail;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                BindRealTimeData();

                DataSet ds = new DataSet();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_payin_db_By_Admin";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;
                //cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
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
            catch (Exception)
            {

                Response.Redirect("login_admin.aspx");
            }
                
            
        }
        public void BindRealTimeData()
        {

            DataTable ds = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_admin_db_payout_payin";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            //cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
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