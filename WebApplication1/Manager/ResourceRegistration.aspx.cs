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
    public partial class ResourceRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else
            {
                SqlDataSourceIND.ConnectionString = Global.getConnectionString();
                SqlDataSourceROLE.ConnectionString = Global.getConnectionString();
                SqlDataSourceStat.ConnectionString = Global.getConnectionString();
                status.SelectedIndex = 1;
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string first = firstName.Value.ToString();
            string last = lastName.Value.ToString();
            string em = email.Value.ToString();
            string whours = hours.Value.ToString();
            string explevel = exp.SelectedValue.ToString();
            string ind = industry.SelectedValue.ToString();
            string rol = role.SelectedValue.ToString();
            string stat = status.SelectedValue.ToString();

            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_resource (first_name, last_name, email_address, industry_id, role_id, status_id, work_hours, experience_level) VALUES (@first, @last, @email, @ind, @role, @status, @hours, @exp);", con);

            cmd.Parameters.Add("@first", SqlDbType.VarChar).Value = first;
            cmd.Parameters.Add("@last", SqlDbType.VarChar).Value = last;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = em;
            cmd.Parameters.Add("@ind", SqlDbType.Int).Value = ind;
            cmd.Parameters.Add("@role", SqlDbType.Int).Value = rol;
            cmd.Parameters.Add("@status", SqlDbType.Int).Value = stat;
            cmd.Parameters.Add("@hours", SqlDbType.Int).Value = whours;
            cmd.Parameters.Add("@exp", SqlDbType.Int).Value = explevel;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Added Resource " + "\"" + first + " " + last + "\"!", 0);
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

            outputLabel.Visible = true;
            
        }
    }
}