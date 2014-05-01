<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchResource.aspx.cs" Inherits="WebApplication1.SearchResource" %>
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
            width: 90px;
            padding-right: 5px;
        }
                
        .headerclear 
        {
            display:none;
        }
        #Text5
        {
            width: 25px;
        }
        #Text6
        {
            width: 25px;
        }
        .style5
        {
            height: 30px;
            width: 220px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">Resource Search</h1>
        <br />
        Please fill in as many fields as possible and then click &#39;Search&#39; to list found resources.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <table style="width: 538px; height: 132px; color: #000000;margin: 0 auto 0 auto;" 
            align="center">
            <tr>
                <td align="right" class="style2">
                    First Name:</td>
                <td align="left" class="style5" >
                    <input id="Text1" type="text"/></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name:</td>
                <td align="left" class="style5">
                    <input id="Text2" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style5">
                    <input id="Text3" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Experience Level:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="20px" Width="35px">
                        <asp:ListItem>=</asp:ListItem>
                        <asp:ListItem>></asp:ListItem>
                        <asp:ListItem>≥</asp:ListItem>
                        <asp:ListItem><</asp:ListItem>
                        <asp:ListItem>≤</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="DropDownList6" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Work Hours:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList5" runat="server" Height="20px" Width="35px">
                        <asp:ListItem>=</asp:ListItem>
                        <asp:ListItem>></asp:ListItem>
                        <asp:ListItem>≥</asp:ListItem>
                        <asp:ListItem><</asp:ListItem>
                        <asp:ListItem>≤</asp:ListItem>
                    </asp:DropDownList>
                    <input id="Text5" type="text" maxlength="3" value="40"/></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Industry:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="20px" Width="240px"> 
                        <asp:ListItem>Select an industry for this resource</asp:ListItem>
                        <asp:ListItem>Healthcare</asp:ListItem>
                        <asp:ListItem>Education</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Role:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="240px"> 
                        <asp:ListItem>Select a role for this resource</asp:ListItem>
                        <asp:ListItem>Developer</asp:ListItem>
                        <asp:ListItem>Project Manager</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="left" class="style5">
    <asp:Label ID="outputLabel" runat="server" Text="Information Entered Incorrectly" 
        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="right" class="style5">
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
                    <asp:BoundField DataField="ID" HeaderText="ID" 
                        SortExpression="ID">
            </asp:BoundField>
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" 
                        SortExpression="Last Name">
            </asp:BoundField>
                    <asp:BoundField DataField="First Name" HeaderText="First Name" 
                        SortExpression="First Name">
            </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" 
                        SortExpression="Email">
            </asp:BoundField>
                    <asp:BoundField DataField="Role" HeaderText="Role" 
                        SortExpression="Role">
            </asp:BoundField>
                    <asp:BoundField DataField="Experience" HeaderText="Experience" 
                        SortExpression="Experience" />
                    <asp:BoundField DataField="Industry" HeaderText="Industry" 
                        SortExpression="Industry">
            </asp:BoundField>
                    <asp:BoundField DataField="Work Hours" HeaderText="Work Hours" 
                        SortExpression="Work Hours" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status">
            </asp:BoundField>
                    <asp:ButtonField Text="Select" />
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
            
            
            SelectCommand="SELECT status_id AS Status, role_id AS Role, industry_id AS Industry, email_address AS Email, last_name AS [Last Name], first_name AS [First Name], id AS ID, work_hours AS [Work Hours], experience_level AS Experience FROM pms_resource">
        </asp:SqlDataSource>
        <br />
        <br />
        </div>
    </asp:Content>