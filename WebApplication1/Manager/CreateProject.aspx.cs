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
    public partial class CreateProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else
            {
                SqlDataSourceInd.ConnectionString = Global.getConnectionString();
                SqlDataSourceCust.ConnectionString = Global.getConnectionString();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string name = pname.Value.ToString();
            string cus = cust.SelectedValue.ToString();
            string inds = ind.SelectedValue.ToString();
            string sdate = start.Value.ToString();
            string edate = end.Value.ToString();
            string sflx = sflex.Value.ToString();
            string eflx = eflex.Value.ToString();

            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_project (name, start_date, end_date, start_date_flex, end_date_flex, customer_id, industry_id, manager_id) VALUES (@name, @start, @end, @sflex, @eflex, @cust, @ind, @mang);", con);

            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
            cmd.Parameters.Add("@start", SqlDbType.Date).Value = sdate;
            cmd.Parameters.Add("@end", SqlDbType.Date).Value = edate;
            cmd.Parameters.Add("@sflex", SqlDbType.Int).Value = sflx;
            cmd.Parameters.Add("@eflex", SqlDbType.Int).Value = eflx;
            cmd.Parameters.Add("@cust", SqlDbType.Int).Value = cus;
            cmd.Parameters.Add("@ind", SqlDbType.Int).Value = inds;
            cmd.Parameters.Add("@mang", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"]);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventProject(Convert.ToInt32(Session["UserID"]), "Created Project " + "\"" + name + "\"!", 0);
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