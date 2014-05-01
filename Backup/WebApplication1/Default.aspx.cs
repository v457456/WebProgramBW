using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Check"] != null) && (Convert.ToBoolean(Session["Check"]) == true))
            {
                if ((bool)Session["Authenticated"]) {

                    if (Session["UserType"].ToString().Equals("0")) //manager
                    {
                        Response.Redirect("./MyProjects.aspx");
                    }
                    else if (Session["UserType"].ToString().Equals("1")) //admin
                    {
                        Response.Redirect("./Registration.aspx");
                    }
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

            if ((null == username) || (0 == username.Length) || (username.Length > 15))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of username failed.");
                return new Tuple<Boolean, int, int>(false, -1, -1);
            }

            if ((null == password) || (0 == password.Length) || (password.Length > 25))
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of password failed.");
                return new Tuple<Boolean, int, int>(false, -1, -1);
            }

            //string sqlstring = "Select username, password from [pms_user] where username='" + username + "' and password ='" + password + "'";

            // create a connection with sqldatabase 
            //System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(" Data Source=.\\SQLEXPRESS;Initial Catalog=group3;Persist Security Info=True;Connect Timeout=10;TrustServerCertificate=True ");
            //" Data Source=pegasus;Initial Catalog=group3;Persist Security Info=True;User ID=group3;Password=bwjacketsgroup3;Connect Timeout=10;TrustServerCertificate=True ");
            //conn = new SqlConnection("server=localhost;Integrated Security=SSPI;database=pubs");
            try
            {

                conn = new SqlConnection("server=pegasus;" +
                                     "database=group3;" +
                                     "User ID=group3;" +
                                     "pwd=bwjacketsgroup3;" +
                                     "Connect Timeout=10;" +
                                     "TrustServerCertificate=True;" +
                                     "Persist Security Info=True");

                /*
                conn = new SqlConnection("server=.\\PEGASUS;" +
                                         "database=group3;" +
                                         "User ID=group3;" +
                                         "pwd=bwjacketsgroup3;" +
                                         "Connect Timeout=10;" +
                                         "TrustServerCertificate=True;" +
                                         "Persist Security Info=True");
                */
                conn.Open();
                // create a sql command which will user connection string and your select statement string

                cmd = new SqlCommand("Select id,password,type_id from pms_user where username=@username", conn);
                cmd.Parameters.Add("@username", System.Data.SqlDbType.VarChar, 25);

                cmd.Parameters["@username"].Value = username;


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
            // create a sqldatabase reader which will execute the above command to get the values from sqldatabase
            //System.Data.SqlClient.SqlDataReader reader;

            // open a connection with sqldatabase

            // check if reader hase any value then return true otherwise return false
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
                // This is the actual statement which will authenticate the user
                e.Authenticated = true;
                // Store your authentication mode in session variable 
                Session["Check"] = true;
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