<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="basicdetails.aspx.cs" Inherits="SPINTEGRATION.merchant.basicdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card card-primary">
                            <div class="card-header">
                                <h4>Basic Details</h4>
                            </div>

                            <div class="card-body">
                                <form method="POST" runat="server">
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label for="frist_name">Name</label>
                                            <asp:TextBox ID="txt_name" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                            <%--<input id="frist_name" type="text" class="form-control" name="frist_name" autofocus>--%>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="last_name">Business Email</label>
                                            <asp:TextBox ID="txt_email" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                            <%--<input id="last_name" type="text" class="form-control" name="last_name">--%>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Business Name</label>
                                        <asp:TextBox ID="txt_BName" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                        <%--<input id="email" type="email" class="form-control" name="email">--%>
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label for="password" class="d-block">Account</label>
                                            <asp:TextBox ID="txt_acc" runat="server" class="form-control" placeholder="Company Account Number" ReadOnly  required></asp:TextBox>
                                            <div class="invalid-feedback">
                                                please fill company account number
                                           </div>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="password2" class="d-block">IFSC</label>
                                           
                                            <asp:TextBox ID="txt_ifsc" runat="server" class="form-control"  placeholder="Ifsc code"  ReadOnly required></asp:TextBox>
                                        </div>
                                    </div>

                                   <%-- <div class="form-divider">
                                        
                                    </div>--%>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Mobile</label>
                                            <asp:TextBox ID="txt_mobile" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                        </div>
                                        <div class="form-group col-6">
                                            <label>GSTIN</label>
                                            <asp:TextBox ID="txt_GST" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                        </div>
                                    </div>
                                     <div class="form-group">
                                        <label for="email">Address</label>
                                        <asp:TextBox ID="txt_add" runat="server" class="form-control" TextMode="MultiLine" ReadOnly></asp:TextBox>
                                        <%--<input id="email" type="email" class="form-control" name="email">--%>
                                        <div class="invalid-feedback">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-6">
                                            <label>Country</label>
                                            <asp:TextBox ID="txt_city" runat="server" class="form-control" Text="India" ReadOnly></asp:TextBox>
                                            <%--<input type="text" class="form-control">--%>
                                        </div>
                                        <div class="form-group col-6">
                                            <label>Postal Code</label>
                                            <asp:TextBox ID="txt_Pin" runat="server" class="form-control" ReadOnly></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="agree" class="custom-control-input" id="agree" checked="checked">
                                            <label class="custom-control-label" for="agree">I agree with the terms and conditions</label>
                                        </div>
                                    </div>

                                   <%-- <div class="form-group">
                                       
                                        <asp:Button ID="btn_submit" runat="server" Text="Register" class="btn btn-primary btn-block"  Enabled="false" />
                                    </div>--%>
                                </form>
                            </div>
                        </div>
</asp:Content>
