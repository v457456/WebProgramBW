using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SearchUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || Convert.ToInt32(Session["UserType"]) != Global.AdminUserType) //admin
            {
                Response.Clear();
                Response.Write("Access Denied!");
                Response.StatusCode = 401;
                Response.End();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataProjectsResources_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}