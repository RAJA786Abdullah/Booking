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
    public partial class frm_shift_timing : System.Web.UI.Page
    {


        //int id_day = 0;
        //int id_shift = 0;
        //private object pnlEditDetails;


        //Page Load code here
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                grd_slot.DataBind();
                Session["SHIFTSLOTID"] = null;
                dtp_start.Value = DateTime.Now.ToString("HH:mm");
                 dtp_end.Value = DateTime.Now.ToString("HH:mm");
            }
            
            Session["DATE"] = DateTime.Now;           
        }

        //Add Time slot method start here
        private void AddSlot()
        {
            try
            {
            using (OB_entities db = new OB_entities())
            {
                bool status = false;
                if (chk_solt.Checked == true)
                {
                    status = true;
                }
               
                    shift tbl = new shift();
                    string startTimeValue = dtp_start.Value;
                    string endTimeValue = dtp_end.Value;

                    DateTime startTime;
                    DateTime endTime;

                    if (DateTime.TryParse(startTimeValue, out startTime) && DateTime.TryParse(endTimeValue, out endTime))
                    {
                        // Format the DateTime objects as 12-hour time strings with AM/PM
                       tbl.time_from = startTime.ToString("hh:mm");
                       tbl.time_to = endTime.ToString("hh:mm");
                    }
                    tbl.shift_title = txt_shift.Text;
                    tbl.shift_status = status;
                    tbl.season = dd_season.SelectedValue.ToString();              
                    db.shifts.Add(tbl);             
                        if (db.SaveChanges() > 0)
                        {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                                  $"showErrorModal('{"Shift added successfully!"}')", true);                            
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
        //Add slot method end here

        //Update slot method start here
        private void update()
        {
            try
            {

            bool status = false;
            if (chk_solt.Checked == true)
            {
                status = true;
            }
            int ID = Convert.ToInt32(Session["SHIFTSLOTID"]);
            OB_entities db = new OB_entities();
            var val = (from i in db.shifts where i.shift_id == ID select i).FirstOrDefault();
                if (val != null)
                {
                    string startTimeValue = dtp_start.Value;
                    string endTimeValue = dtp_end.Value;

                    DateTime startTime;
                    DateTime endTime;

                    if (DateTime.TryParse(startTimeValue, out startTime) && DateTime.TryParse(endTimeValue, out endTime))
                    {
                        // Format the DateTime objects as 12-hour time strings with AM/PM
                        val.time_from = startTime.ToString("hh:mm");
                        val.time_to = endTime.ToString("hh:mm");
                    }
                    val.shift_title = txt_shift.Text;
                    val.shift_status = status;
                    val.season = dd_season.SelectedValue.ToString();
                    if (db.SaveChanges() > 0)
                    {

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                          $"showErrorModal('{"Shift updated successfully!"}')", true);
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

        private int duplicate()
        {
            TimeSpan endTime;
            TimeSpan StartTime;
            try
            {
                bool status = false;
                if (chk_solt.Checked == true)
                {
                    status = true;
                }
                int shftID = Convert.ToInt32(Session["SHIFTSLOTID"]);
                endTime = TimeSpan.Parse(dtp_end.Value);
                StartTime = TimeSpan.Parse(dtp_start.Value);
                string title= txt_shift.Text;                
                string season=dd_season.SelectedValue.ToString();
                OB_entities db = new OB_entities(); // 
                if (Session["SHIFTSLOTID"] != null)
                {
                    var vs = (from v in db.shifts where v.shift_id== shftID && v.time_from == dtp_start.Value.ToString() && v.time_to == dtp_end.Value.ToString() && v.season == season && v.shift_title == title  && v.shift_status== status select v).FirstOrDefault();

                    if (vs != null)
                    {
                        return 1; // Duplicate entry found
                    }
                    else
                    {
                        return 2;
                    }
                }
                else
                {
                    var vs1 = (from v in db.shifts where v.shift_id == shftID && v.time_from == dtp_start.Value.ToString() && v.time_to == dtp_end.Value.ToString() && v.season == season && v.shift_title == title select v).FirstOrDefault();

                    if (vs1 != null)
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
    
        //TimeSlot time Duplication method end here


        //TimeSlot Fresh method start here
        private void FRESH()
        {
            dtp_start.Value = "";
            dtp_end.Value = "";
            //Session["selectedEndTime"] = null;
            //Session["selectedStartTime"] = null;
            dtp_start.Value = DateTime.Now.ToString("HH:mm");
            dtp_end.Value = DateTime.Now.ToString("HH:mm");
            txt_shift.Text = string.Empty;
            dd_season.SelectedIndex = 0;
            Session["SHIFTSLOTID"] = null;
            chk_solt.Checked = false;
        }
          
        protected void btn_save_Click(object sender, EventArgs e)
        { 
            try
            {
                string pattern = "^[a-zA-Z0-9 ]*$";
                if (!Regex.IsMatch(txt_shift.Text, pattern))
                {
                  
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                      $"showErrorModal('{"Special characters  are not  allowed!"}')", true);
                    return;
                }
                if (dd_season.SelectedIndex==0)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                      $"showErrorModal('{"Select a season!"}')", true);
                    return;
                }
                if (dtp_start.Value == dtp_end.Value)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                      $"showErrorModal('{"Start time and end time cannot be same!"}')", true);
                    return;
                }
                TimeSpan startTime;
                TimeSpan endTime;

                if (TimeSpan.TryParse(dtp_start.Value, out startTime) && TimeSpan.TryParse(dtp_end.Value, out endTime))
                {
                    TimeSpan timeDifference = endTime - startTime;
                    TimeSpan threeHours = TimeSpan.FromHours(3);

                    if (timeDifference < threeHours)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                     $"showErrorModal('{"Time diffrence should be atleast 3 hours!"}')", true);
                        return;
                    }
                    if (endTime < startTime)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                      $"showErrorModal('{"Start time cannot be greater than end time!"}')", true);
                        return;
                    }
                }

                        lbl_error.Text = string.Empty;
                if (duplicate() == 1)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                      $"showErrorModal('{"A record already exists with these values!"}')", true);
                    return;
                }
                else
                {
                    if (IsPostBack)
                    {
                        //Session["selectedEndTime"] = hiddenEndtime.Value;
                        //Session["selectedStartTime"] = hiddenStarttime.Value;
                    }
                    if (Session["SHIFTSLOTID"] == null)
                    {
                        AddSlot();
                    }

                    if (Session["SHIFTSLOTID"] != null)
                    {
                        update();
                    }
                    grd_slot.DataBind();                   
                    FRESH();
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

        protected void grd_slot_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                Session["SHIFTSLOTID"] = Convert.ToInt32(grd_slot.DataKeys[rowIndex]["shift_id"]);
                int id= Convert.ToInt32(grd_slot.DataKeys[rowIndex]["shift_id"]); 
                OB_entities db = new OB_entities(); // 
               
                    var vs = (from v in db.shifts where v.shift_id == id  select v).FirstOrDefault();
                if (vs != null)
                {
                    txt_shift.Text = vs.shift_title;
                    dd_season.SelectedValue= vs.season;              
                    //DateTime timefrom = DateTime.ParseExact(vs.time_from.ToString(), "hh:mm tt", null);
                    dtp_start.Value = vs.time_from;
                    //DateTime timeto = DateTime.ParseExact(vs.time_to.ToString(), "hh:mm tt", null);
                    dtp_end.Value = vs.time_to;
                    chk_solt.Checked = Convert.ToBoolean(vs.shift_status);
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
                
       
        





