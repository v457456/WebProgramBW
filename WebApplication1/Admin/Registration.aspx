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
                    <input id="Text1" type="text" runat="server" name="first"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Text1"
                    ErrorMessage="First name required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: </td>
                <td align="left" class="style1">
                    <input id="Text2" type="text" runat="server" name="last"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Text2"
                    ErrorMessage="Last name required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:</td>
                <td align="left" class="style1">
                    <input id="Text3" type="text" runat="server" name="email"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Text3"
                    ErrorMessage="Email address required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Username:</td>
                <td align="left" class="style1">
                    <input id="Text4" type="text" runat="server" name="username"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Text4"
                    ErrorMessage="Username required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                controltovalidate="Text4" 
                                                errormessage="Username must be 3-15 characters (Specials allowed: @,_,.,-)." ToolTip="Username must be 3-15 characters (Specials allowed: @,_,.,-)."  
                                                validationexpression="[a-zA-Z0-9_.\-\@]{3,15}" ValidationGroup="SubmitGroup">Username must be 3-15 characters (Specials allowed: @,_,.,-).</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Password:</td>
                <td align="left" class="style1">
                    <input id="Text5" type="text" runat="server" name="password"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Text5"
                    ErrorMessage="Password required!" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="Text5" 
                                                ErrorMessage="Password must be 5-25 characters (Specials allowed: !,@,#,$,%,&,_,-,.,*)." ToolTip="Password must be 5-25 characters (Specials allowed: !,@,#,$,%,&,_,-,.,*)." 
                                                validationexpression="[A-Za-z0-9_.\-\!\@\#\$\%\&\*]{5,25}" ValidationGroup="SubmitGroup">Password must be 5-25 characters (Specials allowed: !,@,#,$,%,&,_,-,.,*). </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    User Type:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [pms_user_type]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1"
                    ErrorMessage="Selection Required!" InitialValue="Select a User Type" ValidationGroup="SubmitGroup"></asp:RequiredFieldValidator>
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
            onclick="submitButton_Click" Width="100px" Height="25px" ValidationGroup="SubmitGroup"/>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        </div>
    </asp:Content>
