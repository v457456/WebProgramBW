<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchUser.aspx.cs" Inherits="WebApplication1.SearchUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #Text3
        {
            width: 264px;
        }
        #emailTextBox
        {
            width: 277px;
        }
        .style2
        {
            height: 30px;
            width: 129px;
            padding-right:5px;
        }
                
        .style1
        {
            height: 30px;
        }
        .headerclear 
        {
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">User Search</h1>
        <br />
        Please fill in as many fields as possible and then click &#39;Search&#39; to list found users.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <table style="width: 450px; height: 132px; color: #000000;margin: 0 auto 0 auto;" 
            aligntext" ="center">
            <tr>
                <td align="right" class="style2">
                    First Name:</td>
                <td align="left" class="style1">
                    <input id="Text1" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: </td>
                <td align="left" class="style1">
                    <input id="Text2" type="/></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style1">
                    <input id="Text3" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Username:</td>
                <td align="left" class="style1">
                    <input id="Text4" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    User Type:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Any</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="left" class="style1">
    <asp:Label ID="outputLabel" runat="server" Text="Information Entered Incorrectly" 
        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="right" class="style1">
        <asp:Button ID="submitButton" runat="server" Text="Search" 
            onclick="submitButton_Click" Width="100px" Height="25px" />
                </td>
            </tr>
        </table>
        <br />
        <div style="margin:0 auto 0 auto; width:750px">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" GridLines="None" BackColor="#B3C0C4" 
                AllowSorting="True" AutoGenerateColumns="False" BorderColor="Gray" 
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="1" 
                DataSourceID="SqlDataProjectsResources" ForeColor="#333333" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID">
                    <HeaderStyle Width="25px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="Username" HeaderText="Username" 
                        SortExpression="Username">
                        <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" 
                        SortExpression="Password"><HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="First name" HeaderText="First name" 
                        SortExpression="First name"><HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="Last name" HeaderText="Last name" 
                        SortExpression="Last name">
                        <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="Email Address" HeaderText="Email Address" 
                        SortExpression="Email Address">
                        <HeaderStyle Width="190px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:BoundField DataField="User Type" HeaderText="User Type" 
                        SortExpression="User Type" ReadOnly="True">
                        <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
                    <asp:CommandField ShowEditButton="True">
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
        </div>
        <br />
        <asp:SqlDataSource ID="SqlDataProjectsResources" runat="server" 
            ConnectionString="<%$ ConnectionStrings:group3SQLConnection %>" 
            
            SelectCommand="SELECT pms_user.id AS ID, pms_user.username AS Username, pms_user.password AS Password, pms_user.first_name AS [First name], pms_user.last_name AS [Last name], pms_user.email_address AS [Email Address], pms_user_type.name AS [User Type] FROM pms_user INNER JOIN pms_user_type ON pms_user_type.id = pms_user.type_id" 
            onselecting="SqlDataProjectsResources_Selecting">
        </asp:SqlDataSource>
        <br />
        <br />
        </div>
    </asp:Content>
