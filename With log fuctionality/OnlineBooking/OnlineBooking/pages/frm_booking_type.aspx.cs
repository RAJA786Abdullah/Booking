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
    public partial class frm_booking_type : System.Web.UI.Page
    {
        //form load page
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../frm_login.aspx");
            }
            //if (!IsPostBack)
            //{
            //    Session["bookingID"] = null;

            //}
            ////BindbookingData();
        }


        //Insert method start here
        private void Insertbooking()
        {
            try
            {
                // Perform server-side validation

                if (string.IsNullOrEmpty(txt_booking.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                                $"showErrorModal('{"Enter booking type!"}')", true);
                }

                else
                {
                    using (OB_entities db = new OB_entities())
                    {
                        booking_type tbl = new booking_type()
                        {
                            booking_type1 = txt_booking.Text.Trim().ToUpper(),
                            vanue_id = Convert.ToInt32(dd_venue.SelectedValue),
                            booking_type_status = chk_booking.Checked
                        };
                        db.booking_type.Add(tbl);
                        db.SaveChanges();





                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                           $"showErrorModal('{"Booking type Saved successfully!"}')", true);
                        //BindbookingData();

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
        //Insert method end here

        //Update method start here
        private void Updatebooking()
        {
            try
            {

            
                  
                    int id = Convert.ToInt32(Session["bookingID"]);

                    OB_entities db = new OB_entities();
                    var val = (from i in db.booking_type where i.booking_type_id == id select i).FirstOrDefault();
                    if (val != null)
                    {
                        // Update booking_type1 and booking_type_status
                        val.booking_type1 = txt_booking.Text.Trim().ToUpper();
                        val.vanue_id = Convert.ToInt32(dd_venue.SelectedValue);
                        val.booking_type_status = chk_booking.Checked;
                        db.SaveChanges();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                            $"showErrorModal('{"This booking type updated successfully!"}')", true);
                   

                   
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
        //Update method end here

        //Duplicate method start here
        private int duplicate()
        {
            try
            {

                int bookingID = Convert.ToInt32(Session["bookingID"]);
                int venue_id = Convert.ToInt32(dd_venue.SelectedValue);
                string booktype = txt_booking.Text.ToUpper();
                OB_entities db = new OB_entities();

                var existingbook = db.booking_type.FirstOrDefault(v => v.booking_type1 == booktype && v.vanue_id == venue_id && v.booking_type_id != bookingID);
                if (existingbook != null)
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
        //Duplicate method end here


        //Fresh method start here
        private void FRESH()
        {
            txt_booking.Text = string.Empty;
            chk_booking.Checked = false;
            Session["bookingID"] = null;
        }

        //Save Button method start here
        protected void Btn_save_Click(object sender, EventArgs e)
        {
            try
            {

                if (string.IsNullOrWhiteSpace(txt_booking.Text))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"Please provide shift title!"}')", true);
                    return;

                }
                string pattern = "^[a-zA-Z0-9 ]*$";
                if (!Regex.IsMatch(txt_booking.Text, pattern))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"special characters are not allowed!"}')", true);
                    return;
                }
                else
                {
                 
                    int DuplicateRecord = duplicate();
                    if (DuplicateRecord == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                                    $"showErrorModal('{"This booking type already exists!"}')", true);
                    }
                    if (DuplicateRecord == 3)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                           $"showErrorModal('{"Error in system plz Try Again.."}')", true);
                        return;
                    }
                    if (DuplicateRecord == 2)
                    {

                        // Add more validation checks here based on your requirements.

                        if (Session["bookingID"] == null)
                        {
                            Insertbooking();
                        }
                        else
                        {
                            Updatebooking();
                        }
                        //call method
                        //BindbookingData();
                        grd_booking_type.DataBind();
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
        //Save Button method start here



        protected void grd_booking_type_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int booking_type_id = Convert.ToInt32(grd_booking_type.DataKeys[rowIndex]["booking_type_id"]);

                Session["bookingID"] = booking_type_id;
                OB_entities db = new OB_entities();
                var val = (from i in db.booking_type where i.booking_type_id == booking_type_id select i).FirstOrDefault();
                if (val != null)
                {
                    txt_booking.Text = val.booking_type1;
                    dd_venue.SelectedValue = val.vanue_id.ToString();
                    if (val.booking_type_status == true)
                    {
                        chk_booking.Checked = true;
                    }
                    else
                    {
                        chk_booking.Checked = false;
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
    }
}