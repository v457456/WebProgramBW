<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchResource.aspx.cs" Inherits="WebApplication1.SearchResource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #Text3 {
            width: 264px;
        }

        #emailTextBox {
            width: 277px;
        }

        .style2 {
            height: 30px;
            width: 90px;
            padding-right: 5px;
        }

        .headerclear {
            display: none;
        }

        #Text5 {
            width: 25px;
        }

        #Text6 {
            width: 25px;
        }

        .style5 {
            height: 30px;
            width: 220px;
        }

        .grid_padding {
            padding-left: 5px;
        }

        .grid_padding_header {
            text-align:center;
        }
        .auto-style3 {
            width: 172px;
            height: 30px;
        }
        .auto-style4 {
            width: 602px;
            height: 30px;
        }
        .auto-style5 {
            height: 30px;
        }
        #override10form {
            
        }
        .no-close .ui-dialog-titlebar-close {
            
        }
        .ui-widget-overlay.custom-overlay
        {
            background-color: black;
            background-image: none;
            opacity: 0.9;
            z-index: 1040;    
        }
    </style>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script src="/Scripts/jquery.formance.min.js"></script>
    <script type="text/javascript">
        
        function checkRegexp(o, regexp, n) {
            if (!(regexp.test(o.val()))) {
                o.addClass("ui-state-error");
                updateTips(n);
                return false;
            } else {
                o.removeClass("ui-state-error");
                return true;
            }
        }

        $(document).ready(function () {
            var tenthrulewrite = $("#10thrule");
            $("#override10form").dialog({
                autoOpen: false,
                show: 'clip',
                resizable: false,
                position: 'center',
                modal: true,
                height: 175,
                width: 375,
                draggable: false,
                buttons: {
                    "Set 10th Rule": function () {
                        var valid = true;
                        valid = valid && checkRegexp(tenthrulewrite, /[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}\-[0-9]{2}/, "10th rule must consist of 10 sets of 2 integers.");
                        if (valid) {
                            $("#<%=tenthrulereadonly.ClientID%>").val(tenthrulewrite.val());
                            tenthrulewrite.val("");
                            $(this).dialog('close');
                        }
                    },
                    Cancel: function () {
                        $(this).dialog('close');
                    }
                },
                open: function () {
                    $(".ui-widget-overlay").css({ background: "#000", opacity: 0.3 });
                },
                close: function () {
                    $(".ui-widget-overlay").css({ background: '', opacity: '' });
                }
            });

            $("#<%=Override10thRule.ClientID%>").click(function ()
            {
                $("#override10form").dialog("open");
            });

        });
    </script>
    <script type="text/javascript">
        jQuery(function ($) {
            $("#10thrule").mask("99-99-99-99-99-99-99-99-99-99");
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div id="override10form" title="10th Rule Override Value">
        <label style="text-align:left;font-size:12px;">10th Rule Format: XX-XX-XX-XX-XX-XX-XX-XX-XX-XX</label><br />
            <input style="width:225px;margin-top:10px;text-align:center;height:20px;" type="text" id="10thrule"/>
    </div>
    
    <div>
        <h1 align="center">Resource Search</h1>
        <br />
        Please fill in as many fields as possible and then click &#39;Search&#39; to list found resources.<br />
        <br />
        <hr style="width: 75%; margin-left: auto; margin-right: auto" />
        <br />
        <table style="width: 538px; height: 132px; color: #000000; margin: 0 auto 0 auto;"
            align="center">
            <tr>
                <td align="right" class="style2">First Name:</td>
                <td align="left" class="style5">
                    <input id="Text1" type="text" name="in_firstname" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">Last Name:</td>
                <td align="left" class="style5">
                    <input id="Text2" type="text" name="in_lastname" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">Email Address:</td>
                <td align="left" class="style5">
                    <input id="Text3" type="text" name="in_email" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">Experience Level:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList4" runat="server" Height="20px">
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
                <td align="right" class="style2">Work Hours:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList5" runat="server" Height="20px">
                        <asp:ListItem>=</asp:ListItem>
                        <asp:ListItem>></asp:ListItem>
                        <asp:ListItem>≥</asp:ListItem>
                        <asp:ListItem><</asp:ListItem>
                        <asp:ListItem>≤</asp:ListItem>
                    </asp:DropDownList>
                    <input id="Text5" type="text" maxlength="2" name="in_workhours" runat="server" style="width:25px;" />
                    <asp:RequiredFieldValidator ID="WorkHoursRequired" runat="server" 
                                                ControlToValidate="Text5" ErrorMessage="Work hours are required" 
                                                ValidationGroup="SearchSubmit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">Industry:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="20px" Width="240px"
                        DataTextField="name"
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">Role:</td>
                <td align="left" class="style5">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="240px"
                        DataTextField="name"
                        AppendDataBoundItems="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <% if (Request.QueryString["ProjectID"] != null) { %>
            <tr>
                <td align="right" class="style2">Project Hours:</td>
                <td align="left" class="style5">
                    <input id="projecthours" style="width:30px; text-align:left;" runat="server" value="500" maxlength="3" type="text"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="projecthours" ErrorMessage="Project hours are required" 
                                                ValidationGroup="SearchSubmit"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                <asp:Button ID="Override10thRule" Height="25px" Width="124px" runat="server" Text="Override 10th Rule" ClientIDMode="Static" ValidationGroup="Override10thRuleValidation" OnClientClick="return false;"/>
                    </td>
                <td align="left" class="style5">
                    <input id="tenthrulereadonly" style="width:200px; text-align:center; background-color:#D2D2D2" runat="server" readonly="readonly" value="??-??-??-??-??-??-??-??-??-??" type="text"/></td>
            </tr>
            <% } %>
            <tr>
                <td align="right" class="style2">&nbsp;</td>
                <td align="left" class="style5">
                    <asp:Label ID="outputLabel" runat="server" Text="Information Entered Incorrectly"
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">&nbsp;</td>
                <td align="right" class="style5">
                    <asp:Button ID="submitButton" runat="server" Text="Search"
                        OnClick="submitButton_Click" Width="100px" Height="25px"
                        ValidationGroup="SearchSubmit" />
                </td>
            </tr>
        </table>
            <hr style="margin:5px 0 5px 0"/>
        <div style="margin: 0 auto 0 auto; width: 825px">
            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" PageSize="25" GridLines="None" BackColor="#B3C0C4"
                AllowSorting="True" AutoGenerateColumns="False" BorderColor="Gray"
                BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="1"
                ForeColor="#333333" OnPageIndexChanging="GridView1_PageIndexChanging"
                OnSorting="GridView1_Sorting"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                DataKeyNames="id">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>

                    <asp:BoundField DataField="id" HeaderText="id"
                        SortExpression="[id]" Visible="false">
                        <HeaderStyle Width="100px" HorizontalAlign="Left" CssClass="grid_padding_header"/>
                        <ItemStyle HorizontalAlign="Left" Height="20px" CssClass="grid_padding"/>
                    </asp:BoundField>

                    <asp:BoundField DataField="Name" HeaderText="Name"
                        SortExpression="[Name]">
                        <HeaderStyle Width="100px" HorizontalAlign="Left" CssClass="grid_padding_header"/>
                        <ItemStyle HorizontalAlign="Left" Height="20px" CssClass="grid_padding"/>
                    </asp:BoundField>

                    <asp:BoundField DataField="Email Address" HeaderText="Email"
                        SortExpression="[Email Address]">
                        <HeaderStyle Width="100px" HorizontalAlign="Left" CssClass="grid_padding_header"/>
                        <ItemStyle HorizontalAlign="Left" Height="20px" CssClass="grid_padding" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Role" HeaderText="Role"
                        SortExpression="Role">
                        <HeaderStyle Width="100px" HorizontalAlign="Left" CssClass="grid_padding_header"/>
                        <ItemStyle HorizontalAlign="Left" Height="20px" CssClass="grid_padding" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Experience Level" HeaderText="Exp Lvl"
                        SortExpression="[Experience Level]">
                        <HeaderStyle Width="15px" />
                        <ItemStyle HorizontalAlign="Center" Height="20px" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Industry" HeaderText="Industry"
                        SortExpression="Industry">
                        <HeaderStyle Width="100px" HorizontalAlign="Left" CssClass="grid_padding_header"/>
                        <ItemStyle HorizontalAlign="Left" Height="20px" CssClass="grid_padding" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Work Hours" HeaderText="Wrk Hrs"
                        SortExpression="[Work Hours]">
                        <HeaderStyle Width="10px" />
                        <ItemStyle HorizontalAlign="Center" Width="10px" Height="20px" />
                    </asp:BoundField>

                    <asp:BoundField DataField="Rank" HeaderText="Rank"
                        SortExpression="[Rank]" Visible="false">
                        <HeaderStyle Width="10px" />
                        <ItemStyle HorizontalAlign="Center" Width="10px" Height="20px" />
                    </asp:BoundField>

                    <asp:TemplateField HeaderText="Add">
                        <ItemTemplate>
                            <asp:CheckBox ID="AddSel" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="10px" />
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" Visible="false">
                        <HeaderStyle Width="10px" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
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
        <% if (GridView1.PageCount != 0 && Request.QueryString["ProjectID"] != null) { %>
        <div style="margin-top:15px">
            <table style="width: 100%;padding-left:1000p">
                <tr>
                    <td class="auto-style4" style="text-align:left;padding-left:10px">&nbsp;</td>
                    <td class="auto-style5">
                <asp:Button ID="AddResToProj" Height="25px" Width="175px" runat="server" Text="Add Selected to Project" ValidationGroup="AddResToProjValidation" OnClick="AddResToProj_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        <% } %>
    </div>
</asp:Content>
