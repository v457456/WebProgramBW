using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] == null || Convert.ToBoolean(Session["Authenticated"]) == false)
            {
                Global.Application_AccessDenied(sender, e);
            }
        }

        protected int getUserTypeAdmin()
        {
            return Global.AdminUserType;
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Contents.RemoveAll();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
        }
    }
}