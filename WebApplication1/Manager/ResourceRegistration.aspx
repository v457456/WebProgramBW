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
        <table align="center" style="width: 450px; height: 132px; color: #000000;margin: 0 auto 0 auto;" 
            align="center">
            <tr>
                <td align="right" class="style2">
                    First Name:</td>
                <td align="left" class="style1">
                    <input runat="server" id="firstName" type="text" name="first_name" />
                    <asp:RequiredFieldValidator ID="firstreq" runat="server" ControlToValidate="firstname"
                        ErrorMessage="First Name is required" ToolTip="First name is required"
                        ValidationGroup="create">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                        controltovalidate="firstName" 
                        errormessage="First name must be 3-15 characters." ToolTip="First name must be 3-15 characters."  
                        validationexpression="[a-zA-Z]{3,15}" 
                        ValidationGroup="create">
                        First Name must be 3-15 characters.</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: </td>
                <td align="left" class="style1">
                    <input runat="server" id="lastName" type="text" name="last_name" />
                    <asp:RequiredFieldValidator ID="lastreq" runat="server" ControlToValidate="lastName"
                        ErrorMessage="Last Name is required" ToolTip="Last name is required"
                        ValidationGroup="create">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                        controltovalidate="lastName" 
                        errormessage="Last name must be 3-15 characters." ToolTip="Last name must be 3-15 characters."  
                        validationexpression="[a-zA-Z]{3,15}" 
                        ValidationGroup="create">
                        Last Name must be 3-15 characters.</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style1">
                    <input runat="server" id="email" type="text" name="email" />                    
                    <asp:RequiredFieldValidator ID="emailreq" runat="server" ControlToValidate="email"
                        ErrorMessage="Email is required" ToolTip="Email is required"
                        ValidationGroup="create" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                        controltovalidate="email" 
                        errormessage="Must input valid email address" ToolTip="Must input valid email address"  
                        Validationexpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="create">
                        Must input valid email address</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Weekly Work Hours:</td>
                <td align="left" class="style1">
                    <input runat="server" id="hours" type="text" maxlength="3" name="weekly_hours"/>
                    <asp:RequiredFieldValidator ID="hoursreq" runat="server" ControlToValidate="hours"
                        ErrorMessage="Work hours are required" ToolTip="Work hours are required"
                        ValidationGroup="create" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                        controltovalidate="hours" 
                        errormessage="Invalid Work Hours (One to three numbers only)" ToolTip="One to three numbers only"  
                        Validationexpression="[0-9]{1,3}"
                        ValidationGroup="create">
                        Invalid Work Hours (One to three numbers only)</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Experience Level:</td>
                <td align="left" class="style1">
                  
                  &nbsp;<asp:DropDownList ID="exp" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Industry:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="industry" runat="server" Height="20px" Width="240px" 
                        DataSourceID="SqlDataSourceIND" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceIND" runat="server" SelectCommand="SELECT * FROM [pms_industry]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Role:</td>
                <td align="left" class="style1"><!-- todo: fill dropdown from database -->
                    <asp:DropDownList ID="role" runat="server" Height="20px" Width="240px" 
                        DataSourceID="SqlDataSourceROLE" DataTextField="name" DataValueField="id"> 
                        <asp:ListItem>Select a role for this resource</asp:ListItem>
                        <asp:ListItem>Developer</asp:ListItem>
                        <asp:ListItem>Project Manager</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceROLE" runat="server" SelectCommand="SELECT [name], [id] FROM [pms_resource_role]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Status:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="status" runat="server" Height="20px" Width="240px" DataSourceID="SqlDataSourceStat" DataTextField="name" DataValueField="id"> 
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceStat" runat="server" SelectCommand="SELECT * FROM [pms_resource_status]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="left" class="style1">
    <asp:Label ID="outputLabel" runat="server" Text="The resource has been created!" 
        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    &nbsp;</td>
                <td align="right" class="style1">
        <asp:Button ID="submitButton" runat="server" Text="Add Resource" 
            onclick="submitButton_Click" Width="100px" Height="25px" ValidationGroup="create"/>
                </td>
            </tr>
        </table>
        <br />
        <div id="test" style="visibility:collapse">
        </div>
        <br />
        <br />
        </div>
    </asp:Content>
