<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="rptchargeback.aspx.cs" Inherits="SPINTEGRATION.merchant.rptchargeback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>Report-Collection</div>
          </h1>
          <div class="section-body">
            <div class="card">
                <div class="card-body">
                    <div class="alert alert-info mb-0">
                        <form method="POST" runat="server">
                            <div class="row">
                                <div class="form-group col-2">
                                  
                                    <asp:TextBox ID="txt_fromdate" type="date" runat="server" class="form-control" autofocus></asp:TextBox>
                                   
                                </div>
                                <div class="form-group col-2">
                               
                                    <asp:TextBox ID="txt_todate" type="date" runat="server" class="form-control"></asp:TextBox>
                                   
                                </div>
                                <div class="form-group col-3">
                                    <asp:TextBox ID="txt_search" runat="server" class="form-control"></asp:TextBox>
                                  
                                </div>
                                 <div class="form-group col-2">
                                       
                                        <asp:Button ID="btn_search" runat="server" Text="Search" class="btn btn-primary btn-block" />
                                    </div>
                                 <div class="form-group col-2">
                                       
                                        <asp:Button ID="btn_download" runat="server" Text="Register" class="btn btn-primary btn-block" />
                                    </div>
                            </div>
                        </form>
               
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Collection Details</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Created At</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>Irwansyah Saputra</td>
                                        <td>2017-01-09</td>
                                        <td>
                                            <div class="badge badge-success">Active</div>
                                        </td>
                                        <td><a href="#" class="btn btn-action btn-secondary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Hasan Basri</td>
                                        <td>2017-01-09</td>
                                        <td>
                                            <div class="badge badge-success">Active</div>
                                        </td>
                                        <td><a href="#" class="btn btn-action btn-secondary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Kusnadi</td>
                                        <td>2017-01-11</td>
                                        <td>
                                            <div class="badge badge-danger">Not Active</div>
                                        </td>
                                        <td><a href="#" class="btn btn-action btn-secondary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Rizal Fakhri</td>
                                        <td>2017-01-11</td>
                                        <td>
                                            <div class="badge badge-success">Active</div>
                                        </td>
                                        <td><a href="#" class="btn btn-action btn-secondary">Detail</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        </section>
</asp:Content>
