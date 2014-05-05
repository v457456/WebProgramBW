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
    public partial class SearchUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Convert.ToInt32(Session["UserType"]) != Global.AdminUserType) //admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            if (!IsPostBack) { GridView1.DataBind(); };
           
          
        }

        private void LoadGrid(string sortExpr, string sortDirection)
        {
    

            ViewState["sortDirectionStr"] = sortDirection;
            ViewState["SortExpression"] = sortExpr;

            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("", con);
            String pC = " WHERE ";
            cmd.CommandText = "SELECT pms_user.id, username AS [Username], password AS [Password], first_name AS [First_Name], last_name AS [Last_Name], email_address AS [Email_Address], pms_user_type.name AS [User_Type] FROM pms_user INNER JOIN pms_user_type ON pms_user_type.id=pms_user.type_id";


            String firstname = FirstName.Value.ToString();
            String lastname = LastName.Value.ToString();
            String username = Username.Value.ToString();
            String email = Email.Value.ToString();


            int usertype = -1;
            if (DropDownList1.SelectedValue.Equals("Administrator"))
            {
                usertype = Global.AdminUserType;
            }
            else if (DropDownList1.SelectedValue.Equals("Manager"))
            {
                usertype = Global.ManagerUserType;
            }


            if (username!="" )
            {
                cmd.CommandText += pC;
                cmd.CommandText += "username=@username";
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                pC = " AND ";
            }
            if (firstname != "")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "first_name=@firstname";
                cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = firstname;
                pC = " AND ";
            }
            if (lastname != "")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "last_name=@lastname";
                cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastname;
                pC = " AND ";
            }
            if (email != "")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "email_address=@email";
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                pC = " AND ";
            }
            if (usertype != -1)
            {
                cmd.CommandText += pC;
                cmd.CommandText += "type_id=@type";
                cmd.Parameters.Add("@type", SqlDbType.Int).Value = usertype;
                pC = " AND ";
            }
            cmd.CommandText += " ORDER BY " + sortExpr + " " + sortDirection + ";";

            try
            {
                con.Open();

                DataTable dt = new DataTable();
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                throw (ex);
            }
            finally
            {
                cmd.Dispose();
                con.Close();


            }

        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            ViewState["SortExpression"] = sortExpression;
            if (GridViewSortDirection == SortDirection.Ascending)
            {
                GridViewSortDirection = SortDirection.Descending;
                SortGridView(sortExpression, "DESC");
            }
            else
            {
                GridViewSortDirection = SortDirection.Ascending;
                SortGridView(sortExpression, "ASC");
            }
        }

        private void SortGridView(string sortExpression, string sortDirection)
        {
            LoadGrid(sortExpression, sortDirection);
        }

        private SortDirection GridViewSortDirection
        {
            get
            {
                if (ViewState["sortDirection"] == null)
                    ViewState["sortDirection"] = SortDirection.Ascending;
                return (SortDirection)ViewState["sortDirection"];
            }
            set
            {
                ViewState["sortDirection"] = value;
            }


        }
        private void BindData()
        {
             LoadGrid("[Last_Name]", "ASC");
        } 


 
        protected void submitButton_Click(object sender, EventArgs e)
        {
            ViewState["SortExpression"] = "[Last_Name]";
            LoadGrid("[Last_Name]", "ASC");
        }
       

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0]);

            GridViewRow row = GridView1.Rows[e.RowIndex];
            string uUsername = ((TextBox)(row.Cells[0].Controls[0])).Text;
            string uPass = ((TextBox)(row.Cells[1].Controls[0])).Text;
            string uFirstName = ((TextBox)(row.Cells[2].Controls[0])).Text;
            string uLastName = ((TextBox)(row.Cells[3].Controls[0])).Text;
            string uEmail = ((TextBox)(row.Cells[4].Controls[0])).Text;
            string uType = ((TextBox)(row.Cells[5].Controls[0])).Text;


            if (uPass==""||uUsername == "" || uFirstName == "" || uLastName == "" || uEmail == "" || uType == "")
            {
                LoadGrid("[Last_Name]", "ASC");
                GridView1.EditIndex = -1;
                BindData();
            }
            else
            {

                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("UPDATE pms_user SET username=@username,password=@password, first_name=@firstname, last_name=@lastname, email_address=@email, type_id=@type WHERE id=@id;", con);

                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = uUsername;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = uPass;
                cmd.Parameters.Add("@firstname", SqlDbType.VarChar).Value = uFirstName;
                cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = uLastName;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = uEmail;

                int tID = -1;
                if (uType.Equals("administrator"))
                {
                    tID = Global.AdminUserType;
                    cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = tID;
                }
                else if (uType.Equals("manager"))
                {
                    tID = Global.ManagerUserType;
                    cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = tID;
                }
                else
                {
                    LoadGrid("[Last_Name]", "ASC");
                    GridView1.EditIndex = -1;
                    BindData();
                }

                if (tID != -1)
                {
                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        Global.logEventUser(Convert.ToInt32(Session["UserID"]), "Updated customer with ID=" + "\"" + id + "\"!", 0);
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
                        LoadGrid("[Last_Name]", "ASC");
                        GridView1.EditIndex = -1;
                        BindData();
                    }

                }
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindData();
        }
       
    }
}