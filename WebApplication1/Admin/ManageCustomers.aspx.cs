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
    public partial class WebForm1 : System.Web.UI.Page
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
            CustomerName.Focus();
        }
       
        protected void submitButton_Click(object sender, EventArgs e)
        {

            String cName = CustomerName.Value.ToString();
            String cPhone = CustomerPhone.Value.ToString();
            String cEmail = CustomerEmail.Value.ToString();

            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_customer (name,phone_number,email) VALUES "+ "(@name, @phone, @email);", con);

            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = cName;
            cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = cPhone;
            cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = cEmail;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Created customer " + "\"" + cName + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageCustomers.aspx");
        }
        protected void CustomerGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);

            GridViewRow row = CustomerGridView.Rows[e.RowIndex];
            string cName = ((TextBox)(row.Cells[0].Controls[0])).Text;
            string cPhone = ((TextBox)(row.Cells[1].Controls[0])).Text;
            string cEmail = ((TextBox)(row.Cells[2].Controls[0])).Text;

            if (cName == "") Response.Redirect("~/Admin/ManageCustomers.aspx");
         

                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("UPDATE pms_customer SET name=@name, phone_number=@phone, email=@email WHERE id=@id;", con);

                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = cName;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = cPhone;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = cEmail;
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

                Response.Redirect("~/Admin/ManageCustomers.aspx");
            
        }
        protected void CustomerGridView_RowDeleted(Object sender, GridViewDeletedEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("DELETE FROM pms_customer WHERE id=@id;", con);

            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Deleted customer with ID=" + "\"" + id + "\"!", 0);
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

            Response.Redirect("~/Admin/ManageCustomers.aspx");

        }

    //TODO: grab name of deleted customer then delete, if while updating erase whole box, check

       
    }
}