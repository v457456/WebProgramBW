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
                <input runat="server" id="pname" type="text" />
                
                <asp:RequiredFieldValidator ID="namereq" runat="server" ControlToValidate="pname"
                    ErrorMessage="Project Name is required" ToolTip="Project Name is required"
                    ValidationGroup="create">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" display="Dynamic"
                    controltovalidate="pname" 
                    errormessage="Project name must be 3-15 characters." ToolTip="Project name must be 3-15 characters."  
                    validationexpression="[a-zA-Z]{3,15}" 
                    ValidationGroup="create">
                    Project Name must be 3-15 characters.</asp:RegularExpressionValidator>

            </td>
            <td class="style28" align="left">
            </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Customer:</td>
            <td class="style27" align="left">
                <asp:DropDownList ID="cust" runat="server" Height="28px" Width="190px" DataSourceID="SqlDataSourceCust" DataTextField="name" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceCust" runat="server" SelectCommand="SELECT [id], [name] FROM [pms_customer]"></asp:SqlDataSource>
            </td>
            <td class="style28" align="left">
            </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Industry:</td>
            <td class="style27" align="left">
                <asp:DropDownList ID="ind" runat="server" Height="28px" Width="190px" DataSourceID="SqlDataSourceInd" DataTextField="name" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceInd" runat="server" SelectCommand="SELECT * FROM [pms_industry]"></asp:SqlDataSource>
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Start Date:</td>
            <td class="style27" align="left">
                <input runat="server" id="start" type="text" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="start"
                    ErrorMessage="Start date is required" ToolTip="Start date is required"
                    ValidationGroup="create">*</asp:RequiredFieldValidator>
               <!-- <asp:RegularExpressionValidator runat="server" display="Dynamic"
                    controltovalidate="start" 
                    errormessage="Start date must in MM/DD/YYYY format." ToolTip="Start date must in MM/DD/YYYY format."  
                    validationexpression="/^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d+$/" 
                    ValidationGroup="create">
                    Start date must in MM/DD/YYYY format.</asp:RegularExpressionValidator> -->
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                Start Date Flexability:</td>
            <td class="style27" align="left">
                <div style="display: inline-block; vertical-align: middle; margin: 0 3px 0 3px;">+/-</div>
                <input id="sflex" type="text" runat="server" clientidmode="Static" maxlength="2" style="width: 30px" />
                <div style="display: inline-block; vertical-align: middle;">Weeks</div>

                <asp:RequiredFieldValidator runat="server" ControlToValidate="sflex"
                    ErrorMessage="Start flexibility is required" ToolTip="Start flexibility is required"
                    ValidationGroup="create">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" display="Dynamic"
                    controltovalidate="sflex" 
                    errormessage="Start flexibility must be 0-9." ToolTip="Start flexibility must be 0-9."  
                    validationexpression="[0-9]" 
                    ValidationGroup="create">
                    Start flexibility must be 0-9.</asp:RegularExpressionValidator>
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                End Date:</td>
            <td class="style27" align="left">
                <input runat="server" id="end" type="text" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="end"
                    ErrorMessage="End date is required" ToolTip="End date is required"
                    ValidationGroup="create">*</asp:RequiredFieldValidator>
              <!--  <asp:RegularExpressionValidator runat="server" display="Dynamic"
                    controltovalidate="end" 
                    errormessage="End date must in MM/DD/YYYY format." ToolTip="End date must in MM/DD/YYYY format."  
                    validationexpression="/^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d+$/" 
                    ValidationGroup="create">
                    End date must in MM/DD/YYYY format.</asp:RegularExpressionValidator> -->
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                End Date Flexability:</td>
            <td class="style27" align="left">
                <div style="display: inline-block; vertical-align: middle; margin: 0 3px 0 3px;">+/-</div>
                <input id="eflex" type="text" runat="server" clientidmode="Static" maxlength="2" style="width: 30px" />
                <div style="display: inline-block; vertical-align: middle;">Weeks</div>

                <asp:RequiredFieldValidator runat="server" ControlToValidate="eflex"
                    ErrorMessage="End flexibility is required" ToolTip="End flexibility is required"
                    ValidationGroup="create">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" display="Dynamic"
                    controltovalidate="eflex" 
                    errormessage="End flexibility must be 0-9." ToolTip="End flexibility must be 0-9."  
                    validationexpression="[0-9]" 
                    ValidationGroup="create">
                    End flexibility must be 0-9.</asp:RegularExpressionValidator>
            </td>
            <td class="style28" align="left">
                </td>
        </tr>
        <tr class="style22">
            <td class="style26" align="right">
                </td>
            <td class="style27" align="left">
                <asp:Label ID="outputLabel" runat="server" Text="Project Successfully Added!" Visible="False"></asp:Label>
                </td>
            <td class="style28" align="left">

<asp:Button runat="server" Text="Submit" ID="submitButton" onclick="submitButton_Click" validationgroup="create"/>
            </td>
        </tr>
    </table>
    </div>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" />
<script type="text/javascript">
    $("#<%=start.ClientID%>").datepicker();
    $("#<%=end.ClientID%>").datepicker();
</script>

</asp:Content>
