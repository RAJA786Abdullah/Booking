using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class frm_team_cat : System.Web.UI.Page
    {
        //page load form start here
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                Session["TEAMCAT"] = null;

            }

            grd_teamcat.DataBind();
            
        }
 
        private void Insertshift()
        {
            try
            {
                // Perform server-side validation
                string team = txt_teamcat.Value.Trim().ToUpper();
                if (string.IsNullOrWhiteSpace(team))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"Please provide team category!"}')", true);
                }

                // Additional validation checks can be added here

                // Save the data to the database
                using (var scope = new TransactionScope())
                {
                    using (OB_entities db = new OB_entities())
                    {
                        team_category tbl = new team_category()
                        {
                           team_title= team,
                            team_status = chk_teamcat.Checked
                        };
                        db.team_category.Add(tbl);
                        if (db.SaveChanges() > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"Team category added successfully!"}')", true);
                        }
                    
                    }
                    scope.Complete();
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
        //Shift Insert method end here

        //Shift Update method start here
        private void Updateshift()
        {
            try
            {
                // Perform validation checks
                string team = txt_teamcat.Value.Trim().ToUpper();
                if (string.IsNullOrWhiteSpace(team))
                {
                   
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                         $"showErrorModal('{"Please provide team category"}')", true);
                    
                }

                // Additional validation checks can be added here

                using (var scope = new TransactionScope())
                {
                   
                    int id = Convert.ToInt32(Session["TEAMCAT"]);

                    OB_entities db = new OB_entities();
                    var val = (from i in db.team_category where i.team_category_id == id select i).FirstOrDefault();
                    if (val != null)
                    {
                        // Update booking_type1 and booking_type_status
                        val.team_title = team;
                        val.team_status = chk_teamcat.Checked;
                        if (db.SaveChanges() > 0)
                        {                          
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                                $"showErrorModal('{"team category updated successfully!"}')", true);                            
                        }
                    }
                    scope.Complete();
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
        //Shift Update method end here

        //Shift Duplicate method start here
        private int duplicate()
        {
            try
            {
                bool status = false;
                if (chk_teamcat.Checked == true)
                {
                    status = true;
                }
                int shift_ID = Convert.ToInt32(Session["TEAMCAT"]);
                string team = txt_teamcat.Value.ToUpper();
                OB_entities db = new OB_entities();
                if (Session["TEAMCAT"] != null)
                {
                    var existingteam = db.team_category.FirstOrDefault(v => v.team_title == team && v.team_status == status);
                    if (existingteam != null)
                    {
                        return 1;
                    }
                    else
                    {
                        return 2;
                    }
                }
                else
                {
                    var existing = db.team_category.FirstOrDefault(v => v.team_title == team);
                    if (existing != null)
                    {                     
                            return 1;
                        }
                        else
                        {
                            return 2;
                        } 
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
            return -1;
        }
        //Shift Duplicate method end here

        //Shift Fresh method start here
        private void FRESH()
        {
            txt_teamcat.Value = "";
            chk_teamcat.Checked = false;
            Session["TEAMCAT"] = null;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {


                string pattern = "^[a-zA-Z0-9 ]*$";
                if (!Regex.IsMatch(txt_teamcat.Value, pattern))
                {

                    string script = "alert('special characters  are not  allowed.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidInputAlert", script, true);
                    return;
                }

              
                if (duplicate() == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                   $"showErrorModal('{"Record already exists with same team category!"}')", true);
                    return;
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(txt_teamcat.Value))
                    { 
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                         $"showErrorModal('{"Please enter team category!"}')", true);
                        return;
                    }

                    // Add more validation checks here based on your requirements.
                    if (Session["TEAMCAT"] == null)
                    {
                        Insertshift();
                    }
                    if (Session["TEAMCAT"] != null)
                    {
                        Updateshift();
                    }
                    
                }
                grd_teamcat.DataBind();
                FRESH();
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
        protected void grd_teamcat_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                Session["TEAMCAT"] = Convert.ToInt32(grd_teamcat.DataKeys[rowIndex]["team_category_id"]);
                int id = Convert.ToInt32(grd_teamcat.DataKeys[rowIndex]["team_category_id"]);
                OB_entities db = new OB_entities(); // 

                var vs = (from v in db.team_category where v.team_category_id == id select v).FirstOrDefault();
                if (vs != null)
                {
                    txt_teamcat.Value = vs.team_title;
                    chk_teamcat.Checked = Convert.ToBoolean(vs.team_status);
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