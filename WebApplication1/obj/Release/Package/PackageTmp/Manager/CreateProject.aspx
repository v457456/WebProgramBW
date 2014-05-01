<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="WebApplication1.CreateProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #name
        {
            width: 270px;
        }
        #name0
        {
            width: 170px;
        }
        #name1
        {
            width: 170px;
            height: 20px;
        }
        .style22
        {
            height: 40px;
        }
        .style26
        {
            width: 826px;
            height: 40px;
            padding-right: 5px;
        }
        .style27
        {
            width: 568px;
            height: 40px;
        }
        .style28
        {
            width: 492px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div>
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">Create A Project</h1>
        <br />
       Please enter the user&#39;s information below. Click &#39;Submit&#39; when all of the 
        information is included. Processing may take up to 24 hours.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />

    <br />
    <table>
        <tr class="style22">
            <td class="style26" align="right">
                Project Name:</td>
            <td class="style27" align="left">
                <input id="name" type="text" /></td>
            <td class="style28" align="left">
            </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Customer:</td>
            <td class="style27" align="left">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="190px">
                    <asp:ListItem>Please Select a Customer</asp:ListItem>
                    <asp:ListItem>Customer 1</asp:ListItem>
                    <asp:ListItem>Customer 2</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style28" align="left">
            </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Industry:</td>
            <td class="style27" align="left">
                <asp:DropDownList ID="DropDownList2" runat="server" Height="28px" Width="190px">
                    <asp:ListItem>Please Select an Industry</asp:ListItem>
                    <asp:ListItem>Industry 1</asp:ListItem>
                    <asp:ListItem>Industry 2</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Start Date:</td>
            <td class="style27" align="left">
                <input id="name0" type="text" /></td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                End Date:</td>
            <td class="style27" align="left">
                <input id="name1" type="text" /></td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                </td>
            <td class="style27" align="left">
                </td>
            <td class="style28" align="left">

<input type="submit" value="Submit" /></td>
        </tr>
    </table>
    <br />

<!-- Grab customers from DB -->
    <br />
<br />

<!-- Grab industries from DB -->
    <br />
<br />

<!-- Calendar Thingys! -->
    <br />

<br />



<br />

&nbsp;</div>

</asp:Content>
