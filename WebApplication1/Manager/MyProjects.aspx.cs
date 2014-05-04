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
    public partial class MyProjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else if (!IsPostBack)
            {
                LoadGrid("ID", "ASC");
                
            }
        }

        private void LoadGrid(string sortExpr, string sortDirection) {
            ViewState["sortDirectionStr"] = sortDirection;
            ViewState["SortExpression"] = sortExpr;
            SqlConnection con = new SqlConnection(Global.getConnectionString());

            SqlCommand cmd = new SqlCommand("SELECT pms_project.id AS ID, pms_project.name AS Name, pms_project.start_date AS [Start Date], pms_project.end_date AS [End Date], pms_customer.name AS Customer, pms_industry.name AS Industry, pms_user.username AS Manager FROM pms_project INNER JOIN pms_customer ON pms_customer.id = pms_project.customer_id INNER JOIN pms_industry ON pms_industry.id = pms_project.industry_id INNER JOIN pms_user ON pms_user.id = pms_project.manager_id", con);
            if (Global.isAdmin()) //manager column hidden if manager, visible if admin
            {
                cmd.CommandText += " ORDER BY " + sortExpr + " " + sortDirection + ";";
                GridView1.Columns[6].Visible = true;
            }
            else 
            {
                GridView1.Columns[6].Visible = false;
                cmd.CommandText += " WHERE pms_project.manager_id = @userid ORDER BY " + sortExpr + " " + sortDirection + ";";
                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = Convert.ToInt32(Session["UserID"]);
            }

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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("ProjectSelection"))
            {
                GridViewRow selectedRow = GridView1.Rows[Convert.ToInt32(e.CommandArgument)];
                Response.Redirect("~/Manager/EditProject.aspx?ProjectID=" + selectedRow.Cells[0].Text.ToString());
            }
        }
    }
}