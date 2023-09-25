<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_booking_schedule.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_booking_schedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
                                
<asp:Content ID="Content2" ContentPlaceHolderID="maincontainer" runat="server">
    <div class="container-fluid">
        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <div class="page-title-box">
                    <div class="float-right">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Booking</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Configuration</a></li>
                            <li class="breadcrumb-item active">Booking Type</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Time Slot</h4>
                </div>
                <!--end page-title-box-->
            </div>
            <!--end col-->
        </div>
        <!-- end page title end breadcrumb -->


        <div class="row">
            <asp:Label ID="lbl_error" runat="server" class="form-check-label" Text=""></asp:Label>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Booking Schedule</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">



                            <ContentTemplate>
                               
                               <form>
                                    <div class="form-group">
                                        <label class="form-check-label">Policy</label>
                                        <asp:DropDownList ID="dd_policy" class="form-control"  runat="server"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label"></label>
                                        <label class="form-check-label">Booking type</label>
                                        <asp:DropDownList ID="dd_booking" class="form-control"  runat="server" ></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Shifts</label>
                                        <asp:DropDownList ID="dd_shift" class="form-control"  runat="server" ></asp:DropDownList>
                                    </div>
                                   <div class="form-group">
                                        <label class="form-check-label">weeks</label>
                                        <asp:DropDownList ID="dd_week" class="form-control"  runat="server" ></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Charges Amount</label>
                                        <input id="txt_charges" runat="server" class="form-control" type="text" />
                                    </div>
                                  
                                    
                                    <div class="form-group">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_status" runat="server" />
                                    </div>

                                    <div class="form-group">
                                              <asp:Button ID="btn_save" runat="server" CssClass="btn btn-gradient-primary" OnClick="btn_save_Click" Text="Submit" AutoPostBack="True" />
                                    </div>
                                </form>
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tbl_schedule" runat="server" CssClass="table table-bordered">
                                          

                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Policy</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Booking type</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Shifts </asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">weeks</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">weeks</asp:TableHeaderCell>
                                                 <asp:TableHeaderCell CssClass="thead-light">Edit</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>


                                        </asp:Table>
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <!--end card-body-->
            </div>
            <!--end card-->
        </div>
        <!--end card-body-->
    </div>
</asp:Content>

         
<asp:Content ID="Content3" ContentPlaceHolderID="additionalscript" runat="server">
</asp:Content>
