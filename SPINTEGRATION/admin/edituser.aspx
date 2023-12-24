<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_mst.Master" AutoEventWireup="true" CodeBehind="edituser.aspx.cs" Inherits="SPINTEGRATION.admin.edituser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>User Master</div>
          </h1>
          <div class="section-body">
           
              <div class="card card-primary">
                  <div class="card-header">
                      <h4>Edit User</h4>
                  </div>

                  <div class="card-body">
                                <form method="POST" class="needs-validation" novalidate="" runat="server">
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label for="frist_name">Name</label>
                                            <asp:TextBox ID="txt_name" runat="server" placeholder="Contact Name" class="form-control" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill contact person Name
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="last_name">Business Email</label>
                                            <asp:TextBox ID="txt_email" runat="server" placeholder="Business Email" class="form-control" required></asp:TextBox>
                                           <div class="invalid-feedback">
                                                please fill business email
                                           </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Business Name</label>
                                        <asp:TextBox ID="txt_BName" name="bname" runat="server" placeholder="Company Name" class="form-control" required></asp:TextBox>
                                        
                                        <div class="invalid-feedback">
                                            please fill company name
                                        </div>
                                    </div>

                                     <div class="row">
                                        <div class="form-group col-6">
                                            <label for="password" class="d-block">Account</label>
                                            <asp:TextBox ID="txt_acc" runat="server" class="form-control" placeholder="Company Account Number"  required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill company account number
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="password2" class="d-block">IFSC</label>
                                           
                                            <asp:TextBox ID="txt_ifsc" runat="server" class="form-control"  placeholder="Ifsc code"  required></asp:TextBox>
                                        </div>
                                    </div>

                                  
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Mobile</label>
                                            <asp:TextBox ID="txt_mobile" runat="server" placeholder="Mobile Number" class="form-control" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill mobile number
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label>GSTIN</label>
                                            <asp:TextBox ID="txt_GST" runat="server" class="form-control" placeholder="Company GSTIN" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill GSTIN 
                                           </div>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">Address</label>
                                        <asp:TextBox ID="txt_add" runat="server" class="form-control" placeholder="Company Address" TextMode="MultiLine" required></asp:TextBox>
                                        <div class="invalid-feedback">
                                            please fill address 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>PAN</label>
                                            <asp:TextBox ID="txt_pan" runat="server" class="form-control" placeholder="User PAN Number"  required></asp:TextBox>
                                            
                                        </div>
                                        <div class="form-group col-6">
                                            <label>Postal Code</label>
                                            <asp:TextBox ID="txt_Pin" runat="server" class="form-control" placeholder="Pin Code" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill Pstal Code
                                           </div>
                                        </div>
                                    </div>
                                    <div class="form-divider">
                                        Web hook
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>IP</label>
                                            <asp:TextBox ID="txt_ip" runat="server" class="form-control" placeholder="IP Address"  required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill IP Address
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label>Pay Callback URL</label>
                                            <asp:TextBox ID="txt_payUrl" runat="server" class="form-control" placeholder="Collection call back url" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill callback url
                                           </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Web Site</label>
                                            <asp:TextBox ID="txt_web" runat="server" class="form-control" placeholder="web site" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill website 
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-divider">
                                        Commercial Charge
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Pay IN(%)</label>
                                            <asp:TextBox ID="txt_payin_rate" runat="server" class="form-control" placeholder="ex-2.50"  required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill Collection charges
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label>Pay Out(%)</label>
                                            <asp:TextBox ID="txt_payout_rate" runat="server" class="form-control" placeholder="ex-2.50" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill Payout charges
                                           </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>SID</label>
                                            <asp:TextBox ID="txt_sid" runat="server" class="form-control" placeholder="from time pay sid" required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill SID 
                                            </div>
                                        </div>

                                    </div>
                                    <%--<div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <asp:CheckBox ID="chk_term" runat="server" class="custom-control-input" Text="I agree with the terms and conditions" />
                                            <input type="checkbox" name="agree" class="custom-control-input" id="agree" checked="checked">
                                            <label class="custom-control-label" for="agree">I agree with the terms and conditions</label>
                                        </div>
                                    </div>--%>

                                    <div class="form-group">
                                       
                                        <asp:Button ID="btn_submit" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="btn_submit_Click"/>
                                    </div>
                                </form>
                            </div>
              </div>

        </div>
        </section>
</asp:Content>
