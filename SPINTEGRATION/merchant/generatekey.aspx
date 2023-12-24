<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="generatekey.aspx.cs" Inherits="SPINTEGRATION.merchant.generatekey" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section class="section">
          <h1 class="section-header">
            <div>Generate Key</div>
          </h1>
         <div class="card card-primary">
             <div class="card-header">
                 <h4>Generate Secret Key</h4>
             </div>

             <div class="card-body">
                 <form method="POST" runat="server">
                     <div class="form-group">
                         <label for="email">MID</label>
                         <asp:TextBox ID="txt_mid" runat="server" class="form-control" ReadOnly></asp:TextBox>

                         <div class="invalid-feedback">
                         </div>
                     </div>
                     <div class="form-group">
                         <label for="email">Secret Key</label>
                         <asp:TextBox ID="txt_secretkey" runat="server" class="form-control" ReadOnly></asp:TextBox>

                         <div class="invalid-feedback">
                         </div>
                     </div>

                     <div class="form-group">

                         <asp:Button ID="btn_urlsubmit" runat="server" Text="Generate Key" class="btn btn-primary btn-block" OnClick="btn_urlsubmit_Click" />
                     </div>
                 </form>
             </div>
         </div>
        </section>
</asp:Content>
