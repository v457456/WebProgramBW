<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body
        {
            margin: 0;
            padding: 0;
            text-align:center;
            font-family: "Comic Sans-Serif" !;
            background-image: url("../Images/loginlogo.png");
        }
        
        #content
        {
            height: 500px;
            width: 500px;
            margin: 100px auto auto auto;
            padding: 30px;
            background-color: White;
        }
        
        #logo
        {
            margin: 0;
            padding: 0;
            display: block;
        }
        
        #login
        {
            margin-left: auto;
            margin-right: auto;
            width:50%;
            padding: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="content">
        <div id="logo">
            <h1>Hyland Software</h1>
        </div>
        <div id="login">
            <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate1">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">
                                            Log In</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                controltovalidate="UserName" 
                                                errormessage="Username must be 3-15 letters." ToolTip="Username must be 3-15 letters."  
                                                validationexpression="[a-zA-Z]{3,15}" ValidationGroup="Login1">* Username must be 3-15 letters.</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="Password" 
                                                ErrorMessage="Password must be 5-25 letters." ToolTip="Password must be 5-25 letters." 
                                                validationexpression="[A-Za-z0-9_\!\@\#\$\%\&\*]{5,25}" ValidationGroup="Login1">* Password must be 5-25 characters.</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" 
                                                ValidationGroup="Login1" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </div>
    </div>
    </form>
</body>
</html>
