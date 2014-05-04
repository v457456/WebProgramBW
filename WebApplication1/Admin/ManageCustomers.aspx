<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="WebApplication1.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <h1 align="center">Manage Customers</h1>
        <br />
        <hr style="width:90%; margin-left:auto; margin-right:auto;margin-bottom:15px;margin-top:5px;"/>
        <br />
        <div>
            <div>
                <div style="width:100%; text-align:left; margin-left:40px;"><h2 style="padding-bottom:5px;display:inline;margin:0 50px 0 30px">Add New Customer</h2>
                    <div style="text-align:right;display:inline;padding-left:80px">Please fill in the new customer name and click &#39;Submit&#39; to create a new customer.</div>
                        </div>

                    <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto;margin-bottom: 5px;" />
                    
                <table style="width: 90%; height: 130px; color: #000000;margin: 0 auto 0 auto; text-align:center">
                         <tr>
                            <td width="40%" align="right" class="style2">
                                 <b>Customer Name:</b></td>
                             <td width="50%" align="left" class="style1" ID="CustomerCell" runat="server">
                                <input runat="server" id="CustomerName" type="text" size="40" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CustomerName"
                                    ErrorMessage="Customer name required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                               <b>Customer Phone Number:</b></td>
                            <td align="left" class="style1" ID="Td1" runat="server">
                                <input runat="server" id="CustomerPhone" type="text" size="20" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                                 <b>Customer Email:</b></td>
                            <td align="left" class="style1" ID="Td2" runat="server">
                                <input runat="server" id="CustomerEmail" type="text" size="40" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style2">
                            &nbsp;</td>
                            <td align="right" class="style1">
                                <asp:Button ID="submitButton" runat="server" Text="Submit" 
                                onclick="submitButton_Click" Width="100px" Height="25px" ValidationGroup="SubmitGroup"/>
                            </td>
                       </tr>
                    </table>
                </div>
           
        <script type="text/javascript">

            $(document).ready(function () {
                $("#<%=CustomerGridView.ClientID%>").keydown(function (e) {
                    if (e.keyCode == 13) {
                        return false;
                    }
                });

            });

        </script>
        
               <div style="margin:0 auto 0 auto; width:100%;padding-top: 20px;">
                <h3 style=" text-align:center;">View and Edit Customers</h3><br />
              
                <hr style="width: 65%; margin-top: 0px; margin-left: auto; margin-right: auto; margin-bottom: 10px;" />
     
            
              
                    <asp:GridView ID="CustomerGridView" 
                     runat="server" 
                        AllowPaging="True" 
                        GridLines="None" 
                        BackColor="#B3C0C4" 
                        AllowSorting="True" 
                        AutoGenerateColumns="False" 
                        BorderColor="Gray" 
                        BorderStyle="Solid" 
                        BorderWidth="1px" 
                        CellPadding="4" 
                        CellSpacing="1" 
                        Width="100%"
                        HorizontalAlign="Center"
                        ForeColor="#333333" 
                        DataSourceID="SqlDataSource1"
                        onRowUpdating="CustomerGridView_RowUpdating"
                        DataKeyNames="id"  >
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name">
                                <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>
                            <asp:BoundField DataField="phone_number" HeaderText="Phone Number" SortExpression="phone_number">
                                <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="Email Address" SortExpression="email">
                                <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                            </asp:BoundField>
                             <asp:CommandField ShowEditButton="True" >
                        <HeaderStyle Width="35px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="headerclear"/>
                        <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:CommandField>

               
                        </Columns>
              
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <asp:SqlDataSource 
                        ID="SqlDataSource1" 
                        runat="server" 
                        ConnectionString="<%$ ConnectionStrings:vanlocal %>"
                         ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [id], [name], [phone_number], [email] FROM [pms_customer] ORDER BY [name];"
                     >
                        <UpdateParameters>
                            <asp:Parameter Name="name" />
                            <asp:Parameter Name="phone_number" />
                            <asp:Parameter Name="email" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
        </div>


    </div>
</asp:Content>
