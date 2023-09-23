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
    public partial class frm_paid : System.Web.UI.Page
    {
        //Page load method start here
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_ID"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
        //Page load method end here

        //Searh button method start here
        protected void btn_sserch_Click(object sender, EventArgs e)
        {
            try
            {

                OB_entities db = new OB_entities();
                if (!string.IsNullOrEmpty(txt_vchrno.Value))
                {
                    int vchrNo = Convert.ToInt32(txt_vchrno.Value);
                    var val = (from i in db.customer_booking where i.Booking_no == vchrNo select i).FirstOrDefault();
                    if (val != null)
                    {
                        Session["BOOKID"] = val.customer_booking_id.ToString();
                        grd_paid.DataBind();
                    }
                    else
                    {
                        lbl_alert.Text = "Booking no not exist";
                        btn_alert.Visible = true;
                        lbl_alert.Visible = true;
                        popup.Visible = true;
                        return;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions if needed
                try
                {
                    // Show the modal with the error message
                    
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
        //Search button method end here

        //Gridview Row commond select method start here
        protected void grd_paid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                OB_entities db = new OB_entities();
                if (e.CommandName == "Select")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);

                    int bookid = Convert.ToInt32(grd_paid.DataKeys[rowIndex]["customer_booking_id"]);

                    var val = (from i in db.customer_booking where i.customer_booking_id == bookid select i).FirstOrDefault();
                    if (val != null)
                    {
                        if (val.is_paid == false)
                        {
                            val.is_paid = true;
                            val.is_confirmed = true;
                            val.is_reservation = true;
                            val.update_by_id = Convert.ToInt32(Session["User_ID"]);
                            val.update_date = DateTime.Now;
                            db.SaveChanges();
                            lbl_succes.Text = "Payment confirmed successfully";
                            lbl_succes.Visible = true;
                            btn_alrtscu.Visible = true;
                            SuccesDiv.Visible = true;
                        }

                    }
                }
                if (e.CommandName == "SelectRcpt")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32((grd_paid.DataKeys[rowIndex]["customer_booking_id"]));
                    Session["PASSID"] = id;
                    var val1 = (from i in db.customer_booking where i.customer_booking_id == id select i).FirstOrDefault();
                    if (val1 != null)
                    {
                        if (val1.is_paid == true)
                        {
                            Response.Redirect("/pages/frm_reciept.aspx");
                        }
                        else
                        {

                            lbl_alert.Text = "Vorcher is not paid.";
                            btn_alert.Visible = true;
                            lbl_alert.Visible = true;
                            popup.Visible = true;


                        }
                    }

                }
                if (e.CommandName == "Selectvch")
                {
                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    int id = Convert.ToInt32((grd_paid.DataKeys[rowIndex]["customer_booking_id"]));
                    Session["CBID"] = id;
                    var val1 = (from i in db.customer_booking where i.customer_booking_id == id select i).FirstOrDefault();
                    if (val1 != null)
                    {
                       
                    Response.Redirect("/pages/frm_voucher.aspx");
                                          
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
        //Gridview Row commond select method end here

        //Alert button select method start here
        protected void btn_alert_Click(object sender, EventArgs e)
        {
            popup.Visible = false;
            btn_alert.Visible = false;
            lbl_alert.Visible = false;
        }
        //Alert button select method end here

        
        protected void btn_alrtscu_Click(object sender, EventArgs e)
        {
            SuccesDiv.Visible = false;
            
        }
    }
}