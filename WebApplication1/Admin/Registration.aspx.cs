using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Convert.ToInt32(Session["UserType"]) != Global.AdminUserType) //admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else if (!IsPostBack)
            {

            }
            Text1.Focus();
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            int userType = DropDownList1.SelectedIndex;
            if (userType != 0) // if user type is selected
            {

                

                String first = Text1.Value,
                    last = Text2.Value,
                    email = Text3.Value,
                    username = Text4.Value,
                    password = Text5.Value;

                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("INSERT INTO pms_user ( username, password, first_name, last_name, email_address, type_id ) VALUES "
                                                + "(@username, @password, @first, @last, @email, @type);", con);

                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                cmd.Parameters.Add("@first", SqlDbType.VarChar).Value = first;
                cmd.Parameters.Add("@last", SqlDbType.VarChar).Value = last;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@type", SqlDbType.Int).Value = userType;

                if (Global.isDebug) Response.Write("first: " + first + "last: " + last + "email: " + email + "username: " + username + "password: " + password + "<br/>");
                
                try {
                    con.Open();
                    if (Global.isDebug) Response.Write(cmd.CommandText);
                    cmd.ExecuteNonQuery();
                    Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Created user " + "\"" + username +"\" as a(n) " + DropDownList1.SelectedValue + "!", 0);
                    outputLabel.Visible = true;
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
                finally
                {
                    cmd.Dispose();
                    con.Dispose();
                    con.Close();
                }
                

                
            }
        }
    }
}