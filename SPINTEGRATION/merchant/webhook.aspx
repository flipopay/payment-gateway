<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="webhook.aspx.cs" Inherits="SPINTEGRATION.merchant.webhook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>Web Hook</div>
          </h1>
         <div class="card card-primary">
                            <div class="card-header">
                                <h4>Callback Details</h4>
                            </div>

                            <div class="card-body">
                                <form method="POST" runat="server">
                                    <div class="form-group">
                                        <label for="email">IP Address</label>
                                        <asp:TextBox ID="txt_IP" runat="server" class="form-control" required autofocus></asp:TextBox>
                                      
                                        <div class="invalid-feedback">
                                            please fill IP address
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">PayIn Url</label>
                                        <asp:TextBox ID="txt_payinurl" runat="server" class="form-control" required autofocus></asp:TextBox>
                                      
                                        <div class="invalid-feedback">
                                            Please fill payin callback url
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">Payout Url</label>
                                        <asp:TextBox ID="txt_payouturl" runat="server" class="form-control" required autofocus></asp:TextBox>
                                       
                                        <div class="invalid-feedback">
                                             Please fill payout callback url
                                        </div>
                                    </div>
                                    <div class="form-group">
                                       
                                        <asp:Button ID="btn_urlsubmit" runat="server" Text="Submit" class="btn btn-primary btn-block" OnClick="btn_urlsubmit_Click" />
                                    </div>
                                </form>
                            </div>
                        </div>
        </section>
</asp:Content>
