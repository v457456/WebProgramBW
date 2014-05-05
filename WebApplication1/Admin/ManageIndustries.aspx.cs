using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1.Admin
{
    public partial class ManageIndustries : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Convert.ToInt32(Session["UserType"]) != Global.AdminUserType) //admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else
            {
                SqlDataSource1.ConnectionString = Global.getConnectionString();
            }
            IndustryName.Focus();
        }
        protected void submitButton_Click(object sender, EventArgs e)
        {

            String iName = IndustryName.Value.ToString();
            
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_industry (name) VALUES " + "(@name);", con);

            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = iName;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Created industry " + "\"" + iName + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageIndustries.aspx");
        }
        protected void IndustryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);

            GridViewRow row = IndustryGridView.Rows[e.RowIndex];
            string iName = ((TextBox)(row.Cells[0].Controls[0])).Text;

            if (iName == "") Response.Redirect("~/Admin/ManageIndustries.aspx");
            

                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("UPDATE pms_industry SET name=@name WHERE id=@id;", con);

                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = iName;
                cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    //Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Updated customer with ID=" + "\"" + id + "\" changed name to "+ "\!", 0);
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

                Response.Redirect("~/Admin/ManageIndustries.aspx");
            
        }
        protected void IndustryGridView_RowDeleted(Object sender, GridViewDeletedEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("DELETE FROM pms_industry WHERE id=@id;", con);

            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Deleted industry with ID=" + "\"" + id + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageIndustries.aspx");

        }
        
    }
}