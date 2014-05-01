using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class EditProject : System.Web.UI.Page
    {

        private string origManagerID, origProjectID, origProjectName, origCustomerID, origIndustryID, origStartDate, origEndDate, origStartDateFlex, origEndDateFlex, origProjectStage; //set original fields for later checking & logging
        private bool origStageOverride;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else if (!IsPostBack)
            {
                if (Request.QueryString["ProjectID"] != null)
                {
                    LoadGrid("[Name]", "ASC");
                }
                else
                {
                    fieldsActive(false);
                }
                fillProjectsDropDown();
            }
        }

        private void LoadProjectAttributes(int projID)
        {
            if (Global.isDebug) Response.Write("Inside of LoadProjectAttributes Successfully!<br/>");
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            DataSet customers = new DataSet(), industries = new DataSet(), projData = new DataSet(), managers = new DataSet();

            SqlDataAdapter adptCustomers = new SqlDataAdapter("SELECT id, name FROM pms_customer;", con),
                adptIndustries = new SqlDataAdapter("SELECT id, name FROM pms_industry;", con),
                adptUsers = new SqlDataAdapter("SELECT id, first_name + ' ' + last_name + '(ID ' + CAST(id AS VARCHAR(12)) + ': ' + username + ')' AS name FROM pms_user;", con);
            adptCustomers.Fill(customers);
            adptIndustries.Fill(industries);
            adptUsers.Fill(managers);

            //TODO: Create a field for Admin's to change the manager on a project


            // fill dropdownlist for customers
            DropDownList4.DataSource = customers;
            DropDownList4.DataTextField = "name";
            DropDownList4.DataValueField = "id";
            DropDownList4.DataBind();

            // fill dropdownlist for industries
            DropDownList5.DataSource = industries;
            DropDownList5.DataTextField = "name";
            DropDownList5.DataValueField = "id";
            DropDownList5.DataBind();

            // fill manager dropdown list for admins
            if (Global.isAdmin())
            {
                DropDownList8.DataSource = managers;
                DropDownList8.DataTextField = "name";
                DropDownList8.DataValueField = "id";
                DropDownList8.DataBind();
            }

            // grab data from DB and fill input fields on form
            SqlDataAdapter adptProjectData = new SqlDataAdapter("SELECT id, name, start_date, end_date, start_date_flex, end_date_flex, current_stage_override, customer_id, industry_id, manager_id FROM pms_project WHERE id = @projid;", con); // join users, grab pms_user.username for manager's username
            adptProjectData.SelectCommand.Parameters.Add("@projid", SqlDbType.Int).Value = projID;
            adptProjectData.Fill(projData);

            DataRow result = projData.Tables[0].Rows[0];
            Projectname.Value = result["name"].ToString();
            DropDownList4.Items.FindByValue(result["customer_id"].ToString()).Selected = true;
            DropDownList5.Items.FindByValue(result["industry_id"].ToString()).Selected = true;
            //DateTime parsedDate;
            //DateTime.TryParse(result["start_date"].ToString(), null, System.Globalization.DateTimeStyles.None, out parsedDate);
            //Text1.Value = parsedDate.ToString("MM/dd/yyyy");

            Text1.Value = DateTime.Parse(result["start_date"].ToString(), null, System.Globalization.DateTimeStyles.None).ToString("MM/dd/yyyy");
            Text5.Value = DateTime.Parse(result["end_date"].ToString(), null, System.Globalization.DateTimeStyles.None).ToString("MM/dd/yyyy");
            Text3.Value = result["start_date_flex"].ToString();
            Text4.Value = result["end_date_flex"].ToString();
            //set Project Stage
            if (result["current_stage_override"] != DBNull.Value)
            {
                DropDownList9.SelectedValue = result["current_stage_override"].ToString();
                DropDownList9.Enabled = true;
                check_StageOverride.Checked = true;
                origStageOverride = true;
            }
            else
            {
                origStageOverride = false;
            }
            
            // set original data for later logging
            origManagerID = result["manager_id"].ToString();
            // origManagerNa
            origProjectID = projID.ToString();
            origProjectName = Projectname.Value;
            origCustomerID = DropDownList4.SelectedValue;
            origIndustryID = DropDownList5.SelectedValue;
            origStartDate = Text1.Value;
            origEndDate = Text5.Value;
            origStartDateFlex = Text3.Value;
            origEndDateFlex = Text4.Value;
            origProjectStage = DropDownList9.SelectedValue;
         

            //enable fields for editing
            fieldsActive(true);
        }

        private void fillProjectsDropDown()
        {
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            DataSet myProjects = new DataSet();
            if (Session["UserID"] != null)
            {
                SqlDataAdapter adptProjs;
                if (Global.isAdmin())
                    adptProjs = new SqlDataAdapter("SELECT pms_project.id as [ID], pms_project.name + ' (ID: ' + CAST(pms_project.id AS VARCHAR(12)) + ')' AS [NameAndID] FROM pms_project ORDER BY [NameAndID] ASC;", con);
                else
                    adptProjs = new SqlDataAdapter("SELECT pms_project.id as [ID], pms_project.name + ' (ID: ' + CAST(pms_project.id AS VARCHAR(12)) + ')' AS [NameAndID] FROM pms_project WHERE pms_project.manager_id = " + Session["UserID"].ToString() + " ORDER BY [NameAndID] ASC;", con);

                adptProjs.Fill(myProjects);

                DropDownList3.DataSource = myProjects;
                DropDownList3.DataTextField = "NameAndID";
                DropDownList3.DataValueField = "ID";
                DropDownList3.DataBind();
                DropDownList3.Items.Insert(0, new ListItem("Select a Project", "0"));
            }

            if (Request.QueryString["ProjectID"] != null)
            {
                string projID = Request.QueryString["ProjectID"];
                DropDownList3.Items.FindByValue(projID).Selected = true;
            }

        }

        private void fieldsActive(bool active)
        {
                Projectname.Disabled = !active;
                DropDownList4.Enabled = active;
                DropDownList5.Enabled = active;
                Text1.Disabled = !active;
                Text3.Disabled = !active;
                Text4.Disabled = !active;
                Text5.Disabled = !active;
                EditResourcesButton.Enabled = active;
                UpdateButton.Enabled = active;


            /*
                Checkbox1.Disabled = !active;
                Checkbox2.Disabled = !active;
                Checkbox3.Disabled = !active;
                Checkbox4.Disabled = !active;
                Checkbox5.Disabled = !active;
                Checkbox6.Disabled = !active;
                Checkbox7.Disabled = !active;
                Checkbox1.Checked = !active;
                Checkbox2.Checked = !active;
                Checkbox3.Checked = !active;
                Checkbox4.Checked = !active;
                Checkbox5.Checked = !active;
                Checkbox6.Checked = !active;
                Checkbox7.Checked = !active;
            */


        }

        private bool verifyCurrentUserProject(int projID)
        {
            if (Session["UserType"] != null && Convert.ToInt32(Session["UserType"]) == Global.AdminUserType) {
                return true;
            }

            if (Session["UserID"] != null)
            {
                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("SELECT manager_id FROM pms_project WHERE pms_project.id = @projid;", con);
                cmd.Parameters.Add("@projid", SqlDbType.Int).Value = projID;
                try
                {
                    con.Open();
                    int managerID = (int) cmd.ExecuteScalar();
                    if (managerID == Convert.ToInt32(Session["UserID"])) {
                        return true;
                    }
                
                } catch (Exception ex) {
                    //throw (ex);
                    return false;
                } finally {
                    con.Close();
                }
            }
            return false;
        }
        private void LoadGrid(string sortExpr, string sortDirection)
        {
            ViewState["sortDirectionStr"] = sortDirection;
            if (Request.QueryString["ProjectID"] != null)
            {
                //dont forget to check if userid == managerid
                int projectID = Convert.ToInt32(Request.QueryString["ProjectID"]);
                if (verifyCurrentUserProject(projectID))
                {
                    if (Global.isDebug) Response.Write("Verified Project ID!<br/>");
                    LoadProjectAttributes(projectID); 
                    SqlConnection con = new SqlConnection(Global.getConnectionString());
                    SqlCommand cmd = new SqlCommand("SELECT pms_resource.experience_level as [Experience_Level], pms_resource_role.name AS [Role], pms_resource.last_name + ', ' + pms_resource.first_name AS [Name], pms_resource.email_address AS [Email_Address] FROM pms_resourceproject INNER JOIN pms_resource ON pms_resource.id = pms_resourceproject.resource_id INNER JOIN pms_resource_role ON pms_resource_role.id = pms_resource.role_id WHERE pms_resourceproject.project_id = @projid ORDER BY " + sortExpr + " " + sortDirection + ";", con);
                    cmd.Parameters.Add("@projid", SqlDbType.Int).Value = projectID;
                    try
                    {
                        con.Open();
                        SqlDataAdapter DA = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        DA.Fill(ds);
                        if (ds != null)
                        {
                            GridView1.DataSource = ds.Tables[0];
                            GridView1.DataBind();
                        }

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
                }
                else
                {
                    Response.Redirect("~/Manager/MyProjects.aspx");
                }
            }
            else
            {
                fieldsActive(false);
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


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid(ViewState["SortExpression"].ToString(), ViewState["sortDirectionStr"].ToString());
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            int projectID;

            projectID = Convert.ToInt32(DropDownList3.SelectedValue);
            if (projectID <= 0)
                Response.Redirect("EditProject.aspx");
            else
                Response.Redirect("EditProject.aspx?ProjectID=" + projectID);
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string currentProjectID = Request.QueryString["ProjectID"].ToString();
            if (currentProjectID.Equals(origProjectID)) // check to make sure project id loaded and project id to save to wasn't altered somehow.
            {
                //TODO: create method to update database record.
                logChanges();
            }
        }

        private void logChanges()
        {
            string currentProjectName = Projectname.Value,
                currentCustomerID = DropDownList4.SelectedValue,
                currentIndustryID = DropDownList5.SelectedValue,
                currentStartDate = Text1.Value,
                // currentManager = something.Value,
                currentEndDate = Text5.Value;

            if (!currentProjectName.Equals(origProjectName))
            {
                //TODO: log project name change
            }

            if (!currentCustomerID.Equals(origCustomerID))
            {
                //TODO: log customer change
            }

            if (!currentIndustryID.Equals(origIndustryID))
            {
                //TODO: log industry change
            }

            if (!currentStartDate.Equals(origStartDate))
            {
                //TODO: log start date change
            }

            if (!currentEndDate.Equals(origEndDate))
            {
                //TODO: log end date change
            }

        }

        protected void EditResourcesButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Manager/EditProjectResources.aspx?ProjectID=" + Request.QueryString["ProjectID"]);
        }
    }
}