﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MyProjects.aspx.cs" Inherits="WebApplication1.MyProjects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.headerclear 
{
    display:none;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <h1 align="center">Your Projects</h1>
        <br />
        Listed below are the projects you are currently managing.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
<br />
        <br />

        <div style="margin:0 auto 0 auto; width:643px">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" BackColor="#B3C0C4"
        OnRowCommand="GridView1_RowCommand"
        onsorting="GridView1_Sorting"
        OnPageIndexChanging="GridView1_PageIndexChanging"
        AutoGenerateColumns="False" CellSpacing="1" BorderWidth="1px" 
        BorderColor="Gray" BorderStyle="Solid" AllowPaging="True" PageSize="25" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" 
                SortExpression="ID">
                <HeaderStyle Width="25px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" 
                SortExpression="Name">
                <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Start Date" HeaderText="Start Date" 
                SortExpression="[Start Date]" DataFormatString="{0:d}">
                <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="End Date" HeaderText="End Date" 
                SortExpression="[End Date]" DataFormatString="{0:d}">
                <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Customer" HeaderText="Customer" 
                SortExpression="Customer">
                <HeaderStyle Width="200px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Industry" HeaderText="Industry" 
                SortExpression="Industry">
                <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:BoundField DataField="Manager" HeaderText="Manager" 
                SortExpression="Manager">
                <HeaderStyle Width="125px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:BoundField>
            <asp:ButtonField Text="Select" CommandName="ProjectSelection">
            <HeaderStyle CssClass="headerclear"/>
            <ItemStyle Height="25px" Width="70px" HorizontalAlign="Center" VerticalAlign="Middle"  />
            </asp:ButtonField>
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
    
</asp:Content>
