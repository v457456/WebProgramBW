<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="EditProject.aspx.cs" Inherits="WebApplication1.EditProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #name
        {
            width: 342px;
        }
        #Text1
        {
            width: 135px;
        }
        #Text3
        {
            width: 60px;
        }
        #Text4
        {
            width: 60px;
        }
        .style17
        {
            height: 30px;
            width: 155px;
            padding-right:5px;
        }
        .style18
        {
            height: 30px;
        }
        #name0
        {
            width: 321px;
        }
        .style19
        {
            width: 24px;
            height: 30px;
            padding-right: 5px;
        }
        .style20
        {
            width: 24px;
            height: 30px;
        }
        #Text5
        {
            width: 135px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h2>
        Edit Project</h2>
    <br />
    <br />
    Select Project:&nbsp;&nbsp;&nbsp;&nbsp;
    <select name="D1" style="width: 436px">
        <option>Project 1</option>
        <option>Project 2</option>
    </select><br />
    <br />
    <h3>
        Edit Project Attributes</h3>
    <br />
    &nbsp;<table style="width: 700px; margin: 0 auto 0 auto;">
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox1" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Project Name:
            </td>
            <td align="left" class="style18">
                <input type="text" id="name" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox2" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Customer:
            </td>
            <td align="left" class="style18">
                <select name="D2" style="width: 230px">
                    <option>Customer 1</option>
                    <option>Customer 2</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox3" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Industry:
            </td>
            <td class="style18" align="left">
                <select name="D3" style="width: 229px">
                    <option>Industry 1</option>
                    <option>Industry 2</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox4" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Start Date:
            </td>
            <td class="style18" align="left">
                <input id="Text1" type="text" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox5" type="checkbox" />
            </td>
            <td align="right" class="style17">
                End Date:
            </td>
            <td class="style18" align="left">
                <input id="Text5" type="text" /></td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox6" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Start Date Flexibility:
            </td>
            <td class="style18" align="left">
                <input id="Text3" type="text" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox7" type="checkbox" />
            </td>
            <td align="right" class="style17">
                End Date Flexibility:
            </td>
            <td class="style18" align="left">
                <input id="Text4" type="text" />
            </td>
        </tr>
    </table>
    <br />
    <!-- Grab projects from DB --OR-- Project already populated from ViewProjects page -->
    <br />
    <div style="margin:0 auto 0 auto; width:643px">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        DataSourceID="SqlDataProjectsResources" ForeColor="#333333" GridLines="Horizontal"
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        AutoGenerateColumns="False" CellSpacing="1" BorderWidth="1px" 
            BorderColor="Gray" BorderStyle="Solid" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Last name" HeaderText="Last name" 
                SortExpression="Last name">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="First name" HeaderText="First name" 
                SortExpression="First name">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Email Address" HeaderText="Email Address" 
                SortExpression="Email Address">
            <HeaderStyle Width="180px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Remove">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  Width="25px"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  Width="25px"/>
                </ItemTemplate>
                <HeaderStyle Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Width="80px" />
                <ItemStyle Height="25px" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999"/>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"/>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White"/>
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
        
        
        
    SelectCommand="SELECT username AS Username, first_name AS [First name], last_name AS [Last name], email_address AS [Email Address] FROM pms_user"></asp:SqlDataSource>
    <br />
    <h3>
        Edit Resources</h3>
    <table style="width: 700px; margin: 0 auto 0 auto;">
        <tr>
            <td align="right" class="style19">
                &nbsp;</td>
            <td align="right" class="style17">
                <a href="EditProjectResources.aspx">Add Resources to Project</a>&nbsp;</td>
            <td align="left" class="style18">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox9" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Remove a Resource:
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="250px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style19">
                <input id="Checkbox10" type="checkbox" />
            </td>
            <td align="right" class="style17">
                Change a Resource:
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="17px" Width="251px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style20">
            </td>
            <td align="right" class="style17">
            </td>
            <td align="left" class="style18">
            </td>
        </tr>
    </table>
    <br />
    &nbsp;
    <input type="submit" value="Submit!" />
</asp:Content>
