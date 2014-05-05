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

                if (Request.QueryString["ProjectID"] == null)
                {
                    GridView1.Columns[8].Visible = false;
                }
                else
                {
                    GridView1.Columns[9].Visible = false;
                }
                //String temp;
                //foreach (DataRow row in roles.Rows) {
                //    temp = row["name"].ToString();
                //    row["name"] = char.ToUpper(temp[0]) + temp.Substring(1).ToLower();
                //}
                //foreach (DataRow row in industries.Rows) {
                //    temp = row["name"].ToString();
                //    row["name"] = char.ToUpper(temp[0]) + temp.Substring(1).ToLower();
                //}

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
                Text5.Value = 40.ToString();
            }
            else
            {
                
            }
            Text1.Focus();
        }
        public class project
        {
            public int id, managerid, sdf, edf, cso;
            DateTime sd, ed;
            public string name;
            public project(int id, string name, int managerid, DateTime sd, int sdf, DateTime ed, int edf)
            {
                this.id = id;
                this.name = name;
                this.managerid = managerid;
                this.sd = sd;
                this.sdf = sdf;
                this.ed = ed;
                this.edf = edf;
            }

            public int[] calctenthrule(string tenth, int hours) {
                int[] tenrules = new int[10];
                int tentotal = 0;
                int[] tenthrule = new int[10];
                for (int i = 0, j = 0; j < 10; i += 2, j++)
                {
                    tenrules[j] = Convert.ToInt32(tenth.Substring(i, 2));
                    tentotal += tenrules[j];
                }

                for (int i = 0; i < 10; i++) {
                    tenthrule[i] = (int)(((float)tenrules[i] / (float)tentotal) * hours);
                }
                return tenthrule;
            }

            public int getWeeksInOneTenth()
            {
                DateTime start = sd.AddDays(sdf * -7.0);
                DateTime end = ed.AddDays(edf * 7);

                int totalweeks = (int)(end - start).TotalDays / 7;
                return (totalweeks / 10);
            }
        }


        private project getCurrentProject(int curprojid)
        {
            project current = null;
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("SELECT id, name, manager_id, start_date, start_date_flex, end_date, end_date_flex, current_stage_override FROM pms_project WHERE id=@curprojid", con);
            cmd.Parameters.Add("@curprojid", SqlDbType.Int).Value = curprojid;
            try
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        current = new project(reader.GetInt32(0), reader.GetString(1), reader.GetInt32(2), reader.GetDateTime(3), reader.GetInt32(4), reader.GetDateTime(5), reader.GetInt32(6));
                    }
                }
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }

            return current;
        }

        private int[] getHrsWeeks()
        {
            project current = getCurrentProject(Convert.ToInt32(Request.QueryString["ProjectID"]));
            string tenthruleinput = "";
            Boolean go = false;
            if (tenthrulereadonly.Value == "??-??-??-??-??-??-??-??-??-??" && DropDownList1.SelectedIndex != 0)
            {
                SqlConnection con = new SqlConnection(Global.getConnectionString());
                SqlCommand cmd = new SqlCommand("SELECT default_tenth_rule FROM pms_resource_role WHERE name=@name", con);
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = DropDownList1.SelectedValue;
                try
                {
                    con.Open();
                    tenthruleinput = cmd.ExecuteScalar().ToString();
                    go = true;
                }
                catch
                {

                }
                finally
                {
                    con.Close();
                }

            }
            else if (tenthrulereadonly.Value != "??-??-??-??-??-??-??-??-??-??")
            {
                tenthruleinput = tenthrulereadonly.Value.ToString().Replace("-", "");
                go = true;
            }
            else
            {
                go = false;
            }
            int[] hrsweeks = new int[10];
            if (go)
            {
                int[] curten = current.calctenthrule(tenthruleinput, Convert.ToInt32(projecthours.Value));
                int weeksper = current.getWeeksInOneTenth();
                
                for (int i = 0; i < 10; i++)
                {
                    hrsweeks[i] = curten[i] / weeksper;
                }
            }
            return hrsweeks;
        }
        private void calcNumbersResources(DataTable dt, int[] hrsweeks)
        {
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            foreach (DataRow row in dt.Rows)
            {
                string resid = row["id"].ToString();

                SqlCommand cmd = new SqlCommand("SELECT pms_project.start_date AS [start], pms_project.start_date_flex AS [startf], pms_project.end_date AS [end], pms_project.end_date_flex AS [endf], pms_resource_role.default_tenth_rule AS [nooverride], pms_resource.work_hours AS [weeklyhours], pms_project.id AS [projid] FROM pms_resourceproject INNER JOIN pms_project ON pms_resourceproject.project_id = pms_project.id INNER JOIN pms_resource ON pms_resource.id = @resid INNER JOIN pms_resource_role ON pms_resource_role.id = pms_resource.role_id WHERE pms_resourceproject.resource_id=@resid;", con);
                cmd.Parameters.Add("@resid", SqlDbType.Int).Value = resid;
                try {
                    con.Open();
                    DataTable data = new DataTable();
                    SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                    sqlDa.Fill(data);
                    int rank = 0;
                    if (data.Rows.Count > 0)
                    {
                        int[] numofpeopleonproject = new int[data.Rows.Count];

                        int[] hourspertenth = new int[10];
                        Random rand2 = new Random();
                        for (int i = 0; i < 10; i++)
                        {
                            hourspertenth[i] = rand2.Next(5, 13) - Convert.ToInt32(data.Rows[0]["weeklyhours"]);
                        }
                        foreach (DataRow row2 in data.Rows)
                        {
                            
                            DateTime start = (DateTime)row2["start"];
                            start.AddDays(Convert.ToInt32(row2["startf"]) * -7);
                            DateTime end = (DateTime)row2["end"];
                            start.AddDays(Convert.ToInt32(row2["endf"]) * 7);
                            int totalweeks = (int)(end - start).TotalDays / 7;
                            string tenth = row2["nooverride"].ToString();
                            int[] tenrules = new int[10];
                            int tentotal = 0;
                            for (int i = 0, j = 0; j < 10; i += 2, j++)
                            {
                                tenrules[j] = Convert.ToInt32(tenth.Substring(i, 2));
                                tentotal += tenrules[j];
                            }
                            Random rand = new Random();
                            double totalhours = totalweeks * (2.0 + rand.NextDouble() * 7.0);
                            for (int i = 0; i < 10; i++)
                            {
                                hourspertenth[i] += (int)((tenrules[i] / tentotal) * totalhours);
                            }

                        }
                        for (int i = 0; i < 10; i++)
                        {
                            if (hourspertenth[i] < hrsweeks[i])
                            {
                                rank += Math.Abs(hrsweeks[i] - hourspertenth[i]);
                            }
                        }
                        rank -= (data.Rows.Count * rand2.Next(3, 5));
                    }
                    row["Rank"] = rank;
                }
                catch {
                    con.Close();
                }
                finally {
                    con.Close();
                }


            }
        }

        private void removeResourcesOnCurrentProject(DataTable dt) {
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            for (var i = dt.Rows.Count - 1; i >= 0; i-- )
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM pms_resourceproject WHERE resource_id=" + dt.Rows[i]["id"] + " AND project_id=@projid", con);
                cmd.Parameters.Add("@projid", con).Value = Request.QueryString["ProjectID"];
                try
                {
                    con.Open();
                    if (cmd.ExecuteScalar() != null)
                    {
                        dt.Rows[i].Delete();
                    }
                }
                catch { }
                finally { con.Close(); }
            }
            dt.AcceptChanges();

        }


        private void LoadGrid(string sortExpr, string sortDirection)
        {
            Boolean sortingbyID = false;
            if (sortExpr == "[id]") sortingbyID = true;
            ViewState["sortDirectionStr"] = sortDirection;
            int[] hrsweeks = new int[10];
            ViewState["SortExpression"] = sortExpr;
            if (Request.QueryString["ProjectID"] != null) {
                hrsweeks = getHrsWeeks();
            }
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("", con);
            String pC = " WHERE ";
            cmd.CommandText = "SELECT pms_resource.id, last_name + ', ' + first_name AS [Name], " +
                " email_address AS 'Email Address', experience_level AS 'Experience Level', " +
                " work_hours AS 'Work Hours', pms_industry.name AS 'Industry', pms_resource_role.name" +
                " AS 'Role' FROM pms_resource";
            cmd.CommandText += " INNER JOIN pms_resource_role ON pms_resource.role_id = pms_resource_role.id";
            cmd.CommandText += " INNER JOIN pms_industry ON pms_resource.industry_id = pms_industry.id";

            String firstname = Text1.Value;
            if (Global.isDebug) Response.Write(firstname);
            String lastname = Text2.Value;
            String email = Text3.Value;
            String expmeasure = DropDownList4.SelectedValue;
            int explevel = Convert.ToInt32(DropDownList6.SelectedValue);
            String workhoursmeasure = DropDownList5.SelectedValue;
            int workhourslevel = 40;
            if (Text5.Value != "")
                workhourslevel = Convert.ToInt32(Text5.Value);
            String industry = DropDownList2.SelectedValue;
            String role = DropDownList1.SelectedValue;

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
            if (industry != "Any")
            {
                cmd.CommandText += pC;
                cmd.CommandText += "pms_industry.name=@industry";
                cmd.Parameters.Add("@industry", SqlDbType.VarChar).Value = industry;
                pC = " AND ";
            }
            if (Global.isDebug) Response.Write("INDUSTRY: " + industry + "\n");
            if (Global.isDebug) Response.Write("ROLE: " + role + "\n");

            if (role != "Any")
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
                dt.Columns.Add("Rank", typeof(int));
                if (Request.QueryString["ProjectID"] != null)
                {
                    calcNumbersResources(dt, hrsweeks);
                }

                if (Global.isDebug) Response.Write(cmd.CommandText);
                if (sortingbyID) //default sort -- by rank
                {
                    dt.DefaultView.Sort = "Rank DESC";
                    dt = dt.DefaultView.ToTable();
                }
                if (Request.QueryString["ProjectID"] != null) {
                    removeResourcesOnCurrentProject(dt);
                }

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
            ViewState["SortExpression"] = "[id]";
            LoadGrid("[id]", "ASC");
            //ViewState["FirstName"] = Text1
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid(ViewState["SortExpression"].ToString(), ViewState["sortDirectionStr"].ToString());
        }

        protected void AddResToProj_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Global.getConnectionString());
            SqlCommand cmd = new SqlCommand("INSERT INTO pms_resourceproject (project_id, resource_id) VALUES ", con);
            string pc = "", seperator = ", ";
            bool addAtLeastOne = false;
            int count = 0;
            int projectID = Convert.ToInt32(Request.QueryString["ProjectID"]);
            string logAction = "Added resources to project: <br/>";

            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox c = (CheckBox)row.FindControl("AddSel");
                if (c != null && c.Checked)
                {
                    count++;
                    string loc = "resid" + count;
                    addAtLeastOne = true;
                    int resourceID = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                    logAction += "(ID: " + resourceID + ") " + row.Cells[1].Text + " <br/>";
                    cmd.CommandText += pc;
                    cmd.CommandText += "( " + projectID + ", " + resourceID + ")";
                    pc = seperator;
                }
            }

            if (addAtLeastOne)
            {
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
                finally
                {
                    con.Close();
                    cmd.Dispose();
                    Global.logEventProject(Convert.ToInt32(Session["UserID"]), logAction, projectID);
                }
            }
            LoadGrid("id", "ASC");
            //string redirstr = "~/Manager/SearchResource.aspx?ProjectID=" + projectID.ToString();
            //Response.Redirect(redirstr);
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGrid("id", "ASC");
        }

        protected void GridView1_RowUpdating(object sender, GridViewEditEventArgs e)
        {
            // Write here code for edit Rows 
        }
        
    }
}