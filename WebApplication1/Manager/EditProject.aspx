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
            width: 32px;
        }
        #Text4
        {
            width: 32px;
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
        
        .grid_padding {
            padding-left:5px;
        }
        .grid_padding_header {
            padding-left:25px;
        }
        #UpdateButton {
            margin-left:400px;
        }
        #EditResourcesButton {
            margin-left:343px;
        }
        .auto-style2 {
        height: 30px;
        width: 166px;
        padding-right: 5px;
        font-weight: bold;
    }
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1>
        Edit Project:
                <asp:DropDownList ID="DropDownList3" runat="server" Height="20px" Width="250px"
                    DataTextField="ProjectSelect" 
                    AppendDataBoundItems="true"
                    OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </h1>
    <br />
        <hr style="width:95%; margin-top:5px; margin-left:auto; margin-right:auto"/>
    <h2 style="text-align:left; margin-left:110px;">
        &nbsp;</h2>
    <p style="text-align:left; margin-left:110px;">
        &nbsp;</p>
    <h2 style="text-align:left; margin-left:110px;">
        Project Attributes<asp:Button ID="UpdateButton" runat="server" Text="Save Attributes" ClientIDMode="Static" OnClick="UpdateButton_Click" Height="26px" Width="132px"/>
    </h2>
        <hr style="width:95%; margin-top:5px; margin-left:auto; margin-right:auto"/>
    &nbsp;<table style="width: 700px; margin: 0 auto 0 auto;">
        <% if (global_asax.isAdmin()) { %>
        <tr>
            <td align="right" class="auto-style2">
                <b>Manager:</b></td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList8" runat="server" Height="20px" Width="250px"
                    DataTextField="ProjectSelect" 
                    AppendDataBoundItems="true"
                    OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
            </td>
            <td align="right" class="style19">
                <input id="check_Manager" type="checkbox" runat="server" disabled="disabled"/></td>
        </tr>
        <% } %>
        <tr>
            <td align="right" class="auto-style2">
                Project Name:
            </td>
            <td align="left" class="style18">
                <input type="text" id="Projectname" runat="server" />
            </td>
            <td align="right" class="style19">
                <input id="check_ProjectName" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                Customer:
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList4" runat="server" Height="20px" Width="250px"
                    DataTextField="CustomerSelect" 
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            &nbsp;</td>
            <td align="right" class="style19">
                <input id="check_Customer" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                Industry:
            </td>
            <td class="style18" align="left">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="20px" Width="250px"
                    DataTextField="IndustrySelect" 
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            &nbsp;</td>
            <td align="right" class="style19">
                <input id="check_Industry" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                Start Date:
            </td>
            <td class="style18" align="left">
                <input id="Text1" type="text" runat="server" clientidmode="Static"/>
            </td>
            <td align="right" class="style19">
                <input id="check_StartDate" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                End Date:
            </td>
            <td class="style18" align="left">
                <input id="Text5" type="text" runat="server" clientidmode="Static"/></td>
            <td align="right" class="style19">
                <input id="check_EndDate" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                Start Date Flexibility:
            </td>
            <td class="style18" align="left">
                <div style="display:inline-block;vertical-align:middle;margin:0 3px 0 3px;">+/-</div>
                <input id="Text3" type="text" runat="server" clientidmode="Static" maxlength="2"/> <div style="display:inline-block;vertical-align:middle;">Weeks</div>
            </td>
            <td align="right" class="style19">
                <input id="check_StartDateFlex" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                End Date Flexibility:</td>
            <td class="style18" align="left">
                <div style="display:inline-block;vertical-align:middle;margin:0 3px 0 3px;">+/-</div>
                <input id="Text4" type="text" runat="server" clientidmode="Static" maxlength="2" onkeydown=""/> <div style="display:inline-block;vertical-align:middle;">Weeks</div>
            </td>
            <td align="right" class="style19">
                <input id="check_EndDateFlex" type="checkbox" runat="server" disabled="disabled"/>
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">
                Current Project Stage:</td>
            <td class="style18" align="left">
                <asp:DropDownList ID="DropDownList9" runat="server" Enabled="false">
                    <asp:ListItem Value="1">1/10</asp:ListItem>
                    <asp:ListItem Value="2">2/10</asp:ListItem>
                    <asp:ListItem Value="3">3/10</asp:ListItem>
                    <asp:ListItem Value="4">4/10</asp:ListItem>
                    <asp:ListItem Value="5">5/10</asp:ListItem>
                    <asp:ListItem Value="6">6/10</asp:ListItem>
                    <asp:ListItem Value="7">7/10</asp:ListItem>
                    <asp:ListItem Value="8">8/10</asp:ListItem>
                    <asp:ListItem Value="9">9/10</asp:ListItem>
                    <asp:ListItem Value="10">10/10</asp:ListItem>
                </asp:DropDownList><div style="display:inline;margin-left:25px;"><input style="height:30px;vertical-align:middle;" id="check_StageOverride" type="checkbox" runat="server"/><div style="display:inline; margin-left:3px;padding-bottom:3px;vertical-align:middle;">Override</div></div></td>
            <td align="right" class="style19">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <!-- Grab projects from DB --OR-- Project already populated from ViewProjects page -->
    <br />
    <br />
    <div style="width:730px; margin-left:auto; margin-right:auto; margin-top:10px;">
        <div style="float:right;">
             
        </div>
    </div>
    <h2 style="text-align:left; margin-left:110px;">
        Project Resources <asp:Button ID="EditResourcesButton" runat="server" Text="Add/Edit Resources" Height="40px" Width="176px" ClientIDMode="Static" OnClick="EditResourcesButton_Click" />
    </h2>
    <hr style="width:95%; margin-top:5px; margin-left:auto; margin-right:auto"/>
    <br />
    <div style="margin:0 auto 0 auto; width:613px">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="Horizontal"
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        OnSorting="GridView1_Sorting"
        OnPageIndexChanging="GridView1_PageIndexChanging"
        AutoGenerateColumns="False" CellSpacing="1" BorderWidth="1px" 
            BorderColor="Gray" BorderStyle="Solid" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <%--<asp:BoundField DataField="First name" HeaderText="First name" 
                SortExpression="First name">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Last name" HeaderText="Last name" 
                SortExpression="Last name">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>--%>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header"/>
            <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding" />
            </asp:BoundField>
            <asp:BoundField DataField="Role" HeaderText="Role" 
                SortExpression="Role">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
            <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding"/>
            </asp:BoundField>
            <asp:BoundField DataField="Experience_Level" HeaderText="Experience Level" 
                SortExpression="Experience_Level">
            <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="Email_Address" HeaderText="Email Address" 
                SortExpression="Email_Address">
            <HeaderStyle Width="180px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle"/>
            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid_padding" />
            </asp:BoundField>
            <%--<asp:TemplateField HeaderText="Remove">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  Width="25px"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  Width="25px"/>
                </ItemTemplate>
                <HeaderStyle Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Width="80px" />
                <ItemStyle Height="25px" />
            </asp:TemplateField>--%>
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
    <br />
    &nbsp;
    &nbsp;
    <script type="text/javascript">
        $("#Text1").datepicker();
        $("#Text5").datepicker();
        //$("#Text3").datepicker();
        //$("#Text4").datepicker();
    </script>
</asp:Content>
