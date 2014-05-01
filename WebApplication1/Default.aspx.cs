using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.Data;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] != null && Convert.ToBoolean(Session["Authenticated"]) == true) {
                if (Convert.ToInt32(Session["UserType"]) == Global.ManagerUserType) //manager
                {
                    Response.Redirect("/Manager/MyProjects.aspx");
                }
                else if (Convert.ToInt32(Session["UserType"]) == Global.AdminUserType) //admin
                {
                    Response.Redirect("/Admin/Registration.aspx");
                }
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            Login1_Authenticate1(sender, e);
        }

   

        protected static Tuple<Boolean, int, int> Authentication(string username, string password)
        {
            SqlConnection conn;
            SqlCommand cmd;
            string lookupPassword = null;
            int lookupUserID = -1;
            int lookupUserType = -1;
            Match usernameMatch = System.Text.RegularExpressions.Regex.Match(password, @"[a-zA-Z0-9_.\-\@]{3,15}");
            Match passwordMatch = System.Text.RegularExpressions.Regex.Match(password, @"[A-Za-z0-9_.\-\!\@\#\$\%\&\*]{5,25}");

            
            if ((null == username) || (0 == username.Length) || (username.Length > 15) || (username.Length < 3) || !usernameMatch.Success)
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of username failed.");
                return new Tuple<Boolean, int, int>(false, -1, -1);
            }

            if ((null == password) || (0 == password.Length) || (password.Length > 25) || (password.Length < 5) || !passwordMatch.Success)
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of password failed.");
                return new Tuple<Boolean, int, int>(false, -1, -1);
            }

            try
            {
                conn = new SqlConnection(Global.getConnectionString());
                conn.Open();

                cmd = new SqlCommand("SELECT id,password,type_id FROM pms_user WHERE username=@username", conn);
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lookupUserID = reader.GetInt32(0);
                        lookupPassword = reader.GetString(1);
                        lookupUserType = reader.GetInt32(2);
                    }
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("Bad Login for user: {0} ", username);
                }
                reader.Close();

                cmd.Dispose();
                conn.Dispose();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Exception " + ex.Message);
            }

            if (lookupPassword == null)
            {
                return new Tuple<Boolean, int, int>(false, -1, -1);
            }
            else
            {
                return new Tuple<Boolean, int, int>((0 == string.Compare(lookupPassword, password, false)), lookupUserType, lookupUserID);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            Tuple<Boolean, int, int> blnresult = new Tuple<Boolean, int, int>(false, -1, -1);
            int UserType = -1;
            int UserID = -1;

            // Pass UserName  and Password from login1 control to an authentication function which will check will check the user name and password from sql server.
            // Then will retrun a true or false value into blnresult variable
            blnresult = Authentication(Login1.UserName, Login1.Password);


            // If blnresult has a true value then authenticate user 
            if (blnresult.Item1 == true)
            {
                if (blnresult.Item2 != -1)
                    UserType = blnresult.Item2;
                if (blnresult.Item3 != -1)
                    UserID = blnresult.Item3;
                if (Global.isDebug) Response.Write("UserID: " + UserID + " UserType: " + UserType + " AuthenticationPass: true");
                // This is the actual statement which will authenticate the user
                e.Authenticated = true;
                Session["UserType"] = UserType;
                Session["UserID"] = UserID;
                Session["Authenticated"] = true;
            }
            else
            {
                // If user faild to provide valid user name and password
                e.Authenticated = false;
                Session["Authenticated"] = false;
            }
        }

    }
}