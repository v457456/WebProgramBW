<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #Text3
        {
            width: 264px;
        }
        #emailTextBox
        {
            width: 277px;
        }
        .style2
        {
            height: 30px;
            width: 129px;
            padding-right:5px;
        }
                
        .style1
        {
            height: 30px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">New User Registration</h1>
        <br />
        Please fill in all fields and click &#39;Add 
        User&#39; to register a new user.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <table style="width: 450px; height: 132px; color: #000000;margin: 0 auto 0 auto;" 
            align="center">
            <tr>
                <td align="right" class="style2">
                    First Name:</td>
                <td align="left" class="style1">
                    <input id="Text1" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: </td>
                <td align="left" class="style1">
                    <input id="Text2" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style1">
                    <input id="Text3" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Username:</td>
                <td align="left" class="style1">
                    <input id="Text4" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Password:</td>
                <td align="left" class="style1">
                    <input id="Text5" type="text" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    User Type:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Select a User Type</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="left" class="style1">
    <asp:Label ID="outputLabel" runat="server" Text="The user has been created." 
        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="right" class="style1">
        <asp:Button ID="submitButton" runat="server" Text="Add User" 
            onclick="submitButton_Click" Width="100px" Height="25px" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        </div>
    </asp:Content>
