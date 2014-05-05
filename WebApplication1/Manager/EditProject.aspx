<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="EditProject.aspx.cs" Inherits="WebApplication1.EditProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #name {
            width: 342px;
        }

        #Text1 {
            width: 135px;
        }

        #Text3 {
            width: 32px;
        }

        #Text4 {
            width: 32px;
        }

        .style17 {
            height: 30px;
            width: 155px;
            padding-right: 5px;
        }

        .style18 {
            height: 30px;
        }

        #name0 {
            width: 321px;
        }

        .style19 {
            width: 24px;
            height: 30px;
            padding-right: 5px;
        }

        .style20 {
            width: 24px;
            height: 30px;
        }

        #Text5 {
            width: 135px;
        }

        .grid_padding {
            padding-left: 5px;
        }

        .grid_padding_header {
            padding-left: 25px;
        }

        #UpdateButton {
            margin-left: 400px;
        }

        #EditResourcesButton {
            margin-left: 343px;
        }

        .auto-style2 {
            height: 30px;
            width: 166px;
            padding-right: 5px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
            
    </script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1>Edit Project:
                <asp:DropDownList ID="DropDownList3" runat="server" Height="20px" Width="250px"
                    DataTextField="ProjectSelect"
                    AppendDataBoundItems="true"
                    OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"
                    AutoPostBack="true">
                </asp:DropDownList>
    </h1>
    <br />
    <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto" />
    <h2 style="text-align: left; margin-left: 110px;">&nbsp;</h2>
    <p style="text-align: left; margin-left: 110px;">
        &nbsp;
    </p>
    <h2 style="text-align: left; margin-left: 110px;">Project Attributes<asp:Button ID="UpdateButton" runat="server" Text="Save Attributes" ClientIDMode="Static" OnClick="UpdateButton_Click" OnClientClick="readyForSend()" Height="26px" Width="132px" />
    </h2>
    <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto" />
    &nbsp;<table style="width: 700px; margin: 0 auto 0 auto;">
        <% if (global_asax.isAdmin())
           { %>
        <tr>
            <td align="right" class="auto-style2">
                <b>Manager:</b></td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList8" runat="server" Height="20px" Width="250px"
                    DataTextField="ProjectSelect"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
            </td>
            <td align="right" class="style19">
                <input id="check_Manager" type="checkbox" runat="server" disabled="disabled" /></td>
        </tr>
        <% } %>
        <tr>
            <td align="right" class="auto-style2">Project Name:
            </td>
            <td align="left" class="style18">
                <input type="text" id="Projectname" runat="server" />
            </td>
            <td align="right" class="style19">
                <input id="check_ProjectName" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">Customer:
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DropDownList4" runat="server" Height="20px" Width="250px"
                    DataTextField="CustomerSelect"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
                &nbsp;</td>
            <td align="right" class="style19">
                <input id="check_Customer" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">Industry:
            </td>
            <td class="style18" align="left">
                <asp:DropDownList ID="DropDownList5" runat="server" Height="20px" Width="250px"
                    DataTextField="IndustrySelect"
                    AppendDataBoundItems="true">
                </asp:DropDownList>
                &nbsp;</td>
            <td align="right" class="style19">
                <input id="check_Industry" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">Start Date:
            </td>
            <td class="style18" align="left">
                <input id="Text1" type="text" runat="server" clientidmode="Static" />
            </td>
            <td align="right" class="style19">
                <input id="check_StartDate" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">End Date:
            </td>
            <td class="style18" align="left">
                <input id="Text5" type="text" runat="server" clientidmode="Static" /></td>
            <td align="right" class="style19">
                <input id="check_EndDate" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">Start Date Flexibility:
            </td>
            <td class="style18" align="left">
                <div style="display: inline-block; vertical-align: middle; margin: 0 3px 0 3px;">+/-</div>
                <input id="Text3" type="text" runat="server" clientidmode="Static" maxlength="2" />
                <div style="display: inline-block; vertical-align: middle;">Weeks</div>
            </td>
            <td align="right" class="style19">
                <input id="check_StartDateFlex" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">End Date Flexibility:</td>
            <td class="style18" align="left">
                <div style="display: inline-block; vertical-align: middle; margin: 0 3px 0 3px;">+/-</div>
                <input id="Text4" type="text" runat="server" clientidmode="Static" maxlength="2" onkeydown="" />
                <div style="display: inline-block; vertical-align: middle;">Weeks</div>
            </td>
            <td align="right" class="style19">
                <input id="check_EndDateFlex" type="checkbox" runat="server" disabled="disabled" />
            </td>
        </tr>
        <tr>
            <td align="right" class="auto-style2">Current Project Stage:</td>
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
                </asp:DropDownList><div style="display: inline; margin-left: 20px;">
                    <input style="height: 30px; vertical-align: middle;" id="check_StageOverride" type="checkbox" runat="server" /><div style="display: inline; margin-left: 3px; padding-bottom: 3px; vertical-align: middle;">Override</div>
                </div>
            </td>
            <td align="right" class="style19">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <!-- Grab projects from DB --OR-- Project already populated from ViewProjects page -->
    <br />
    <br />
    <div style="width: 730px; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <div style="float: right;">
        </div>
    </div>
    <h2 style="text-align: left;margin-left:50px;padding-top:10px;float:left;display:inline;">Project Resources</h2>
    <div style="display:inline;text-align:right;float:right;margin-right:40px;margin-bottom:5px;">
        <asp:Button ID="RedirectToSearchResources" runat="server" Text="Add Resources" Height="40px" Width="176px" OnClick="RedirectToSearchResources_Click" />
        <asp:Button ID="EditResourcesButton" runat="server" Text="Remove Resources" Height="40px" Width="176px" OnClick="EditResourcesButton_Click" />
    </div>
    <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto" />
    <br />
    <div style="margin: 0 auto 0 auto; width: 613px">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4"
            ForeColor="#333333" GridLines="Horizontal"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
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
                    <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
                    <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding" />
                </asp:BoundField>
                <asp:BoundField DataField="Role" HeaderText="Role"
                    SortExpression="Role">
                    <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
                    <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding" />
                </asp:BoundField>
                <asp:BoundField DataField="Experience_Level" HeaderText="Experience Level"
                    SortExpression="Experience_Level">
                    <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Email_Address" HeaderText="Email Address"
                    SortExpression="Email_Address">
                    <HeaderStyle Width="180px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
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
    <br />
    &nbsp;
    &nbsp;
    <script type="text/javascript">
        var origProjectname = $("#<%=Projectname.ClientID%>").val();
        var origCustomer = $("#<%=DropDownList4.ClientID%>").val();
        var origIndustry = $("#<%=DropDownList5.ClientID%>").val();
        var origStartDate = $("#<%=Text1.ClientID%>").val();
        var origEndDate = $("#<%=Text5.ClientID%>").val();
        var origStartDateFlex = $("#<%=Text3.ClientID%>").val();
        var origEndDateFlex = $("#<%=Text4.ClientID%>").val();
        var origStage = $("<%=DropDownList9.ClientID%>").val();
        var origStageOverride = $("#<%=check_StageOverride.ClientID%>").is(":checked");

        var comp = function (origValue, newValue) {
            if (origValue != newValue) {
                return false;
            } else {
                return true;
            }
        }

        $("#<%=Projectname.ClientID%>").keyup(function (e) {
            if (comp(origProjectname, $(this).val())) {
                $("#<%=check_ProjectName.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_ProjectName.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=DropDownList4.ClientID%>").change(function (e) {
            if (comp(origCustomer, $(this).val())) {
                $("#<%=check_Customer.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_Customer.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=DropDownList5.ClientID%>").change(function (e) {
            if (comp(origIndustry, $(this).val())) {
                $("#<%=check_Industry.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_Industry.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=Text1.ClientID%>").change(function (e) {
            if (comp(origStartDate, $(this).val())) {
                $("#<%=check_StartDate.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_StartDate.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=Text5.ClientID%>").change(function (e) {
            if (comp(origEndDate, $(this).val())) {
                $("#<%=check_EndDate.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_EndDate.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=Text3.ClientID%>").keyup(function (e) {
            if (comp(origStartDateFlex, $(this).val())) {
                $("#<%=check_StartDateFlex.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_StartDateFlex.ClientID%>").prop("checked", true);
            }
        });
        $("#<%=Text4.ClientID%>").keyup(function (e) {
            if (comp(origEndDateFlex, $(this).val())) {
                $("#<%=check_EndDateFlex.ClientID%>").prop("checked", false);
            } else {
                $("#<%=check_EndDateFlex.ClientID%>").prop("checked", true);
            }
        });

        $("#<%=check_StageOverride.ClientID%>").click(function (e) {
            if ($(this).is(":checked")) {
                $("#<%=DropDownList9.ClientID%>").prop("disabled", false);
                //$("#<%=check_StageOverride.ClientID%>").prop("checked", false);
            } else {
                $("#<%=DropDownList9.ClientID%>").prop("disabled", true);
                //$("#<%=check_StageOverride.ClientID%>").prop("checked", true);
            }
        });

        

    </script>
    <% if (global_asax.isAdmin()) { %>
        <script type="text/javascript">
            var origManager = $("#<%=DropDownList8.ClientID%>").val();
            $("#<%=DropDownList8.ClientID%>").change(function (e) {
                if (comp(origManager, $(this).val())) {
                    $("#<%=check_Manager.ClientID%>").prop("checked", false);
                    } else {
                        $("#<%=check_Manager.ClientID%>").prop("checked", true);
                    }
                });
        </script>
    <% } %>
    <script type="text/javascript">
        $("#<%=Text1.ClientID%>").datepicker();
        $("#<%=Text5.ClientID%>").datepicker();
    </script>
    <script type="text/javascript">
        function readyForSend() {
            <% if (global_asax.isAdmin()) { %>
                $("#<%=check_Manager.ClientID%>").prop("disabled", false);
            <% } %>

            $("#<%=check_ProjectName.ClientID%>").prop("disabled", false);
            $("#<%=check_Customer.ClientID%>").prop("disabled", false);
            $("#<%=check_Industry.ClientID%>").prop("disabled", false);
            $("#<%=check_StartDate.ClientID%>").prop("disabled", false);
            $("#<%=check_StartDateFlex.ClientID%>").prop("disabled", false);
            $("#<%=check_EndDate.ClientID%>").prop("disabled", false);
            $("#<%=check_EndDateFlex.ClientID%>").prop("disabled", false);
        }
    </script>
</asp:Content>
