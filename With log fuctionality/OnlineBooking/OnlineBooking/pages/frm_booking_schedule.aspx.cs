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
    public partial class frm_booking_schedule : System.Web.UI.Page
    {

        private void AddSchedule()
        {
            using (OB_entities db = new OB_entities())
            {
                try
                {
                    using (var scope = new TransactionScope())
                    {
                        bool status = false;
                        if (chk_status.Checked == true)
                        {
                            status = true;
                        }

                        booking_schedule tbl = new booking_schedule();
                        tbl.policy_id = Convert.ToInt32(dd_policy.SelectedValue);
                        tbl.booking_type_id = Convert.ToInt32(dd_booking.SelectedValue);
                        tbl.shift_id = Convert.ToInt32(dd_shift.SelectedValue);
                        tbl.day_id = Convert.ToInt32(dd_week.SelectedValue);
                        tbl.charges_amount = Convert.ToDecimal(txt_charges.Value);
                        tbl.schedule_status = status;
                        tbl.user_id = Convert.ToInt32(Session["USERID"]);
                        tbl.created_date = Convert.ToDateTime(Session["DATE"]);
                        db.booking_schedule.Add(tbl);
                        db.SaveChanges();
                        scope.Complete();
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
        }
        private void LoadPolicy()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    // Create a new instance of your Entity Framework context
                    using (OB_entities db = new OB_entities())
                    {
                        // Use LINQ query to retrieve data from the "booking_schedule" table
                        var data = from c in db.policies
                                   where c.policy_status == true
                                   select new
                                   {
                                       c.policy_id,
                                       c.policy_title,

                                   };

                        // Bind data to the DropDownList shift_id shift_status
                        dd_policy.DataSource = data.ToList();
                        dd_policy.DataTextField = "policy_title"; // Display the shift_status column in the DropDownList
                        dd_policy.DataValueField = "policy_id"; // Use the shift_id column as the value for the DropDownList items
                        dd_policy.DataBind();
                    }
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
        private void LoadDays()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    // Create a new instance of your Entity Framework context
                    using (OB_entities db = new OB_entities())
                    {
                        // Use LINQ query to retrieve data from the "booking_schedule" table
                        var data = from c in db.week_days
                                   where c.day_status == true
                                   select new
                                   {
                                       c.day_id,
                                       c.day,
                                   };

                        // Bind data to the DropDownList
                        dd_week.DataSource = data.ToList();
                        dd_week.DataTextField = "day"; // Display the booking_type column in the DropDownList
                        dd_week.DataValueField = "day_id"; // Use the booking_type_id column as the value for the DropDownList items
                        dd_week.DataBind();
                    }
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
        private void LoadBooking()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    // Create a new instance of your Entity Framework context
                    using (OB_entities db = new OB_entities())
                    {
                        // Use LINQ query to retrieve data from the "booking_schedule" table
                        var data = from c in db.booking_type
                                   where c.booking_type_status == true
                                   select new
                                   {
                                       c.booking_type_id,
                                       c.booking_type1,
                                   };

                        // Bind data to the DropDownList
                        dd_booking.DataSource = data.ToList();
                        dd_booking.DataTextField = "booking_type1"; // Display the booking_type column in the DropDownList
                        dd_booking.DataValueField = "booking_type_id"; // Use the booking_type_id column as the value for the DropDownList items
                        dd_booking.DataBind();
                    }

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
        private void Loadshift()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    // Create a new instance of your Entity Framework context
                    using (OB_entities db = new OB_entities())
                    {
                        // Use LINQ query to retrieve data from the "booking_schedule" table
                        var data = from c in db.shifts
                                   where c.shift_status == true
                                   select new
                                   {
                                       c.shift_id,
                                       c.shift_status,
                                       Shift = c.shift_title
                                   };

                        // Bind data to the DropDownList shift_id shift_status
                        dd_shift.DataSource = data.ToList();
                        dd_shift.DataTextField = "shift"; // Display the shift_status column in the DropDownList
                        dd_shift.DataValueField = "shift_id"; // Use the shift_id column as the value for the DropDownList items
                        dd_shift.DataBind();

                    }

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

        private void BindSCHEDULE()
        {
            using (var scope = new TransactionScope())
            {
                tbl_schedule.Rows.Clear();
                using (var db = new OB_entities())
                {
                    var schedule = (from bok in db.booking_schedule
                                    join dy in db.week_days on bok.day_id equals dy.day_id
                                    join shf in db.shifts on bok.shift_id equals shf.shift_id
                                    join pol in db.policies on bok.policy_id equals pol.policy_id
                                    join boking in db.booking_type on bok.booking_type_id equals boking.booking_type_id
                                
                                    select new
                                    {
                                        Id = bok.schedule_id,
                                        Days = dy.day,
                                        Shift = shf.shift_title,
                                        book = boking.booking_type1,
                                        policy = pol.policy_title,
                                        charges = bok.charges_amount,
                                        SlotStatus = bok.schedule_status

                                    }).ToList();

                    foreach (var slotData in schedule)
                    {
                        TableRow row = new TableRow();
                        //TableCell cellSlotId = new TableCell();
                        TableCell cellDays = new TableCell();
                        TableCell cellShift = new TableCell();
                        TableCell cellbookingtype = new TableCell();
                        TableCell cellpolicy = new TableCell();
                        TableCell cellcharges = new TableCell();
                        TableCell cellstatus = new TableCell();
                        TableCell cellEditButton = new TableCell();

                        // cellSlotId.Text = slotData.SlotId.ToString();
                        cellDays.Text = slotData.Days?.ToString() ?? "N/A";
                        cellShift.Text = slotData.Shift?.ToString() ?? "N/A";
                        cellbookingtype.Text = slotData.book?.ToString() ?? "N/A";
                        cellpolicy.Text = slotData.policy?.ToString() ?? "N/A";
                        cellcharges.Text = slotData.charges?.ToString() ?? "N/A";
                        cellstatus.Text = slotData.SlotStatus.ToString() ?? "N/A";

                        // Create the edit button and set its properties
                        Button btnEdit = new Button();
                        btnEdit.ID = "btnEdit_" + slotData.Id.ToString();
                        btnEdit.Text = "Edit";
                        btnEdit.Click += new EventHandler(btnEdit_Click);// Add the click event handler

                        // Add the button control to the cell
                        cellEditButton.Controls.Add(btnEdit);

                        // Add the cells to the row
                        /// row.Cells.Add(cellSlotId);
                        row.Cells.Add(cellDays);
                        row.Cells.Add(cellShift);
                        row.Cells.Add(cellbookingtype);
                        row.Cells.Add(cellpolicy);
                        row.Cells.Add(cellcharges);
                        row.Cells.Add(cellstatus);
                        row.Cells.Add(cellEditButton);

                        // Add the row to the ASP.NET table
                        tbl_schedule.Rows.Add(row);
                    }
                    scope.Complete();
                }
            }
        }
        private void Update()
        {
            try
            {
                using (var scope = new TransactionScope())
                {
                    lbl_error.Text = string.Empty;
                    int id = Convert.ToInt32(Session["ScheduleID"]);

                    OB_entities db = new OB_entities();
                    var val = (from i in db.booking_schedule where i.schedule_id == id select i).FirstOrDefault();
                    if (val != null)
                    {
                        val.schedule_status = Convert.ToBoolean(txt_charges.Value);
                    }

                    if (chk_status.Checked == true)
                    {
                        val.schedule_status = true;
                    }
                    else
                    {
                        val.schedule_status = false;
                    }
                    db.SaveChanges();
                    scope.Complete();
                }


            }




            catch (Exception ex)
            {

                try
                {

                    lbl_error.Text = ex.InnerException.InnerException.Message;
                }
                catch (Exception)
                {
                    try
                    {
                        lbl_error.Text = (ex.InnerException.Message);
                    }
                    catch (Exception)
                    {
                        lbl_error.Text = (ex.Message);
                    }
                }
            }
        }
        private void bindBOOKING()
        {
            try
            {
                lbl_error.Text = string.Empty;
                using (var scope = new TransactionScope())
                {
                    OB_entities db = new OB_entities();
                    int ID = Convert.ToInt32(Session["ScheduleID"]);
                    var val = (from i in db.booking_schedule where i.schedule_id == ID select i).FirstOrDefault();

                    if (val != null)
                    {
                        // Display data from the booking_schedule entity
                        dd_policy.Text = val.policy_id.ToString(); // Assuming dd_policy is a DropDownList
                        dd_shift.Text = val.shift_id.ToString(); // Assuming dd_shift is a DropDownList
                        dd_week.Text = val.day_id.ToString(); // Assuming dd_week is a DropDownList
                        txt_charges.Value = val.charges_amount.ToString();

                        //var sch = (from i in db.policies where i.policy_id == val.policy_id select i).FirstOrDefault();
                        //if (sch != null)
                        //{
                        //    // Display data from the policies entity
                        //    dd_policy.SelectedValue = sch.policy_id.ToString(); // Assuming dd_policy is a DropDownList
                        //}

                        //var week = (from i in db.week_days where i.day_id == val.day_id select i).FirstOrDefault();
                        //if (week != null)
                        //{
                        //    // Display data from the week_days entity
                        //    dd_week.SelectedValue = week.day_id.ToString(); // Assuming dd_week is a DropDownList
                        //}

                        //var shift = (from i in db.shifts where i.shift_id == val.shift_id select i).FirstOrDefault();
                        //if (shift != null)
                        //{
                        //    // Display data from the shifts entity
                        //    dd_shift.SelectedValue = shift.shift_id.ToString(); // Assuming dd_shift is a DropDownList
                        //}

                        //var charges = (from i in db.booking_schedule where i.schedule_id == ID select i.charges_amount).FirstOrDefault();
                        //if (charges != null)
                        //{
                        //    // Display data from the booking_schedule entity
                        //    txt_charges.Value = charges.ToString();
                        //}
                    }

                    scope.Complete();
                }
            }
            catch (Exception ex)
            {
                lbl_error.Text = GetInnermostExceptionMessage(ex);
            }
        }

        // Utility method to get the innermost exception message
        private string GetInnermostExceptionMessage(Exception ex)
        {
            while (ex.InnerException != null)
            {
                ex = ex.InnerException;
            }
            return ex.Message;
        }

        private int duplicate()
        {
            try
            {
                string schedule_title = txt_charges.Value;
                OB_entities db = new OB_entities();
                int dayID = Convert.ToInt32(dd_week.SelectedValue);
                int shiftID = Convert.ToInt32(dd_shift.SelectedValue);
                int BookingID = Convert.ToInt32(dd_booking.SelectedValue);
                int PolicyID = Convert.ToInt32(dd_policy.SelectedValue);
                int ChargesID = Convert.ToInt32(txt_charges.Value);

                var vs = (from v in db.booking_schedule where v.charges_amount == ChargesID && v.booking_type_id == BookingID && v.day_id == dayID && v.shift_id == shiftID && v.policy_id == PolicyID select v).FirstOrDefault();

                if (vs != null)
                {
                    // Show alert for duplicate record
                    string script = "alert('A record already exists!');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "DuplicateRecordAlert", script, true);

                    // Set the error message to display on the page
                    lbl_error.Text = "A record already exists!";
                    return 1;
                }
                else
                {
                    return 2;
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if necessary
                lbl_error.Text = ex.Message;
            }

            return -1;
        }
               protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                // Clear the existing rows from the table              
                // Get the button that triggered the event
                Button btnEdit = (Button)sender;
                // Extract the unique ID of the row or any other data that helps you identify which row to edit
                int bookID = Convert.ToInt32(btnEdit.ID.Replace("btnEdit_", ""));
                Session["SCHEDULEID"] = bookID;
                bindBOOKING();
                BindSCHEDULE();
               // read(bookID);
            }
            catch (Exception ex)
            {

                try
                {

                    lbl_error.Text = ex.InnerException.InnerException.Message;
                }
                catch (Exception)
                {
                    try
                    {
                        lbl_error.Text = (ex.InnerException.Message);
                    }
                    catch (Exception)
                    {
                        lbl_error.Text = (ex.Message);
                    }
                }

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ScheduleID"] = null;

            }
            Session["USERID"] = 123;
            Session["DATE"] = DateTime.Now;

            LoadBooking();
            LoadDays();
            Loadshift();
            LoadPolicy();
            BindSCHEDULE();

        }

        private void FRESH()
        {
            dd_policy.Text = "";
            dd_booking.Text = "";
            dd_shift.Text = "";
            dd_week.Text = "";

            chk_status.Checked = false;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {


                string pattern = "^[a-zA-Z0-9 ]*$";
                if (!Regex.IsMatch(dd_policy.Text, pattern))
                {
                    string script = "alert('special characters  are not  allowed.');";
                    ScriptManager.RegisterStartupScript(this, GetType(), "InvalidInputAlert", script, true);
                    return;
                }

                lbl_error.Text = string.Empty;
                if (duplicate() == 1)
                {
                    lbl_error.Text = "A record already exists!";
                    return;
                }
                else
                {


                    if (Session["ScheduleID"] == null)
                    {
                        AddSchedule();
                    }
                    if (Session["ScheduleID"] != null)
                    {
                        Update();
                    }
                    BindSCHEDULE();
                    Session["ScheduleID"] = null;
                    FRESH();
                }
            }

            catch (Exception ex)
            {

                try
                {

                    lbl_error.Text = ex.InnerException.InnerException.Message;
                }
                catch (Exception)
                {
                    try
                    {
                        lbl_error.Text = (ex.InnerException.Message);
                    }
                    catch (Exception)
                    {
                        lbl_error.Text = (ex.Message);
                    }

                }

            }
        }
    }
}



