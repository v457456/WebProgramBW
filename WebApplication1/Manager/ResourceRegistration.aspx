<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResourceRegistration.aspx.cs" Inherits="WebApplication1.ResourceRegistration" %>
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
        #Text4
        {
            width: 29px;
        }
        #Text5
        {
            width: 29px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <h1 align="center">Add a New Resource</h1>
        <br />
        Please fill in all fields and click &#39;Add Resource&#39; to add a new resource.<br />
        <br />
        <hr style="width:75%; margin-left:auto; margin-right:auto"/>
        <br />
        <table style="width: 450px; height: 132px; color: #000000;margin: 0 auto 0 auto;" 
            align="center">
            <tr>
                <td align="right" class="style2">
                    First Name:</td>
                <td align="left" class="style1">
                    <input id="Text1" type="text" name="first_name" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: </td>
                <td align="left" class="style1">
                    <input id="Text2" type="text" name="last_name" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style1">
                    <input id="Text3" type="text" name="email" /></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Weekly Work Hours:</td>
                <td align="left" class="style1">
                    <input id="Text4" type="text" maxlength="3" name="weekly_hours"/></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Experience Level:</td>
                <td align="left" class="style1">
                  
                  <select name="exp">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Industry:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="20px" Width="240px" 
                        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"> 
                        <asp:ListItem>Select an industry for this resource</asp:ListItem>
                        <asp:ListItem>Healthcare</asp:ListItem>
                        <asp:ListItem>Education</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Role:</td>
                <td align="left" class="style1"><!-- todo: fill dropdown from database -->
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="240px" 
                        DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id"> 
                        <asp:ListItem>Select a role for this resource</asp:ListItem>
                        <asp:ListItem>Developer</asp:ListItem>
                        <asp:ListItem>Project Manager</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Status:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList3" runat="server" Height="20px" Width="240px"> 
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Unavailable (vacation)</asp:ListItem>
                        <asp:ListItem>Unavailable (retired)</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="left" class="style1">
    <asp:Label ID="outputLabel" runat="server" Text="The resource has been created." 
        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="right" class="style1">
        <asp:Button ID="submitButton" runat="server" Text="Add Resource" 
            onclick="submitButton_Click" Width="100px" Height="25px" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        </div>
    </asp:Content>
