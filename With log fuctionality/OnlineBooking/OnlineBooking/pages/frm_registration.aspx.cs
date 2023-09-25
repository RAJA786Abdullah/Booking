using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;


namespace OnlineBooking.pages
{
    public partial class frm_registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected bool IsUserDuplicate()
        {
            string uname = txt_username.Text;
            int uroleid = Convert.ToInt32(dd_userrole.SelectedValue);
            int udtid = Convert.ToInt32(dd_directorate.SelectedValue);
            OB_entities db = new OB_entities();

            // Check if a user with the specified criteria exists

            // If val is not null, a duplicate user was found
            var val = db.users.FirstOrDefault(i => i.dte_id == udtid && i.role_id == uroleid && i.username == uname);

            // If val is not null, a duplicate user was found
            return val != null;
        }
        protected void registerUser()
        {
            try
            {
                if (txt_password.Text == txt_confirmpassword.Text)
                {


                    OB_entities db = new OB_entities();
                    user tbl = new user();
                    tbl.role_id = Convert.ToInt32(dd_userrole.SelectedValue);
                    tbl.dte_id = Convert.ToInt32(dd_directorate.SelectedValue);
                    tbl.username = txt_username.Text;
                    tbl.password =  BCrypt.Net.BCrypt.HashPassword(txt_password.Text);
                    tbl.Emp_Name = txt_name.Text;
                    tbl.email = txt_email.Text;
                    tbl.DHA_No = txt_dhano.Text;
                    tbl.record_status = chk_status.Checked;
                    tbl.created_date = DateTime.Now;
                    db.users.Add(tbl);
                    db.SaveChanges();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"Password and confirm password must be same!"}')", true);
                    return;
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

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            if (!IsUserDuplicate()) // Check for non-duplicate user
            {
                registerUser();
                Response.Write("<script>alert('User registered successfully.');</script>");
              //  lblalert.Text = "User registered successfully.";
               // lblalert.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('User is registered.');</script>");
               // lblalert.Text = "User is already registered.";
                //lblalert.Visible = true;
            }

        }
    }
}