<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="SPINTEGRATION.merchant.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
        <h1 class="section-header">
            <div>Collection Dashboard</div>
        </h1>
        <div class="row">
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card card-sm-3">
                    <div class="card-icon bg-primary">
                        <i class="ion ion-person"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Total Amt</h4>
                        </div>
                        <div class="card-body">
                            <%=totalAmt %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card card-sm-3">
                    <div class="card-icon bg-danger">
                        <i class="ion ion-ios-paper-outline"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Total Trans</h4>
                        </div>
                        <div class="card-body">
                            <%=totalTrans %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card card-sm-3">
                    <div class="card-icon bg-warning">
                        <i class="ion ion-paper-airplane"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Success</h4>
                        </div>
                        <div class="card-body">
                            <%=totalSuccess %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-12">
                <div class="card card-sm-3">
                    <div class="card-icon bg-success">
                        <i class="ion ion-record"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>Failure</h4>
                        </div>
                        <div class="card-body">
                            <%=totalFail %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        
                        <h4>Dashboard Real Time</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <form runat="server">
                                <asp:GridView ID="GridView_Real_Time" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" AllowPaging="True" PageSize="100">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S No">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                        <asp:BoundField HeaderText="Name" DataField="Name" />
                                        <asp:BoundField HeaderText="Previous Day Balance" DataField="Previouse_Balance" />
                                        <asp:BoundField HeaderText="Today Collection" DataField="CollectionAmt" />
                                        <asp:BoundField HeaderText="Total Amt" DataField="TotalAmt" />
                                        <asp:BoundField HeaderText="Total Payout" DataField="payout" />
                                        <asp:BoundField HeaderText="Balance Amt" DataField="balance" />

                                    </Columns>

                                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                                </asp:GridView>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
       
    </section>
</asp:Content>
