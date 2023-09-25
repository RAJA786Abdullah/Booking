using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class ConfirmBooking : System.Web.UI.Page
    {
        // load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            OB_entities db = new OB_entities();
            var val = (from i in db.customer_booking select i).ToList();
            if (val == null)
            {
                lblalert.Text = "Hello world";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"No record founded."}')", true);
            }
            else
            {
                getConfirmation();
            }
            
        }
        protected void getConfirmation()
        {
            try
            {
                OB_entities db = new OB_entities();
                var val = (from i in db.customer_booking select i).FirstOrDefault();
                bool chk = false;
                if (val != null)
                {
                    chk = val.is_confirmed;
                }
              
                if (chk == true)
                {
                    Session["confirmedStats"] = "true";
                    grd_confirm_booking.DataBind();
                    
                }
                else
                {
                    lblalert.Text = "Hello world";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"No record founded."}')", true);
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {


                    // Show the modal with the error message
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{ex.InnerException.InnerException.Message}')", true);

                }
                catch (Exception)
                {
                    try
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{ex.InnerException.Message}')", true);
                    }
                    catch (Exception)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{ex.Message}')", true);
                    }
                }
            }

        }
    }
}