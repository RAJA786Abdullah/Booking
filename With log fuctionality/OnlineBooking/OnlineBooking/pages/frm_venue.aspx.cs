using CMRS.CodeFiles;
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
    public partial class frm_venue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            //if (!IsPostBack)
            //{
            //    Session["VANUEID"] = null;

            //}
            //BindVenueData();
        }

        // Insert Vanue code start here
        private void InsertVan()
        {
            try
            {


                // Save the data to the database
               
                    using (OB_entities db = new OB_entities())
                    {
                        vanue tbl = new vanue()
                        {
                            vanue_title = txt_venue.Text.Trim().ToUpper(),
                            vanue_status = chk_vanue.Checked
                        };
                        db.vanues.Add(tbl);
                        db.SaveChanges();
                       
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                             $"showErrorModal('{"Vanue saved successfully!"}')", true);
                            //BindVenueData();
                        
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
        // Insert Vanue code end here


        // Update Vanue code start here
        private void UpdateVan()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    lbl_error.Text = string.Empty;
                    int id = Convert.ToInt32(Session["VANUEID"]);

                    OB_entities db = new OB_entities();
                    var val = (from i in db.vanues where i.vanue_id == id select i).FirstOrDefault();
                    if (val != null)
                    {
                        val.vanue_title = txt_venue.Text;


                        if (chk_vanue.Checked == true)
                        {
                            val.vanue_status = true;
                        }
                        else
                        {
                            val.vanue_status = false;
                        }
                        if (db.SaveChanges() > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                                $"showErrorModal('{"Vanue updated successfully!"}')", true);
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
        // Update Vanue code end here


        // Duplicate Vanue code start here
        private int duplicate()
        {
            try
            {

                int VANUEID = Convert.ToInt32(Session["VANUEID"]);
                string vanuetitle = txt_venue.Text.ToUpper();
                OB_entities db = new OB_entities();

                var existingvan = db.vanues.FirstOrDefault(v => v.vanue_title == vanuetitle && v.vanue_id != VANUEID);
                if (existingvan != null)
                {
                    return 1;
                }
                else
                {
                    return 2;
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





        // fresh Vanue code start here
        private void FRESH()
        {
            txt_venue.Text = string.Empty;
            chk_vanue.Checked = false;
            Session["VANUEID"] = null;
        }


        // Button Save Vanue code start here
        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txt_venue.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"Please provide vanue title!"}')", true);
                }

                string pattern = "^[a-zA-Z0-9 ]*$";
                if (!Regex.IsMatch(txt_venue.Text, pattern))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"special characters  are not  allowed!"}')", true);

                    return;
                }
                else
                {
                    lbl_error.Text = string.Empty;
                    if (duplicate() == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                            $"showErrorModal('{"This Vanue title already exists!"}')", true);
                        return;
                    }
                    if (duplicate() == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                          $"showErrorModal('{"This Vanue title already exists!"}')", true);
                        return;
                    }
                    else
                    {

                        if (Session["VANUEID"] == null)
                        {
                            InsertVan();
                        }
                        else
                        {
                            UpdateVan();
                        }
                        grd_venue.DataBind();
                        FRESH();
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
        }

        protected void grd_venue_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                OB_entities db = new OB_entities();
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                int vanue_id = Convert.ToInt32(grd_venue.DataKeys[rowIndex]["vanue_id"]);
                Session["VANUEID"] = vanue_id;
                var val = (from i in db.vanues where i.vanue_id == vanue_id select i).FirstOrDefault();
                if (val != null)
                {

                    txt_venue.Text = (val.vanue_title).ToString();

                    if (val.vanue_status == true)
                    {
                        chk_vanue.Checked = true;
                    }
                    else
                    {
                        chk_vanue.Checked = false;
                    }

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



    }
}