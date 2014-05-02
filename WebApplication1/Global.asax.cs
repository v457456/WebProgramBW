using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;



namespace WebApplication1 {
    public class Global : System.Web.HttpApplication {

        private static string ConnectionString = WebConfigurationManager.ConnectionStrings["group3local"].ToString();
        public const int ManagerUserType = 1;
        public const int AdminUserType = 2;
        public const bool isDebug = false;

        public static string getConnectionString()
        {
            //if (HttpContext.Current.Session["Authenticated"] != null && Convert.ToBoolean(HttpContext.Current.Session["Authenticated"]) == true)
            //{
                return ConnectionString;
            //}
            //return null;
        }
        
        public static bool isAdmin() { //return true if admin, otherwise false
            if (Convert.ToInt32(HttpContext.Current.Session["UserType"]) == AdminUserType) {
                return true;
            }
            return false;
        }

        public static void logEventUser(int UserID, String action, int UserIDAffected)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            String username = "", firstname = "", lastname = "";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT username,first_name,last_name FROM pms_user WHERE id=@userid;", con);
                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = UserID;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        username = reader.GetString(0);
                        firstname = reader.GetString(1);
                        lastname = reader.GetString(2);
                    }
                }
                cmd.Dispose();
                cmd = new SqlCommand("INSERT INTO pms_log_user (date_time, copy_userid, copy_username, copy_userfirstname, copy_userlastname, copy_useridaffected, description) VALUES "
                                                                + "(@time, @userid, @username, @userfirstname, @userlastname, @useridaffected, @description);", con);

                cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Today;
                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = UserID;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@userfirstname", SqlDbType.VarChar).Value = firstname;
                cmd.Parameters.Add("@userlastname", SqlDbType.VarChar).Value = lastname;
                cmd.Parameters.Add("@useridaffected", SqlDbType.Int).Value = UserIDAffected;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = action;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                con.Close();
            }
        }

        public static void logEventProject(int UserID, String action, int ProjectID) {
            SqlConnection con = new SqlConnection(ConnectionString);
            String username = "", firstname = "", lastname = "", projectname = "";


            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT username,first_name,last_name FROM pms_user WHERE id=@userid;", con);
                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = UserID;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        username = reader.GetString(0);
                        firstname = reader.GetString(1);
                        lastname = reader.GetString(2);
                    }
                }
                cmd.Dispose();
                cmd = new SqlCommand("SELECT name FROM pms_project WHERE id=@projid;", con);
                cmd.Parameters.Add("@projid", SqlDbType.Int).Value = ProjectID;
                reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        projectname = reader.GetString(0);
                    }
                }
                cmd.Dispose();
                cmd = new SqlCommand("INSERT INTO pms_log_project (date_time, copy_userid, copy_username, copy_userfirstname, "
                + "copy_userlastname, copy_projectid, copy_projectname, description) VALUES "
                + "(@time, @userid, @username, @userfirstname, @userlastname, @projectid, @projectname, @description);", con);

                cmd.Parameters.Add("@time", SqlDbType.DateTime).Value = DateTime.Today;
                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = UserID;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@userfirstname", SqlDbType.VarChar).Value = firstname;
                cmd.Parameters.Add("@userlastname", SqlDbType.VarChar).Value = lastname;
                cmd.Parameters.Add("@projectid", SqlDbType.Int).Value = ProjectID;
                cmd.Parameters.Add("@projectname", SqlDbType.VarChar).Value = projectname;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = action;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                con.Close();
            }

        }

        public static void Application_AccessDenied(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Redirect("~/Default.aspx");
            HttpContext.Current.Response.End();
        }
        protected void Application_Start(object sender, EventArgs e) {

        }

        protected void Session_Start(object sender, EventArgs e) {

        }

        protected void Application_BeginRequest(object sender, EventArgs e) {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) {

        }
        
        protected void Application_Error(object sender, EventArgs e) {

        }

        protected void Session_End(object sender, EventArgs e) {

        }

        protected void Application_End(object sender, EventArgs e) {

        }
    }
}