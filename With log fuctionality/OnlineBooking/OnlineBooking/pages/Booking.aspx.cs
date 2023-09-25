using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class Booking : System.Web.UI.Page
    {



        string dayName = "";
        private void Loaddate()
        {
            try
            {
                dd_calender.Value = DateTime.Now.ToShortDateString();


            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    lbl_error.Text = ex.InnerException.InnerException.Message;
                }
                catch (Exception)
                {
                    try
                    {
                        lbl_error.Text = ex.InnerException.Message;
                    }
                    catch (Exception)
                    {
                        lbl_error.Text = ex.Message;
                    }
                }
            }
        }
        //private void Loadvenue()
        //{
        //    try
        //    {
        //        using (var scope = new TransactionScope())
        //        {
        //            // Create a new instance of your Entity Framework context
        //            using (OB_entities db = new OB_entities())
        //            {
        //                // Use LINQ query to retrieve data from the "booking_schedule" table
        //                var data = from c in db.vanues
        //                           where c.vanue_status == true
        //                           select new
        //                           {
        //                               c.vanue_id,
        //                               c.vanue_title,
        //                           };

        //                // Bind data to the DropDownList
        //                dd_venue.DataTextField = "vanue_title";    // Property name for the text to display
        //                dd_venue.DataValueField = "vanue_id"; // Property name for the value of the items
        //                dd_venue.DataSource = data.ToList(); // Set the data source
        //                dd_venue.DataBind();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle any exceptions if needed
        //        try
        //        {
        //            lbl_error.Text = ex.InnerException.InnerException.Message;
        //        }
        //        catch (Exception)
        //        {
        //            try
        //            {
        //                lbl_error.Text = ex.InnerException.Message;
        //            }
        //            catch (Exception)
        //            {
        //                lbl_error.Text = ex.Message;
        //            }
        //        }
        //    }
        //}
        //private void Loadbooking()
        //{
        //    try
        //    {
        //        using (var scope = new TransactionScope())
        //        {
        //            // Create a new instance of your Entity Framework context
        //            using (OB_entities db = new OB_entities())
        //            {
        //                // Use LINQ query to retrieve data from the "booking_schedule" table
        //                var data = from c in db.booking_type
        //                           where c.booking_type_status == true
        //                           select new
        //                           {
        //                               c.booking_type_id,
        //                               c.booking_type1,
        //                           };

        //                // Bind data to the DropDownList
        //                dd_booking.DataTextField = "booking_type1";    // Property name for the text to display
        //                dd_booking.DataValueField = "booking_type_id"; // Property name for the value of the items
        //                dd_booking.DataSource = data.ToList(); // Set the data source
        //                dd_booking.DataBind();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle any exceptions if needed
        //        try
        //        {
        //            lbl_error.Text = ex.InnerException.InnerException.Message;
        //        }
        //        catch (Exception)
        //        {
        //            try
        //            {
        //                lbl_error.Text = ex.InnerException.Message;
        //            }
        //            catch (Exception)
        //            {
        //                lbl_error.Text = ex.Message;
        //            }
        //        }
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["VANUE"] = null;
                Session["BTYPE"] = null;
                Session["Days"] = null;

            }

            Loaddate();
            //Session["VANUE"] = Convert.ToInt32(dd_venue.SelectedValue);
            //Session["BTYPE"] = Convert.ToInt32(dd_booking.SelectedValue);

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            Insertcustomer();
        }


     

        private void FRESH()
        {
            //   dd_venue.Text = "";

        }

    
        //private int duplicate()
        // {
        //     try
        //     {
        //         string booktype = dd_booking.Text;
        //         OB_entities db = new OB_entities();
        //         var existingbook = db.booking_type.FirstOrDefault(v => v.booking_type1 == booktype);
        //         if (existingbook != null)
        //         {
        //             // Show alert for duplicate record
        //             string script = "alert('A record already exists!');";
        //             ScriptManager.RegisterStartupScript(this, GetType(), "DuplicateRecordAlert", script, true);

        //             // Set the error message to display on the page
        //             lbl_error.Text = "A record already exists!";
        //             return 1;
        //         }
        //         else
        //         {
        //             return 2;
        //         }

        //     }
        //     catch (Exception ex)
        //     {
        //         // Handle any exceptions if necessary
        //         try
        //         {
        //             lbl_error.Text = ex.InnerException.InnerException.Message;
        //         }
        //         catch (Exception)
        //         {
        //             try
        //             {
        //                 lbl_error.Text = ex.InnerException.Message;
        //             }
        //             catch (Exception)
        //             {
        //                 lbl_error.Text = ex.Message;
        //             }
        //         }
        //     }
        //     return -1;
        // }


        private void Insertcustomer()
        {
            try
            {

                int bok_id = 0;
                using (var scope = new TransactionScope())
                {
                    using (OB_entities db = new OB_entities())
                    {
                        customer tbl = new customer()
                        {
                            cnic = txt_cnic.Value,
                            mobile_no = txt_phone.Value,
                            name = txt_name.Value
                            //  add = txt_address

                        };
                        db.customers.Add(tbl);
                        db.SaveChanges();
                        int customerID = tbl.customer_id;

                        customer_booking ctbl = new customer_booking();
                        ctbl.schedule_id = Convert.ToInt32(dtp_charges.SelectedValue);
                        ctbl.time_slot_id = Convert.ToInt32(dtp_booking_time.SelectedValue);

                        ctbl.Booking_no = 10;
                        ctbl.customer_id = customerID;
                        ctbl.is_paid = false;
                        ctbl.is_reservation = true;
                        ctbl.is_confirmed = false;
                        ctbl.total_amount = Convert.ToDecimal(dtp_charges.SelectedItem.Text);
                        ctbl.created_date = DateTime.Now;

                        db.customer_booking.Add(ctbl);
                        db.SaveChanges();
                        bok_id = ctbl.customer_booking_id;
                    }

                    scope.Complete();
                    Session["BOK_ID"] = bok_id.ToString();
                    
                    Response.Redirect("/pages/Reporting/frm_voucher.aspx");

                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    lbl_error.Text = ex.InnerException.InnerException.Message;
                }
                catch (Exception)
                {
                    try
                    {
                        lbl_error.Text = ex.InnerException.Message;
                    }
                    catch (Exception)
                    {
                        lbl_error.Text = ex.Message;
                    }
                }
            }
        }



   


        protected void btn_Serch_Click(object sender, EventArgs e)
        {
            Session["VANUE"] = Convert.ToInt32(dd_venue.SelectedValue);
            Session["type_id"] = Convert.ToInt32(dd_booking.SelectedValue);
            Session["Days_id"] = dayName = hiddenDayName.Value;
            string sessionValue = Session["Days_id"].ToString();
            ObjectDataSource3.SelectParameters["id"].DefaultValue = sessionValue;
            // Rebind the DropDownList
            dtp_booking_time.DataBind();
            //Bind();
            string sessionValuebkCH = Session["type_id"].ToString();
            ObjectDataSource4.SelectParameters["id"].DefaultValue = sessionValuebkCH;
            ObjectDataSource4.SelectParameters["id2"].DefaultValue = sessionValue;

            // Rebind the DropDownList
            dtp_charges.DataBind();
        }


    }
}











