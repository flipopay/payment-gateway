<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="uploaddoc.aspx.cs" Inherits="SPINTEGRATION.merchant.uploaddoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>Documents</div>
          </h1>
         <div class="card card-primary">
                            <div class="card-header">
                                <h4>Document Details</h4>
                            </div>

                            <div class="card-body">
                                <form method="POST" runat="server">
                                    <div class="form-group">
                                        <label for="email">Account Number</label>
                                        <asp:TextBox ID="txt_accno" runat="server" class="form-control"></asp:TextBox>
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">IFSC</label>
                                        <asp:TextBox ID="txt_ifsc" runat="server" class="form-control"></asp:TextBox>
                                      
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">PAN(Firm)</label>
                                        <asp:TextBox ID="txt_pan" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">GST</label>
                                        <asp:TextBox ID="txt_gst" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Signatory PAN</label>
                                        <asp:TextBox ID="txt_sigpan" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Adhar</label>
                                        <asp:TextBox ID="txt_adhar" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                     <div class="form-divider">
                                        Upload Documents
                                     </div>
                                    <div class="form-group">
                                        <label for="email">MOA</label>
                                        <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">AOA</label>
                                        <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="email">GST</label>
                                        <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">PAN(Firm)</label>
                                        <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Adhar</label>
                                        <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">PAN</label>
                                        <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Cheque</label>
                                        <asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Photo</label>
                                        <asp:TextBox ID="TextBox8" runat="server" class="form-control"></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <asp:Button ID="btn_urlsubmit" runat="server" Text="Submit" class="btn btn-primary btn-block" />
                                    </div>
                                </form>
                            </div>
                        </div>
        </section>
</asp:Content>
