using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication1
{
    public partial class SearchResource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            } else if (!IsPostBack) {
                SqlConnection con = new SqlConnection(Global.getConnectionString());
                DataTable roles = new DataTable(), industries = new DataTable();
                SqlDataAdapter adptrole = new SqlDataAdapter("SELECT name FROM pms_resource_role;", con);
                adptrole.Fill(roles);
                SqlDataAdapter adptindustry = new SqlDataAdapter("SELECT name FROM pms_industry;", con);
                adptindustry.Fill(industries);

                String temp;
                foreach (DataRow row in roles.Rows) {
                    temp = row["name"].ToString();
                    row["name"] = char.ToUpper(temp[0]) + temp.Substring(1).ToLower();
                }
                foreach (DataRow row in industries.Rows) {
                    temp = row["name"].ToString();
                    row["name"] = char.ToUpper(temp[0]) + temp.Substring(1).ToLower();
                }
                try { 
                    con.Open();
                    DropDownList1.DataSource = roles;
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "name"; // "id" if SELECT *
                    DropDownList1.DataBind();
                    DropDownList2.DataSource = industries;
                    DropDownList2.DataTextField = "name";
                    DropDownList2.DataValueField = "name";
                    DropDownList2.DataBind();
                } catch (Exception ex) {
                    throw (ex);
                }
                finally
                {
                    adptrole.Dispose();
                    adptindustry.Dispose();
                    roles.Dispose();
                    con.Dispose();
                    con.Close();
                }
                DropDownList1.Items.Insert(0, new ListItem("Any", "Any"));
                DropDownList2.Items.Insert(0, new ListItem("Any", "Any"));
                DropDownList4.SelectedIndex = 2;
                DropDownList5.SelectedIndex = 4;
            }
        }

        private void LoadGrid(string sortExpr, string sortDirection)
        {
            ViewState["sortDirectionStr"] = sortDirection;
            ViewState["SortExpression"] = sortExpr;
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("", con);
            String pC = " WHERE ";
            cmd.CommandText = "SELECT first_name AS 'First Name', last_name AS 'Last Name', " +
                " email_address AS 'Email Address', experience_level AS 'Experience Level', " +
                " work_hours AS 'Work Hours', pms_industry.name AS 'Industry', pms_resource_role.name" +
                " AS 'Role' FROM pms_resource";
            cmd.CommandText += " INNER JOIN pms_resource_role ON pms_resource.role_id = pms_resource_role.id";
            cmd.CommandText += " INNER JOIN pms_industry ON pms_resource.industry_id = pms_industry.id";

            String firstname = Request.Form["in_firstname"];
            if (Global.isDebug) Response.Write(firstname);
            String lastname = Request.Form["in_lastname"];
            String email = Request.Form["in_email"];
            String expmeasure = DropDownList4.SelectedValue;
            int explevel = Convert.ToInt32(DropDownList6.SelectedValue);
            String workhoursmeasure = DropDownList5.SelectedValue;
            int workhourslevel = Convert.ToInt32(Request.Form["in_workhours"]);
            String industry = DropDownList2.SelectedValue.ToLower();
            String role = DropDownList1.SelectedValue.ToLower();

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
            if (explevel != -1)
            {
                cmd.CommandText += pC;
                cmd.CommandText += "experience_level";
                if (expmeasure == ">")
                    cmd.CommandText += ">";
                else if (expmeasure == "≥")
                    cmd.CommandText += ">=";
                else if (expmeasure == "=")
                    cmd.CommandText += "=";
                else if (expmeasure == "≤")
                    cmd.CommandText += "<=";
                else if (expmeasure == "<")
                    cmd.CommandText += "<";
                cmd.CommandText += "@exp";
                cmd.Parameters.Add("@exp", SqlDbType.Int).Value = explevel;
                pC = " AND ";
            }
            if (workhourslevel != -1)
            {
                cmd.CommandText += pC;
                cmd.CommandText += "work_hours";
                if (workhoursmeasure == ">")
                    cmd.CommandText += ">";
                else if (workhoursmeasure == "≥")
                    cmd.CommandText += ">=";
                else if (workhoursmeasure == "=")
                    cmd.CommandText += "=";
                else if (workhoursmeasure == "≤")
                    cmd.CommandText += "<=";
                else if (workhoursmeasure == "<")
                    cmd.CommandText += "<";
                cmd.CommandText += "@wrkhrs";
                cmd.Parameters.Add("@wrkhrs", SqlDbType.Int).Value = workhourslevel;
                pC = " AND ";
            }
            if (industry != "any")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "pms_industry.name=@industry";
                cmd.Parameters.Add("@industry", SqlDbType.VarChar).Value = industry;
                pC = " AND ";
            }
            if (Global.isDebug) Response.Write("INDUSTRY: " + industry + "\n");
            if (Global.isDebug) Response.Write("ROLE: " + role + "\n");

            if (role != "any")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "pms_resource_role.name=@role";
                cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = role;
                pC = " AND ";
            }
            cmd.CommandText += " ORDER BY " + sortExpr + " " + sortDirection + ";";


            try
            {
                con.Open();

                DataTable dt = new DataTable();
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                sqlDa.Fill(dt);

                if (Global.isDebug) Response.Write(cmd.CommandText);
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
        

        protected void submitButton_Click(object sender, EventArgs e)
        {
            ViewState["SortExpression"] = "[Last Name]";
            LoadGrid("[Last Name]", "ASC");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid(ViewState["SortExpression"].ToString(), ViewState["sortDirectionStr"].ToString());
        }
    }
}