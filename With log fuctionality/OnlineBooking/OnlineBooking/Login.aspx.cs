using CMRS.CodeFiles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("Login.aspx"); // Redirect to the main page if the user is already authenticated.
            }

            if (Session["User_ID"] != null)
            {
                // Clear the session variable to log the user out
                Session.Remove("User_ID");

            }
        
        }

        //User authication method start here
        public void getUser()
        {
            string user_name = txt_username.Text;        
            try
            {

                OB_entities db = new OB_entities();
                var val = (from i in db.users where i.username == user_name select i).FirstOrDefault();
                if (val != null)
                {
                    if (val.username == user_name)
                    {
                       // string pass = BCrypt.Net.BCrypt.HashPassword(txt_password.Text);
                        bool isPasswordCorrect = BCrypt.Net.BCrypt.Verify(txt_password.Text, val.password);

                        if (isPasswordCorrect)
                        {
                            Session["User_ID"] = val.user_id;
                          //  Logger.LogInformation("\nActivity: "+"User Id "+ val.user_id+ "  logged in to application\n");
                            Response.Redirect("/pages/Index.aspx");
                        }
                        else
                        {
                            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                            //$"showErrorModal('{"you entered the wrong password."}')", true);

                            //string message = "You entered the wrong password!";
                            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');", true);
                          //  Logger.LogError("\nActivity: " + "User Id " + val.user_id + "  Entered wrong password\n");
                            string message = "You entered the wrong password!";
                            string script = "window.onload = function() { alert('" + message + "'); };";
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                            return;
                        }
                    }
                }
                else
                {
                    
                   
                    string message = "User not found!";
                    string script = "window.onload = function() { alert('" + message + "'); };";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                    return;
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    string message = ex.InnerException.InnerException.Message;
                    string script = "window.onload = function() { alert('" + message + "'); };";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                }
                catch (Exception)
                {
                    try
                    {
                        string message = ex.InnerException.Message;
                        string script = "window.onload = function() { alert('" + message + "'); };";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                    }
                    catch (Exception)
                    {
                        string message = ex.Message;
                        string script = "window.onload = function() { alert('" + message + "'); };";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", script, true);
                    }
                }
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            getUser();
        }
    
    }
}