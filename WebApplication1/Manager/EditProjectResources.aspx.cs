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
    public partial class EditProjectResources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else if (!IsPostBack)
            {
                LoadGrid("Name", "ASC");
                ViewState["SortExpression"] = "ID";
            }
        }

        private bool verifyCurrentUserProject(int projID)
        {
            if (Session["UserType"] != null && Convert.ToInt32(Session["UserType"]) == Global.AdminUserType)
            {
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
                    int managerID = (int)cmd.ExecuteScalar();
                    if (managerID == Convert.ToInt32(Session["UserID"]))
                    {
                        return true;
                    }

                }
                catch (Exception ex)
                {
                    //throw (ex);
                    return false;
                }
                finally
                {
                    con.Close();
                }
            }
            return false;
        }

        private void LoadGrid(string sortExpr, string sortDirection) {

            ViewState["sortDirectionStr"] = sortDirection;
            if (Request.QueryString["ProjectID"] != null)
            {
                //dont forget to check if userid == managerid
                int projectID = Convert.ToInt32(Request.QueryString["ProjectID"]);
                if (verifyCurrentUserProject(projectID))
                {
                    if (Global.isDebug) Response.Write("Verified Project ID!<br/>");
                    SqlConnection con = new SqlConnection(Global.getConnectionString());
                    SqlCommand cmd = new SqlCommand("SELECT pms_resource.experience_level as [Experience_Level], pms_resource_role.name AS [Role], pms_resource.last_name + ', ' + pms_resource.first_name AS [Name], pms_resource.email_address AS [Email_Address] FROM pms_resourceproject INNER JOIN pms_resource ON pms_resource.id = pms_resourceproject.resource_id INNER JOIN pms_resource_role ON pms_resource_role.id = pms_resource.role_id WHERE pms_resourceproject.project_id = @projid ORDER BY " + sortExpr + " " + sortDirection + ";", con);
                    cmd.Parameters.Add("@projid", SqlDbType.Int).Value = projectID; //todo:
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

        protected void RemoveSelectedButton_Click(object sender, EventArgs e)
        {

        }
    }
}