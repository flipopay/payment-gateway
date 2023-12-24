<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin_mst.Master" AutoEventWireup="true" CodeBehind="userlist.aspx.cs" Inherits="SPINTEGRATION.admin.userlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section">
          <h1 class="section-header">
            <div>User List</div>
          </h1>
          <div class="section-body">
           
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>User Details</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <form runat="server">
                                    <asp:GridView ID="GridView_User" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" PagerStyle-HorizontalAlign="Right" AllowPaging="True" PageSize="100">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S No">
                                              
                                                                                            
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="MID" DataField="MID" />
                                            <asp:BoundField HeaderText="Name" DataField="Name" />
                                            <asp:BoundField HeaderText="Payout Amt" DataField="Payout_Amt" />
                                            <asp:BoundField HeaderText="Payin Amt" DataField="Payin_Amt" />
                                            <asp:BoundField HeaderText="Payout Charge" DataField="Payout_Tax" />
                                            <asp:BoundField HeaderText="Payin Charge" DataField="Payin_Tax" />
                                            <asp:BoundField HeaderText="SID" DataField="SID" />
                                            <asp:BoundField HeaderText="Approved Status" DataField="Approved_Status" />
                                           
                                           
                                           
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server"   NavigateUrl='<%# "~/admin/edituser.aspx?MID=" + Eval("MID")%>' Text="Edit"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           
                                           
                                           
                                        </Columns>

                                        <PagerStyle HorizontalAlign="Right"></PagerStyle>
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
