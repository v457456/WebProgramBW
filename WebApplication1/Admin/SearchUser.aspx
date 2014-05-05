<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchUser.aspx.cs" Inherits="WebApplication1.SearchUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            height: 30px;
            padding: 3px 0px 3px 0px;
            
        }
        .style2 {
            height: 30px;
            padding: 3px 0px 3px 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div>
        <div>
            <div>
        <h1 align="center">User Search</h1>
       
        Please fill in as many fields as possible and then click &#39;Search&#39; to list found users.<br />
        
       
       
        <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto;margin-bottom: 5px;" />

        <table style="width: 75%; height: 130px; color: #000000;margin: 0 auto 0 auto;text-align:center">
            <tr>
                <td align="right" class="style2">
                    First Name:
                </td>
                <td align="left" class="style1">
                    <input runat="server" id="FirstName" type="text" />
                     <asp:RegularExpressionValidator 
                         ID="RequiredFieldValidator1"
                         runat="server" 
                         display="Dynamic"        
                         ControlToValidate="FirstName"                   
                         ErrorMessage="Must contain either nothing or a valid first name."
                         ToolTip="Must contain either nothing or a valid first name."                    
                         validationexpression="^[a-zA-Z''-'\s]{1,40}$"
                         ValidationGroup="SubmitGroup">
                         <b style="color:red">*Please enter either no first name or a valid first name.</b>
                     </asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Last Name: 
                </td>
                <td align="left" class="style1">
                    <input runat="server" id="LastName" type="text"/>
                     <asp:RegularExpressionValidator 
                         ID="RequiredFieldValidator2"
                         runat="server" 
                         display="Dynamic"        
                         ControlToValidate="LastName"                   
                         ErrorMessage="Must contain either nothing or a valid first name."
                         ToolTip="Must contain either nothing or a valid first name."                    
                         validationexpression="^[a-zA-Z''-'\s]{1,40}$"
                         ValidationGroup="SubmitGroup"> 
                        <b style="color:red">*Please enter either no last name or a valid last name.</b>
                     </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Email Address:
                </td>
                <td align="left" class="style1">
                    <input runat="server" id="Email" type="text"/>
                      <asp:RegularExpressionValidator 
                         ID="RegularExpressionValidator3"
                         runat="server" 
                         display="Dynamic"        
                         ControlToValidate="Email"                   
                         ErrorMessage="Must contain either nothing or a valid email."
                         ToolTip="Must contain either nothing or a valid email."                    
                         validationexpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" 
                         ValidationGroup="SubmitGroup"> 
                        <b style="color:red">*Please enter either no email or a valid email.</b>
                     </asp:RegularExpressionValidator>
               </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    Username:
                </td>
                <td align="left" class="style1">
                    <input runat="server" id="Username" type="text" />
                    <asp:RegularExpressionValidator 
                        ID="RequiredFieldValidator4"
                         runat="server" 
                         display="Dynamic"        
                         ControlToValidate="Username"                   
                         ErrorMessage="Enter either nothing or a username with 3-15 characters (Specials allowed: @,_,.,-)."
                         ToolTip="Enter either nothing or a username with 3-15 characters (Specials allowed: @,_,.,-)."                  
                         validationexpression="[a-zA-Z0-9_.\-\@]{3,15}"
                         ValidationGroup="SubmitGroup"> 
                        <b style="color:red">*Enter either nothing or a username with 3-15 characters (Specials allowed: @,_,.,-).</b>
                     </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">
                    User Type:</td>
                <td align="left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>Any</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">&nbsp;</td>
                <td align="left" class="style1">
                    <asp:Label ID="outputLabel" runat="server" Text="Information Entered Incorrectly" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style2">&nbsp;</td>
                <td align="right" class="style1">
                    <asp:Button ID="submitButton" runat="server" Text="Search" onclick="submitButton_Click" ValidationGroup="SubmitGroup" Width="100px" Height="25px" />
                </td>
            </tr>
        </table>
     </div>


     <div style="margin:0 auto 0 auto; width:100%;padding-top: 20px;">
        <h3 style=" text-align:center;">View and Edit Users</h3><br />      
        <hr style="width: 65%; margin-top: 0px; margin-left: auto; margin-right: auto; margin-bottom: 10px;" />
        
                <asp:GridView 
                    ID="GridView1" 
                    runat="server"
                    AllowPaging="True" 
                    GridLines="None" 
                    BackColor="#B3C0C4" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    BorderColor="Gray" 
                    BorderStyle="Solid" 
                    BorderWidth="1px" 
                    CellPadding="4" 
                    CellSpacing="1" 
                    Width="100%"
                    ForeColor="#333333" 
                    DataKeyNames="id"
                    OnSorting="GridView1_Sorting"
                    OnRowEditing="GridView1_RowEditing1"
                    OnRowUpdating="GridView1_RowUpdating1"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit">
                
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   
                     <Columns>
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>

                         <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>
                         

                        <asp:BoundField DataField="First_Name" HeaderText="First name" SortExpression="First_Name">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>

                        <asp:BoundField DataField="Last_Name" HeaderText="Last name" SortExpression="Last_Name">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>

                        <asp:BoundField DataField="Email_Address" HeaderText="Email Address" SortExpression="Email_Address">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>
                   
                        <asp:BoundField DataField="User_Type" HeaderText="User Type" SortExpression="User_Type">
                            <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:BoundField>
                    
                        <asp:CommandField ShowEditButton="True" >
                            <HeaderStyle Width="35px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="headerclear"/>
                            <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                        </asp:CommandField>
               
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
        </div>
    </div>
</asp:Content>
