<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="rptsettel.aspx.cs" Inherits="SPINTEGRATION.merchant.rptsettel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
        <h1 class="section-header">
            <div>Report-Settlement</div>
        </h1>
        <div class="section-body">
            <form method="POST" runat="server">
                <div class="card">
                    <div class="card-body">
                        <div class="alert alert-info mb-0">

                            <div class="row">
                                <div class="form-group col-2">

                                    <asp:TextBox ID="txt_fromdate" type="date" runat="server" class="form-control"></asp:TextBox>

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


                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Settlement Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                   
                                        <asp:GridView ID="GridView_Settlement" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" AllowPaging="True" PageSize="100">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S No">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Settle Date" DataField="Created_On" />
                                                <asp:BoundField HeaderText="Trans ID" DataField="Trans_ID" />
                                                <asp:BoundField HeaderText="PayIN Amt" DataField="Amount" />
                                                <asp:BoundField HeaderText="Tax" DataField="Tax" />
                                                <asp:BoundField HeaderText="Total_Amt" DataField="Total_Amt" />
                                                <asp:BoundField HeaderText="Credit Amt" DataField="Total_Amt" />
                                            </Columns>
                                        </asp:GridView>
                                    
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </form>
        </div>
    </section>
</asp:Content>
