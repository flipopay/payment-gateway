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
    public partial class rptcollection : System.Web.UI.Page
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
                    cmdIntTrans.CommandText = "usp_user_collection";
                    cmdIntTrans.CommandType = CommandType.StoredProcedure;
                    cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
                    SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                    daIntTrans.Fill(ds);
                    if (ds.Rows.Count > 0)
                    {
                        GridView_Collection.DataSource = ds;
                        GridView_Collection.DataBind();

                    }
                }
            }
            catch (Exception)
            {

                Response.Redirect("~/login.aspx");
            }
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string fromdt="0", todt="0",refno = "0";
            if (!string.IsNullOrEmpty(txt_fromdate.Text))
            {
                fromdt = txt_fromdate.Text; todt = txt_todate.Text; 
            }
            if (!string.IsNullOrEmpty(txt_search.Text))
            {
                refno = txt_search.Text;
            }
            DataTable ds = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_user_collection_search";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@MID", Session["MID"]);
            cmdIntTrans.Parameters.AddWithValue("@FROM_DATE", fromdt);
            cmdIntTrans.Parameters.AddWithValue("@TO_DATE", todt);
            cmdIntTrans.Parameters.AddWithValue("@REF_NO", refno);
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                GridView_Collection.DataSource = ds;
                GridView_Collection.DataBind();

            }
        }

        protected void btn_download_Click(object sender, EventArgs e)
        {

        }
    }
}