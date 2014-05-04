<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="WebApplication1.Admin.ManageRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .GridViewEditRow input[type=text] {
            width:300px
        }

        
        .GridViewEditRow {
            width: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
     <div>
        <h1 align="center">Manage Roles</h1>
         <br />
       <hr style="width:90%; margin-left:auto; margin-right:auto;margin-bottom:15px;margin-top:5px;"/>
        <br />
        <div>
             <div>
                  <div style="width:100%; text-align:left; margin-left:40px;"><h2 style="padding-bottom:5px;display:inline;margin:0 50px 0 30px">Add New Role</h2>
                 <div style="text-align:right;display:inline;padding-left:80px"> Fill in the new role name and tenth rule (2 digits per slot) and click &#39;Submit&#39; to create a new role. </div>
                 </div>
             <hr style="width: 95%; margin-top: 5px; margin-left: auto; margin-right: auto;margin-bottom: 5px;" />

           <table style="width: 90%; height: 130px; color: #000000;margin: 0 auto 0 auto; text-align:center">
                 <tr>
                     <td align="right" class="style2">
                        <b>Role Name:</b></td>
                    <td align="left" class="style1">
                        <input runat="server" id="RoleName" type="text" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="RoleName"
                    ErrorMessage="Please insert a role name." ValidationGroup="SubmitGroup"><b style="color:red">*Please insert a role name.</b></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                     <td align="right" class="style2">
                         <b>Tenth Rule:</b></td>
                    <td align="left" class="style1">
                        <input runat="server" id="TR1" type="text" size="3" maxlength="2" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TR1"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR1" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>


                        <input runat="server" id="TR2" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TR2"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR2" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>


                        <input runat="server" id="TR3" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TR3"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR3" 
                                               ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR4" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TR4"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR4" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR5" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TR5"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR5" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR6" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TR6"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR6" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR7" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TR7"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR7" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR8" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TR8"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR8" 
                                               ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR9" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TR9"
                    ErrorMessage="" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR9" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                        <input runat="server" id="TR10" type="text" size="3" maxlength="2"  />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TR10"
                    ErrorMessage="*" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" display="Dynamic"
                                                ControlToValidate="TR10" 
                                                ErrorMessage="Each tenth rule section must be two digits in length." ToolTip="Each section must have two digits" 
                                                validationexpression="^\d{1,2}$" ValidationGroup="SubmitGroup"><b style="color:red">*</b></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>

                      

                    <td align="center" colspan="2" style="color:Red;">
                   
                   </td>
                </tr>
                <tr>
                    <td align="right" class="style2" size="2">

                        &nbsp;</td>
                    <td align="right" class="style1"">
                        <asp:Button ID="submitButton" runat="server" Text="Submit" 
                        onclick="submitButton_Click" Width="100px" Height="25px" ValidationGroup="SubmitGroup" />
                    </td>
                </tr>
            </table>
        </div>
           
   <script type="text/javascript">

       $(document).ready(function () {
           $("#<%=RoleGridView.ClientID%>").keydown(function (e) {
                    if (e.keyCode == 13) {
                        return false;
                    }
                });

            });

        </script>
            <div style="margin:0 auto 0 auto; width:100%;padding-top: 20px;">
                <h3 style=" text-align:center;">View and Edit Roles</h3><br />
                <hr style="width: 65%; margin-top: 0px; margin-left: auto; margin-right: auto; margin-bottom: 10px;" />

            <asp:GridView 
                ID="RoleGridView" 
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
                ForeColor="#333333" 
                Width="100%"
                HorizontalAlign="Center"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id"
                onRowUpdating="RoleGridView_RowUpdating" > 
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Role Name" SortExpression="name">
                        <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>
                     <asp:BoundField DataField="default_tenth_rule" HeaderText="Tenth Rule" SortExpression="default_tenth_rule">
                        <HeaderStyle Width="100px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle"  />
                    </asp:BoundField>

                    <asp:CommandField ShowEditButton="True" >
                        <HeaderStyle Width="35px" Height="20px" HorizontalAlign="Center" VerticalAlign="Middle" CssClass="headerclear"/>
                        <ItemStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                        
                    </asp:CommandField>
               
                     </Columns>
                
                <EditRowStyle BackColor="#999999" CssClass="GridViewEditRow" />
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
             <asp:SqlDataSource 
                 ID="SqlDataSource1" 
                 runat="server" 
                 ProviderName="System.Data.SqlClient" 
                 SelectCommand="SELECT [id], [name], [default_tenth_rule] FROM [pms_resource_role] ORDER BY [name];"
                >
                 <UpdateParameters>
                     <asp:Parameter Name="name" />
                     <asp:Parameter Name="default_tenth_rule" />
                     
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>


      
       </div>

        </div>
</asp:Content>
