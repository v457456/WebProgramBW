<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProjectResources.aspx.cs" Inherits="WebApplication1.EditProjectResources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.headerclear 
{
    display:none;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">Manage Project Resources</h1>
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
<br />
        <br />

        <div style="margin:0 auto 0 auto; width:643px">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" BackColor="#B3C0C4"
        onsorting="GridView1_Sorting"
        OnPageIndexChanging="GridView1_PageIndexChanging"
        AutoGenerateColumns="False" CellSpacing="1" BorderWidth="1px" 
        BorderColor="Gray" BorderStyle="Solid" AllowPaging="True" PageSize="25" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name">
                <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Remove">
                <ItemTemplate>
                    <asp:CheckBox ID="RemoveSelector" runat="server" />
                </ItemTemplate>
                <HeaderStyle Width="25px" />
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
    
    
        <asp:Button ID="RemoveSelectedButton" runat="server" OnClick="RemoveSelectedButton_Click" Text="Remove Selected" />
    
    
        <br />
    
</asp:Content>
