using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages.Main_pages
{
    public partial class frm_paidmark : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../frm_login.aspx");
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
          
        }
    }
}