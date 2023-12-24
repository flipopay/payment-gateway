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
    public partial class rptpayout : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                SqlConnection connIntTrans1 = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans1 = new SqlCommand();
                cmdIntTrans1.Connection = connIntTrans1;
                cmdIntTrans1.CommandText = "usp_user_name_list";
                cmdIntTrans1.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter daIntTrans1 = new SqlDataAdapter(cmdIntTrans1);
                daIntTrans1.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddl_user.DataSource = dt;
                    ddl_user.DataTextField = dt.Columns["txtfield"].ToString();
                    ddl_user.DataValueField = dt.Columns["MID"].ToString();
                    ddl_user.DataBind();

                }

                DataTable ds = new DataTable();
                SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans = new SqlCommand();
                cmdIntTrans.Connection = connIntTrans;
                cmdIntTrans.CommandText = "usp_admin_payout_list";
                cmdIntTrans.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                daIntTrans.Fill(ds);
                if (ds.Rows.Count > 0)
                {
                    GridView_Payout.DataSource = ds;
                    GridView_Payout.DataBind();

                }
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string fromdt = "0", todt = "0", refno = "0";
            if (!string.IsNullOrEmpty(txt_fromdate.Text))
            {
                fromdt = txt_fromdate.Text; todt = txt_todate.Text;
            }
            if (!string.IsNullOrEmpty(ddl_user.SelectedValue))
            {
                refno = ddl_user.SelectedValue;
            }
            DataTable ds = new DataTable();
            SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
            SqlCommand cmdIntTrans = new SqlCommand();
            cmdIntTrans.Connection = connIntTrans;
            cmdIntTrans.CommandText = "usp_admin_payout_search";
            cmdIntTrans.CommandType = CommandType.StoredProcedure;
            cmdIntTrans.Parameters.AddWithValue("@MID", refno);
            cmdIntTrans.Parameters.AddWithValue("@FROM_DATE", fromdt);
            cmdIntTrans.Parameters.AddWithValue("@TO_DATE", todt);
            //cmdIntTrans.Parameters.AddWithValue("@REF_NO", refno);
            SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
            daIntTrans.Fill(ds);
            if (ds.Rows.Count > 0)
            {
                GridView_Payout.DataSource = ds;
                GridView_Payout.DataBind();

            }
        }
    }
}