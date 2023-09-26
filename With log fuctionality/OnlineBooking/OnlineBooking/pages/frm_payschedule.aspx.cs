using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBooking.pages
{
    public partial class frm_payschedule : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
        //Insert method start here
        protected void insert()
        {
            try
            {


                OB_entities db = new OB_entities();
                booking_schedule booking_tble = new booking_schedule();
                booking_tble.booking_type_id = Convert.ToInt32(dd_booking.SelectedValue);
                booking_tble.shift_id = Convert.ToInt32(dd_shift.SelectedValue);
                booking_tble.day_id = Convert.ToInt32(dd_days.SelectedValue);
                booking_tble.team_category_id = Convert.ToInt32(dd_team.SelectedValue);
                booking_tble.policy_id = Convert.ToInt32(dd_policy.SelectedValue);
                booking_tble.charges_amount = Convert.ToDecimal(txt_charges.Text);
                booking_tble.user_id = Convert.ToInt32(Session["User_ID"]);
                booking_tble.created_date = DateTime.Now;
                if (chk_status.Checked == true)
                {
                    booking_tble.schedule_status = true;
                }
                else
                {
                    booking_tble.schedule_status = false;
                }

                db.booking_schedule.Add(booking_tble);
                db.SaveChanges();
              
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"Payment schedule added successfully"}')", true);

                
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
        private void Fresh()
        {
            chk_status.Checked = false;
            txt_charges.Text = null;
            Session["PAY_SCHD"] = null;
        }
        protected void update()
        {
            try
            {
                OB_entities db = new OB_entities();
                int paycheID = Convert.ToInt32(Session["PAY_SCHD"]);
                var val = (from i in db.booking_schedule where i.schedule_id == paycheID select i).FirstOrDefault();
                if (val != null)
                {
                    val.booking_type_id = Convert.ToInt32(dd_booking.SelectedValue);
                    val.shift_id = Convert.ToInt32(dd_shift.SelectedValue);
                    val.day_id = Convert.ToInt32(dd_days.SelectedValue);                 
                    val.team_category_id = Convert.ToInt32(dd_team.SelectedValue);
                    val.policy_id = Convert.ToInt32(dd_policy.SelectedValue);
                    val.charges_amount = Convert.ToDecimal(txt_charges.Text);
                    val.user_id = Convert.ToInt32(Session["User_ID"]);
                    if (chk_status.Checked == true)
                    {
                        val.schedule_status = true;
                    }
                    else
                    {
                        val.schedule_status = false;
                    }


                    if (db.SaveChanges() > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                        $"showErrorModal('{"Payment schedule updated successfully"}')", true);
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
        protected int dublicate()
        {
            try
            {
                int policy_id = Convert.ToInt32(dd_policy.SelectedValue);

                int bk_id = Convert.ToInt32(dd_booking.SelectedValue);
                int sft_id = Convert.ToInt32(dd_shift.SelectedValue);
                int d_id = Convert.ToInt32(dd_days.SelectedValue);
                int team_id = Convert.ToInt32(dd_team.SelectedValue);
                int sch_id = Convert.ToInt32(Session["PAY_SCHD"]);
                OB_entities db = new OB_entities();
                //if (Session["PAY_SCHD"] != null)
                //{
                var val = (from i in db.booking_schedule where i.schedule_id != sch_id && i.booking_type_id == bk_id && i.shift_id == sft_id && i.day_id == d_id && i.team_category_id == team_id select i).FirstOrDefault();
                if (val != null)
                {
                    return 1;
                }
                else
                {
                    return 2;
                }
                //}
                //else
                //{
                //    var val = (from i in db.booking_schedule where i.schedule_id != sch_id && i.booking_type_id == bk_id && i.shift_id == sft_id && i.day_id == d_id && i.team_category_id == team_id select i).FirstOrDefault();
                //    if (val != null)
                //    {
                //        return 1;
                //    }
                //    else
                //    {
                //        return 2;
                //    }
                //}
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
     



        protected void btnsave_Click(object sender, EventArgs e)
        {
            try
            {

                int DuplicateRecord = dublicate();            
                if (DuplicateRecord == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"A record already exists with same booking type, shift, day and team category."}')", true);
                    return;
                }
                if (DuplicateRecord == 3)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorModal",
                       $"showErrorModal('{"Error in system plz Try Again.."}')", true);
                    return;
                }
                if (DuplicateRecord == 2)
                {
                    if (Session["PAY_SCHD"] == null)
                    {
                        insert();
                    }
                    else
                    {
                        update();
                    }
                    gdv_payschedule.DataBind();
                    Fresh();
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

        protected void gdv_payschedule_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                OB_entities db = new OB_entities();
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                int payschid = Convert.ToInt32(gdv_payschedule.DataKeys[rowIndex]["schedule_id"]);
                Session["PAY_SCHD"] = payschid;
                var val = (from i in db.booking_schedule where i.schedule_id == payschid select i).FirstOrDefault();
                if (val != null)
                {
                    dd_booking.SelectedValue = (val.booking_type_id).ToString();
                    dd_shift.SelectedValue = val.shift_id.ToString();
                    dd_days.SelectedValue = val.day_id.ToString();
                    dd_team.SelectedValue = val.team_category_id.ToString();
                    dd_policy.SelectedValue = val.policy_id.ToString();
                    txt_charges.Text = val.charges_amount.ToString();
                    if (val.schedule_status == true)
                    {
                        chk_status.Checked = true;
                    }
                    else
                    {
                        chk_status.Checked = false;
                    }
                    if (payschid != 0)
                    {
                        Session["UPDT"] = "True";
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