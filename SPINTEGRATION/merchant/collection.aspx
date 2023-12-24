<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="collection.aspx.cs" Inherits="SPINTEGRATION.merchant.collection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>Current-Collection</div>
          </h1>
          <div class="section-body">
           
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Collection Details</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form runat="server">
                                <asp:GridView ID="GridView_Collection" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" AllowPaging="True" PageSize="100">
                                    <Columns>
                                            <asp:TemplateField HeaderText="S No">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Trans Date" DataField="Created_On" />
                                            <asp:BoundField HeaderText="Trans ID" DataField="Trans_ID" />
                                            <asp:BoundField HeaderText="Order ID" DataField="Order_ID" />
                                            <asp:BoundField HeaderText="UTR" DataField="UTR" />
                                            <asp:BoundField HeaderText="UPI" DataField="UPI" />
                                            <asp:BoundField HeaderText="Name" DataField="Name" />
                                            <asp:BoundField HeaderText="CR" DataField="Amount" />
                                            <asp:BoundField HeaderText="Balance" DataField="Wallet_Amt" />
                                        </Columns>
                                </asp:GridView>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        </section>
</asp:Content>
