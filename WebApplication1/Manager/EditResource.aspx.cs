using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Manager
{
    public partial class EditResource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserType"] == null || (Convert.ToInt32(Session["UserType"]) != Global.ManagerUserType && Convert.ToInt32(Session["UserType"]) != Global.AdminUserType)) //manager & admin
            {
                Global.Application_AccessDenied(sender, e);
            }
            else
            {
                SqlDataSource1.ConnectionString = Global.getConnectionString();
            }



        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
        }
    }
}