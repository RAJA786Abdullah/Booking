using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (Session["User_ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                int id = Convert.ToInt32(Session["User_ID"]);
                OB_entities db = new OB_entities();

                var val = (from i in db.users where i.user_id == id select i).FirstOrDefault();
                if (val != null)
                {
                    lbl_user_name.Text = val.Emp_Name;
                }
            }
        }
    }
}