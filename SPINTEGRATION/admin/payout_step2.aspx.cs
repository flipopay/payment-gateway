using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace SPINTEGRATION.admin
{
    public partial class payout_step2 : System.Web.UI.Page
    {
        public static readonly string mainConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                        //txt_Payout.ReadOnly = true;
                        //btn_transfer.Enabled = false;
                    }


                }
            }
            catch (Exception)
            {

                Response.Redirect("login_admin.aspx");
            }
            
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlConnection connIntTrans1 = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans1 = new SqlCommand();
                cmdIntTrans1.Connection = connIntTrans1;
                cmdIntTrans1.CommandText = "usp_admin_db_payout_payin_2";
                cmdIntTrans1.CommandType = CommandType.StoredProcedure;
                cmdIntTrans1.Parameters.AddWithValue("@MID", ddl_user.SelectedValue);
                SqlDataAdapter daIntTrans1 = new SqlDataAdapter(cmdIntTrans1);
                daIntTrans1.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0 && ds.Tables[1].Rows.Count > 0 && ds.Tables[2].Rows.Count > 0)
                {
                    int totalamt = (Convert.ToInt32(ds.Tables[0].Rows[0]["collection_amt"]) + Convert.ToInt32(ds.Tables[2].Rows[0]["closing_balance"]));
                    int totalpayout = Convert.ToInt32(ds.Tables[1].Rows[0]["payout_amt"]);
                    int balance = totalamt - totalpayout;
                    lbl_total_amt.Text = totalamt.ToString();
                    lbl_total_payout.Text = totalpayout.ToString();
                    lbl_balance.Text = balance.ToString();
                    if (balance <= 0)
                    {
                        //txt_Payout.ReadOnly = true;
                        //btn_transfer.Enabled = false;
                    }
                }
                else
                {
                    int totalamt = Convert.ToInt32(ds.Tables[0].Rows[0]["collection_amt"]);
                    int totalpayout = Convert.ToInt32(ds.Tables[1].Rows[0]["payout_amt"]);
                    int balance = totalamt - totalpayout;
                    lbl_total_amt.Text = totalamt.ToString();
                    lbl_total_payout.Text = totalpayout.ToString();
                    lbl_balance.Text = balance.ToString();
                    if (balance <= 0)
                    {
                        txt_Payout.ReadOnly = true;
                        btn_transfer.Enabled = false;
                    }
                }
                txt_charges.Text = ds.Tables[3].Rows[0]["Payin_Tax"].ToString();
            }
            catch (Exception)
            {

                Response.Redirect("login_admin.aspx");
            }
           

           
        }

        protected void txt_Payout_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string myStringVariable = "";
                if (Convert.ToInt32(txt_Payout.Text) > Convert.ToInt32(lbl_balance.Text))
                {
                    myStringVariable = "Please enter valid amount,must be less than balance";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                    txt_Payout.Text = "";
                }
                else
                {
                    double tx = Convert.ToDouble(txt_charges.Text);
                    double payout = Convert.ToDouble(txt_Payout.Text);
                    double totaltax = payout * tx / 100;
                    txt_charge.Text = totaltax.ToString();
                    txt_transferable_amt.Text = (payout - totaltax).ToString();
                    //myStringVariable = "transfered sucessfull";
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                }
            }
            catch (Exception)
            {

                Response.Redirect("login_admin.aspx");
            }
            

        }

        protected void btn_transfer_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                SqlConnection connIntTrans1 = new SqlConnection(mainConnectionString);
                SqlCommand cmdIntTrans1 = new SqlCommand();
                cmdIntTrans1.Connection = connIntTrans1;
                cmdIntTrans1.CommandText = "usp_insert_payOut_order";
                cmdIntTrans1.CommandType = CommandType.StoredProcedure;
                cmdIntTrans1.Parameters.AddWithValue("@MID", ddl_user.SelectedValue);
                cmdIntTrans1.Parameters.AddWithValue("@Amount", txt_Payout.Text);
                cmdIntTrans1.Parameters.AddWithValue("@Tax", txt_charge.Text);
                cmdIntTrans1.Parameters.AddWithValue("@Total_Amt", txt_transferable_amt.Text);
                SqlDataAdapter daIntTrans1 = new SqlDataAdapter(cmdIntTrans1);
                daIntTrans1.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToInt32(dt.Rows[0]["trans_id"]) > 0)
                    {
                        string myStringVariable = "transfered sucessfull";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');", true);
                        txt_Payout.Text = "";
                        btn_transfer.Enabled = false;

                    }
                }
            }
            catch (Exception)
            {
                throw;
                //Response.Redirect("login_admin.aspx");
            }
            
        }
    }
}