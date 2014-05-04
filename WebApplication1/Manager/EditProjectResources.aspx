<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProjectResources.aspx.cs" Inherits="WebApplication1.EditProjectResources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .headerclear {
            display: none;
        }
        .grid_padding {
            padding-left: 5px;
        }

        .grid_padding_header {
            padding-left: 25px;
        }
        .grid_padding_header2 {
            padding: 0 5px 0 5px;
        }
        #removeslide a:hover {color:#464646;} 
        #removeslide a:active, a:visited, a:link {color:#000000;}

        #addslide a:hover {color:#464646;} 
        #addslide a:active, a:visited, a:link {color:#000000;}
    </style>
    <script type="text/javascript">
        //$(document).ready(function () {
        //    $("#removeres").stop(true, true).slideUp(1);
        //    $("#addres").stop(true, true).slideUp(1);
        //});
        var remup = false;
        var addup = false;
        $(function () {
            $("#removeslide").click(function () {
                $("#removeres").stop(true,true).slideToggle();
                if (remup) {
                    remup = false;
                } else {
                    remup = true;
                }
                if (remup) {
                    $("#removeslidedirection").html("&#9658;");
                } else {
                   
                    $("#removeslidedirection").html("&#9660;");
                }
            });
            $("#addslide").click(function () {
                $("#addres").stop(true, true).slideToggle();
                if (addup) {
                    addup = false;
                } else {
                    addup = true;
                }
                if (addup) {
                    $("#addslidedirection").html("&#9658;");
                } else {
                    $("#addslidedirection").html("&#9660;");
                }
            });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <h1 align="center">Manage Project Resources</h1>
    <br />
    <hr style="width: 75%; margin-left: auto; margin-right: auto" />
    <br />
    <br />
    <br />
    <div id="accordian" runat="server">
        <h1 id="removeslide" style="text-align:left;margin-left:50px;"><span id="removeslidedirection" style="font-size:16px;vertical-align:middle;padding:0 10px 0 0;margin:0;display:inline">&#9660;</span><a href="#">Remove Resources</a></h1>
        <div id="removeres" style="margin: 5px auto 0 auto">
            <hr style="margin-bottom:5px"/>
            <div style="margin: 5px auto 25px auto;width: 643px">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4"
                ForeColor="#333333" GridLines="None" BackColor="#B3C0C4"
                OnSorting="GridView1_Sorting"
                OnPageIndexChanging="GridView1_PageIndexChanging"
                AutoGenerateColumns="False" CellSpacing="1" BorderWidth="1px"
                BorderColor="Gray" BorderStyle="Solid" AllowPaging="True" PageSize="25" AllowSorting="True"
                DataKeyNames="ResID">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ResID" HeaderText="ID"
                        SortExpression="ID">
                        <HeaderStyle Width="15px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
                        <ItemStyle Height="15px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name"
                        SortExpression="Name">
                        <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
                        <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding"/>
                    </asp:BoundField>
                <asp:BoundField DataField="Role" HeaderText="Role"
                    SortExpression="Role">
                    <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding_header" />
                    <ItemStyle Height="25px" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="grid_padding" />
                </asp:BoundField>
                <asp:BoundField DataField="Experience_Level" HeaderText="Exp Level"
                    SortExpression="Experience_Level">
                    <HeaderStyle Width="25px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid_padding_header2" />
                    <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="Email_Address" HeaderText="Email Address"
                    SortExpression="Email_Address">
                    <HeaderStyle Width="180px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="grid_padding" />
                </asp:BoundField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:CheckBox ID="RemoveSelector" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="25px" />
                    </asp:TemplateField>
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
                    <div style="text-align:right;margin-top:5px;"><asp:Button ID="RemoveSelectedButton" runat="server" OnClick="RemoveSelectedButton_Click" Text="Remove Selected" Height="30px" Width="135px" /></div>

                </div>
        </div>

        <h1 id="addslide" style="text-align:left;margin-left:50px;"><span id="addslidedirection" style="font-size:16px;vertical-align:middle;padding:0 10px 0 0;margin:0;display:inline">&#9660;</span><a href="#">Add Resources</a></h1>
        <div id="addres" style="margin: 5px auto 0 auto">
            <hr style="margin-bottom:5px"/>
            <div style="margin: 5px auto 25px auto;width: 643px">
            Big data stuff search
                </div>
        </div>
    </div>
    <br />




    <br />
    

</asp:Content>
