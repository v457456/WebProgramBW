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
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {

            String rName = RoleName.Value.ToString();
            String a = Convert.ToInt32(TR1.Value).ToString("00");
            String b = Convert.ToInt32(TR2.Value).ToString("00");
            String c = Convert.ToInt32(TR3.Value).ToString("00");
            String d = Convert.ToInt32(TR4.Value).ToString("00");
            String l = Convert.ToInt32(TR5.Value).ToString("00");
            String f = Convert.ToInt32(TR6.Value).ToString("00");
            String g = Convert.ToInt32(TR7.Value).ToString("00");
            String h = Convert.ToInt32(TR8.Value).ToString("00");
            String j = Convert.ToInt32(TR9.Value).ToString("00");
            String k = Convert.ToInt32(TR10.Value).ToString("00");
           

            String rTenth = a + b + c + d + l + f + g + h + j + k;

            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_resource_role (name,default_tenth_rule) VALUES " + "(@name, @tenth_rule);", con);

            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = rName;
            cmd.Parameters.Add("@tenth_rule", SqlDbType.VarChar).Value = rTenth;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Created Role " + "\"" + rName + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageRoles.aspx");
        }
        protected void RoleGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);

            GridViewRow row = RoleGridView.Rows[e.RowIndex];
            string rName = ((TextBox)(row.Cells[0].Controls[0])).Text;
            string rTenth = ((TextBox)(row.Cells[1].Controls[0])).Text;// +((TextBox)(row.Cells[3].Controls[0])).Text + ((TextBox)(row.Cells[4].Controls[0])).Text + ((TextBox)(row.Cells[5].Controls[0])).Text + ((TextBox)(row.Cells[6].Controls[0])).Text + ((TextBox)(row.Cells[7].Controls[0])).Text + ((TextBox)(row.Cells[8].Controls[0])).Text + ((TextBox)(row.Cells[9].Controls[0])).Text + ((TextBox)(row.Cells[10].Controls[0])).Text + ((TextBox)(row.Cells[11].Controls[0])).Text;

            if (rTenth.Length > 20)  Response.Redirect("~/Admin/ManageRoles.aspx"); 
            if (rName == "" || rTenth=="") Response.Redirect("~/Admin/ManageRoles.aspx");
           

                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("UPDATE pms_resource_role SET name=@name, default_tenth_rule=@tenth_rule WHERE id=@id;", con);

                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = rName;
                cmd.Parameters.Add("@tenth_rule", SqlDbType.VarChar).Value = rTenth;
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

                Response.Redirect("~/Admin/ManageRoles.aspx");
            
        }
        protected void RoleGridView_RowDeleted(Object sender, GridViewDeletedEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("DELETE FROM pms_resource_role WHERE id=@id;", con);

            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Deleted role with ID=" + "\"" + id + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageRoles.aspx");

        }

    }
}