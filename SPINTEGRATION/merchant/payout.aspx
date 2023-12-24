<%@ Page Title="" Language="C#" MasterPageFile="~/merchant/merchant_mst.Master" AutoEventWireup="true" CodeBehind="payout.aspx.cs" Inherits="SPINTEGRATION.merchant.payout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>Current-Payout</div>
          </h1>
          <div class="section-body">
            <div class="row">
              <div class="col-12 col-md-12 col-lg-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Payout Details</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                        <form runat="server">
                            <asp:GridView ID="GridView_Payout" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" AllowPaging="True" PageSize="100">
                                 <Columns>
                                            <asp:TemplateField HeaderText="S No">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="Trans Date" DataField="Created_On" />
                                            <asp:BoundField HeaderText="Trans ID" DataField="Trans_ID" />
                                            <asp:BoundField HeaderText="Order ID" DataField="Order_ID" />
                                            <asp:BoundField HeaderText="DR" DataField="Amount" />
                                             <asp:BoundField HeaderText="Tax" DataField="Tax" />
                                            <asp:BoundField HeaderText="Total_Amt" DataField="Total_Amt" />
                                             <asp:BoundField HeaderText="Account" DataField="Account" />
                                            <asp:BoundField HeaderText="Name" DataField="Name" />
                                            <asp:BoundField HeaderText="UTR" DataField="UTR" />
                                             <asp:BoundField HeaderText="Status" DataField="Status" />
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
