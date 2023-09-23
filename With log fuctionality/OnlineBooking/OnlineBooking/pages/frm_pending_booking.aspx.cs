using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class frm_pending_booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            getConfirmation();
            
        }
 
        protected void getConfirmation()
        {
            OB_entities db = new OB_entities();
            var val = (from i in db.customer_booking select i).FirstOrDefault();
            bool chk = true;
            if(val != null)
            {
                chk = val.is_confirmed;
            }
            
            if(chk == false)
            {
                Session["IsNotConfirmed"] = false;
                grd_pending_booking.DataBind();
            }
            else
            {
                
            }

        }
    }
}