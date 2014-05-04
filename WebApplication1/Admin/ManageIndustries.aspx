<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageIndustries.aspx.cs" Inherits="WebApplication1.Admin.ManageIndustries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

     <div>
        <h1 align="center">Manage Industries</h1>
        <br />
        <hr style="width:90%; margin-left:auto; margin-right:auto; margin-bottom:15px;margin-top: 5px;"/>
        <br />
         <div>
              <div>
                     <div style="width:100%; text-align:left; margin-left:40px;">
                         <h2 style="padding-bottom:5px;display:inline;margin:0 50px 0 30px">Add New Industry</h2>
                        <div style="text-align:right;display:inline;padding-left:80px">Please fill in the new industry name and click &#39;Submit&#39; to create a new industry.</div>
                    </div>
                   <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto;margin-bottom: 5px;" />
            <table style="width: 100%; height: 130px; color: #000000;margin: 0 auto 0 auto; text-align:center">
                 <tr>
                     <td width="30%" align="right" class="style2">
                        <b>Industry Name:</b></td>
                    <td width="70%" align="left" class="style1" height="25" >
                        <input id="IndustryName" runat="server" type="text" size="40" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="IndustryName"
                    ErrorMessage="Please insert a role name." ValidationGroup="SubmitGroup"><b style="color:red">*Industry name required.</b></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style2">
                        &nbsp;</td>
                    <td align="right" class="style1" height="20">
                        <asp:Button ID="submitButton" runat="server" Text="Submit" 
                        onclick="submitButton_Click" Width="100px" Height="20px"  ValidationGroup="SubmitGroup" />
                    </td>
                </tr>
            </table>
            </div>         

             <script type="text/javascript">

                 $(document).ready(function () {
                     $("#<%=IndustryGridView.ClientID%>").keydown(function (e) {
                    if (e.keyCode == 13) {
                        return false;
                    }
                });

            });

        </script>
         <div style="margin:0 auto 0 auto; width:100%;padding-top: 20px;">
            <h3 style="text-align:center;">View and Edit Industries</h3><br />
        <hr style="width: 65%; margin-top: 0px; margin-left: auto; margin-right: auto;margin-bottom:10px;" />


         
            <asp:GridView 
                ID="IndustryGridView" 
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
                ForeColor="#333333"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id"
                onRowUpdating="IndustryGridView_RowUpdating" 
                HorizontalAlign="Center">
 
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Industry Name" SortExpression="name">
                        <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" >
                        <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="headerclear"/>
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
                 SelectCommand="SELECT [id], [name] FROM [pms_industry] ORDER BY [name];"
                >
                 <UpdateParameters>
                     <asp:Parameter Name="name" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>

       
       </div>

   </div>


</asp:Content>
