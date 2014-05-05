<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditResource.aspx.cs" Inherits="WebApplication1.Manager.EditResource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div style="width:100%;text-align:center">
    <h1 align="center">Manage Resources</h1>
        <br />
        <hr style="width:90%; margin-left:auto; margin-right:auto; margin-bottom:15px;margin-top: 5px;"/>
        <br />
    <asp:GridView DataKeyNames="id" ID="GridView1" runat="server" CellPadding="4"
            ForeColor="#333333" GridLines="None"
            AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" Width="100%" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
            <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
            <asp:BoundField DataField="email_address" HeaderText="Email" SortExpression="email_address" />
            <asp:TemplateField HeaderText="Industry" SortExpression="industry_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("industry_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceInd" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceInd" runat="server" ConnectionString="<%$ ConnectionStrings:vanlocal %>" SelectCommand="SELECT * FROM [pms_industry]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role" SortExpression="role_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("role_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceRole" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:vanlocal %>" SelectCommand="SELECT [id], [name] FROM [pms_resource_role]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="status_id">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("status_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceStatus" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:vanlocal %>" SelectCommand="SELECT * FROM [pms_resource_status]"></asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="work_hours" HeaderText="Work Hours" SortExpression="work_hours" />
            <asp:BoundField DataField="experience_level" HeaderText="Experience Level" SortExpression="experience_level" />
            <asp:CommandField ShowEditButton="true" />
        </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:vanlocal %>" SelectCommand="SELECT [id], [first_name], [last_name], [email_address], [industry_id], [role_id], [status_id], [work_hours], [experience_level] FROM [pms_resource]" 
        UpdateCommand="UPDATE [pms_resource] SET [first_name] = @first, [last_name] = @last, [email_address] = @email, [industry_id] = @ind, [role_id] = @role, [status_id] = @stat, [work_hours] = @hours, [experience_level] = @exp WHERE [id] = @id ">
        <UpdateParameters>
            <asp:Parameter Name = "first" Type="String" />
            <asp:Parameter Name = "last" Type="String" />
            <asp:Parameter Name = "email" Type="String" />
            <asp:Parameter Name = "ind" Type="Int32" />
            <asp:Parameter Name = "stat" Type="Int32" />
            <asp:Parameter Name = "hours" Type="Int32" />
            <asp:Parameter Name = "exp" Type="Int32" />
            <asp:Parameter Name = "id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
