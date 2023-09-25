using OnlineBooking.pages;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Globalization;

namespace OnlineBooking.pages
{

    public partial class frm_booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                dtp_date.SelectedDate = DateTime.Today;
                dd_venue.DataBind();
                dd_venue_SelectedIndexChanged1(sender, e);

            }
        }

        //Customer start code here
        protected void CustomerAdd()
        {
            try
            {
               



                OB_entities db = new OB_entities();

                using (var dbtasec = db.Database.BeginTransaction())
                {
                    try
                    {

                        customer tbl = new customer();
                        tbl.name = txt_customerName.Text;
                        tbl.cnic = txt_customerCnic.Text;
                        tbl.mobile_no = txt_customerContactno.Text;
                        tbl.created_date = DateTime.Now;
                        db.customers.Add(tbl);
                        db.SaveChanges();
                        int customerID = tbl.customer_id;
                        int rndNo = 0;


                        var mx = (from i in db.customer_booking orderby i.customer_booking_id descending select i).FirstOrDefault();
                        if (mx != null)
                        { rndNo = mx.Booking_no + 1; }
                        else
                        {
                            rndNo = 10001;
                        }
                        //customer booking 
                        customer_booking tbl1 = new customer_booking();
                        tbl1.customer_id = customerID;
                        tbl1.Booking_no = rndNo;
                        tbl1.schedule_id = Convert.ToInt32(Session["SHD_ID"]);
                        tbl1.is_reservation = true;
                        tbl1.is_paid = false;
                        tbl1.total_amount = Convert.ToDecimal(Session["CHRG_AMONT"]);
                        tbl1.is_confirmed = false;
                        tbl1.user_id = Convert.ToInt32(Session["User_ID"]);
                        tbl1.created_date = DateTime.Now;
                        db.customer_booking.Add(tbl1);
                        db.SaveChanges();
                        dbtasec.Commit();
                        Session["CBID"] = tbl1.customer_booking_id.ToString();

                      


                        FRESH();
                        string errorMessage = "Voucher generated successfully, please pay it to confirm your booking!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"alert('{errorMessage}'); window.location.href='/pages/frm_voucher.aspx';", true);

                        // Response.Redirect("/pages/frm_voucher.aspx");


                    }
                    catch (Exception ex)
                    {
                        dbtasec.Rollback();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message

                    string errorMessage = ex.InnerException.InnerException.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                }
                catch (Exception)
                {
                    try
                    {

                        string errorMessage = ex.InnerException.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                    catch (Exception)
                    {

                        string errorMessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                }
            }
        }
        private void FRESH()
        {
            grd_Booking.DataSource = null;
            grd_Booking.DataBind();
            txt_customerCnic.Text = string.Empty;
            txt_customerContactno.Text = string.Empty;
            txt_customerName.Text = string.Empty;
            dtp_date.SelectedDate = DateTime.Today;
            Session["SHD_ID"] = null;
            Session["TSLOT_ID"] = null;
        }


        //Getting Day Id code end here 


        //Book now Button event code start here 
        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            try
            {
                if (dtp_date.SelectedDate < DateTime.Today)
                {
                    string errorMessage = "Booking cannot be made on a past date!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                }
                else
                {
                    Session["Book_Type"] = dd_booking.SelectedValue;
                    string dayOfWeek = dtp_date.SelectedDate.ToString("dddd");
                    OB_entities db = new OB_entities();
                    var val = (from i in db.week_days where i.day == dayOfWeek select i).FirstOrDefault();
                    if (val != null)
                    {
                        Session["DAYID"] = val.day_id;
                    }
                    Session["VenueID"] = dd_venue.SelectedValue;
                    Session["TEAM"] = dd_team.SelectedValue;
                    grd_Booking.DataBind();
                   
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message

                    string errorMessage = ex.InnerException.InnerException.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                }
                catch (Exception)
                {
                    try
                    {

                        string errorMessage = ex.InnerException.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                    catch (Exception)
                    {

                        string errorMessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                }
            }



        }
        //Book now buttom code end here 

        public decimal bk_charges = 0;
        //GridView Select Button event code start here 
        protected void grd_Booking_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Select")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);                 
                    if (grd_Booking.DataKeys.Count > rowIndex)
                    {

                        int scheduleId = Convert.ToInt32(grd_Booking.DataKeys[rowIndex]["schedule_id"]);   
                                                      
                        DateTime parsedDate = DateTime.ParseExact(DateTime.Now.ToString("yyyy-MM-dd"), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                        OB_entities db = new OB_entities();
                        var chk = (from i in db.customer_booking where i.schedule_id == scheduleId && i.created_date == parsedDate select i).FirstOrDefault();
                        if (chk != null)
                        {
                            string errorMessage = "This time slot is already booked!";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                            Session["SHD_ID"] = null;
                            return;
                        }
                        else
                        {
                            foreach (GridViewRow row in grd_Booking.Rows)
                            {
                                if (row.RowIndex == rowIndex)
                                {
                                    row.CssClass = "selected-row";
                                }
                                else
                                {
                                    row.CssClass = "normal-row";
                                }
                            }
                            var val = (from i in db.booking_schedule where i.schedule_id == scheduleId select i).FirstOrDefault();
                            if (val != null)
                            {
                                Session["CHRG_AMONT"] = Convert.ToDecimal( val.charges_amount);

                            }
                            //Session["CHRG_AMONT"] = chargesamount;
                            Session["SHD_ID"] = scheduleId;
                            rowIndex = 0;
                            scheduleId = 0;

                        }
                        // Now you can use the 'chargesAmount' variable for further processing
                    }
                    else
                    {
                        // Handle the case where the rowIndex is out of range
                        // You can add logging or display an error message here.
                    }
                }


                
    
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message

                    string errorMessage = ex.InnerException.InnerException.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                }
                catch (Exception)
                {
                    try
                    {

                        string errorMessage = ex.InnerException.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                    catch (Exception)
                    {

                        string errorMessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                }
            }
        }
        //GridView Select Button event code end here 


        //GridView Submit Button event code start here 
        protected void btn_customerSave_Click(object sender, EventArgs e)
        {
            if (Session["SHD_ID"] == null )
            {

                string errorMessage = "Select time slot to book!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                return;
            }
            else
            {

                CustomerAdd();
            }

        }
        //GridView Submint Button event code end here 

        //Dropdown Venue Selecting code start here 
        protected void dd_venue_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {

                Session["VANUEID"] = dd_venue.SelectedValue;
                dd_booking.DataBind();

            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message

                    string errorMessage = ex.InnerException.InnerException.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);
                }
                catch (Exception)
                {
                    try
                    {

                        string errorMessage = ex.InnerException.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                    catch (Exception)
                    {

                        string errorMessage = ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowErrorModal", $"openModal('{errorMessage}')", true);

                    }
                }
            }
        }


        protected void grd_Booking_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    // Find the index of the "is_reservation" column
            //    int isReservationIndex = -1;

            //    foreach (DataControlField field in grd_Booking.Columns)
            //    {
            //        if (field.HeaderText == "is_reservation")
            //        {
            //            isReservationIndex = grd_Booking.Columns.IndexOf(field);
            //            break;
            //        }
            //    }

            //    if (isReservationIndex != -1)
            //    {
            //        // Get the value of "is_reservation" for the current row
            //        string isReservationValue = e.Row.Cells[isReservationIndex].Text;

            //        // Set the enabled/disabled state of the "Select" button based on "is_reservation" value
            //        Button selectButton = (Button)e.Row.FindControl("Select"); // Replace with the actual ID of your "Select" button            
            //        if (!string.IsNullOrEmpty(isReservationValue))
            //        {                     
            //            selectButton.Visible = false; // Hide the button based on your conditionselectButton.Enabled = false; // Disable the button if is_reservation is not null
            //        }
            //        else
            //        {
            //            selectButton.Visible = true; // Show the button if the condition is not met
            //        }
            //    }
            //}

        }







    }
}