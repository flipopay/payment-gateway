<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_mst.Master" AutoEventWireup="true" CodeBehind="payout_step2.aspx.cs" Inherits="SPINTEGRATION.admin.payout_step2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <SCRIPT language=Javascript>
     
         function ValidNumeric() {

             var charCode = (event.which) ? event.which : event.keyCode;
             if (charCode >= 48 && charCode <= 57) { return true; }
             else { return false; }
         }  
         function userValid() {
             var payout = document.getElementById("txt_Payout").value;
             var balance = document.getElementById("lbl_balance").value;

             if (payout > balance) {
                 alert("Please enter valid amount,must be less than balance");
                 return false;
             }

             //if (Pwd == '') {
             //    alert("Please enter Password");
             //    return false;
             //}
         }    
     </SCRIPT>
     <section class="section">
          <h1 class="section-header">
            <div>Payout For Sub Merchant</div>
          </h1>
        <div class="section-body">
            <form method="POST" runat="server">
                <div class="card">
                    <div class="card-body">
                        <div class="alert alert-info mb-0">
                            <div class="row">
                                <div class="form-group col-4">
                                    <asp:DropDownList ID="ddl_user" runat="server" class="form-control" required></asp:DropDownList>
                                </div>
                                <div class="form-group col-2">
                                    <asp:Button ID="btn_search" runat="server" Text="Search" class="btn btn-primary btn-block" OnClick="btn_search_Click" />
                                </div>
                           </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Payout Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tr>
                                            <th>Total Available Amount</th>
                                            <th>Total Payout</th>
                                            <th>Balance Amount</th>
                                            <th>SP Charge</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="lbl_total_amt" class="form-control" runat="server" ReadOnly></asp:TextBox>
                                                </td>
                                            <td>
                                                <asp:TextBox ID="lbl_total_payout" class="form-control" runat="server" ReadOnly></asp:TextBox>
                                                </td>
                                            <td>
                                                <asp:TextBox ID="lbl_balance" class="form-control" runat="server" ReadOnly></asp:TextBox>
                                               </td>
                                            <td>
                                                <asp:TextBox ID="txt_charges" class="form-control" runat="server" ReadOnly></asp:TextBox>
                                               </td>
                                        </tr>
                                    </table>

                                    <table class="table table-striped">
                                        <tr>
                                            <th>Enter Payout Amount</th>
                                            <th>Charge+GST</th>
                                            <th>Net Amount For Transfer</th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txt_Payout" class="form-control" AutoPostBack="true" onkeypress="return ValidNumeric()" OnTextChanged="txt_Payout_TextChanged"  runat="server"></asp:TextBox>
                                               
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_charge" class="form-control" runat="server" ReadOnly></asp:TextBox></td>
                                               
                                            <td>
                                                <asp:TextBox ID="txt_transferable_amt" class="form-control" runat="server" ReadOnly></asp:TextBox>
                                               </td>
                                            <td>
                                                <asp:Button ID="btn_transfer" class="btn btn-primary btn-block" runat="server" Text="Transfer" OnClick="btn_transfer_Click" /></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        </section>
</asp:Content>
