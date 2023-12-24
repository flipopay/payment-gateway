using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Services.Description;

namespace SPINTEGRATION.merchant
{
    public partial class generatekey : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                txt_mid.Text = Session["MID"].ToString();
                if (Session["Key"].ToString() == "0")
                {
                    btn_urlsubmit.Text = "Generate Key";
                }
                else
                {
                    txt_secretkey.Text = Session["Key"].ToString();
                    btn_urlsubmit.Text = "Generate New Key";
                }
            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message, ex);
                
            }
            
        }

        protected void btn_urlsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                txt_secretkey.Text = GenerateApiKey();
                if (txt_secretkey.Text != "")
                {
                    DataTable dtIntTrans = new DataTable();
                    SqlConnection connIntTrans = new SqlConnection(mainConnectionString);
                    SqlCommand cmdIntTrans = new SqlCommand();
                    cmdIntTrans.Connection = connIntTrans;
                    cmdIntTrans.CommandText = "usp_Gen_Secret_Key_By_Merchant";
                    cmdIntTrans.CommandType = CommandType.StoredProcedure;
                    cmdIntTrans.Parameters.AddWithValue("@MID", txt_mid.Text);
                    cmdIntTrans.Parameters.AddWithValue("@KEY", txt_secretkey.Text);

                    SqlDataAdapter daIntTrans = new SqlDataAdapter(cmdIntTrans);
                    daIntTrans.Fill(dtIntTrans);
                }
            }
            catch (Exception)
            {

               
            }
            
           
        }

        public string GenerateApiKey()
        {
             var provider = new RNGCryptoServiceProvider();
            var bytes = new byte[32];
            provider.GetBytes(bytes);

            string str=Convert.ToBase64String(bytes)
                .Replace("/", "")
                .Replace("+", "");
            

            return "amvt_" + str.Replace("=","");
            
        }
    }
}