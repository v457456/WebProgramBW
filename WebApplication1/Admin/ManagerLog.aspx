<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManagerLog.aspx.cs" Inherits="WebApplication1.Admin.ManagerLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT [date_time], [copy_userid], [copy_username], [copy_userfirstname], [copy_userlastname], [copy_projectid], [copy_projectname], [description] FROM [pms_log_project]"></asp:SqlDataSource>

    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" GridLines="None" BackColor="#B3C0C4" 
                    AllowSorting="True" AutoGenerateColumns="False" BorderColor="Gray" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="4" CellSpacing="1" 
                    ForeColor="#333333" 
                    DataSourceID="SqlDataSource1" style="text-align: center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="date_time" HeaderText="Date" SortExpression="date_time"></asp:BoundField>
                <asp:BoundField DataField="copy_userid" HeaderText="UserID" 
                            SortExpression="copy_userid"></asp:BoundField>
                <asp:BoundField DataField="copy_username" HeaderText="Username" 
                            SortExpression="copy_username"></asp:BoundField>
                <asp:BoundField DataField="copy_userfirstname" HeaderText="First Name" 
                            SortExpression="copy_userfirstname"></asp:BoundField>
                <asp:BoundField DataField="copy_userlastname" HeaderText="Last Name" 
                            SortExpression="copy_userlastname"></asp:BoundField>
                <asp:BoundField DataField="copy_projectid" HeaderText="ProjectID" 
                            SortExpression="copy_projectid"></asp:BoundField>
                <asp:BoundField DataField="copy_projectname" HeaderText="Project Name" 
                            SortExpression="copy_projectname"></asp:BoundField>
                <asp:BoundField DataField="description" HeaderText="Description" HtmlEncode="False" SortExpression="description" />
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
</asp:Content>
