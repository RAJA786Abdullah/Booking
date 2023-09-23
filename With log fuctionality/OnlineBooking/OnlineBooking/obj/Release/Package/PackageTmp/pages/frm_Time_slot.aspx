<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_Time_slot.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_Time_slot" %>

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
                        <h4 class="mt-0 header-title">Time slot</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">



                            <ContentTemplate>
                               
                                <form>
                                    <div class="form-group">
                                        <label class="form-check-label">Venue</label>
                                        <asp:DropDownList ID="dd_vanue" class="form-control" OnSelectedIndexChanged="dd_vanue_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="vanue_title" DataValueField="vanue_id"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString %>' SelectCommand="SELECT [vanue_title], [vanue_id], [vanue_status] FROM [vanue]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Week days</label>

                                        <asp:DropDownList ID="dd_week" class="form-control" OnSelectedIndexChanged="dd_week_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource1" DataTextField="day" DataValueField="day_id"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString %>' SelectCommand="SELECT [day], [day_id] FROM [week_days]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Shifts</label>
                                        <asp:DropDownList ID="dd_shift" class="form-control" OnSelectedIndexChanged="dd_shift_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource3" DataTextField="shift_title" DataValueField="shift_id"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString %>' SelectCommand="SELECT [shift_title], [shift_id] FROM [shift]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Time Slot</label>
                                        <input type="time" id="dtp_start" class="form-control" runat="server" name="starttime" onchange="updatestarttime(this.value)" />
                                        <input type="hidden" id="hiddenStarttime" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Time From"></asp:Label>

                                        <input type="time" id="dtp_end" class="form-control" runat="server" name="endtime" onchange="updateentime(this.value)" />
                                        <input type="hidden" id="hiddenEndtime" runat="server" />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_solt" runat="server" />
                                    </div>

                                    <div class="form-group">
                                              <asp:Button ID="btn_save" runat="server" CssClass="btn btn-gradient-primary" OnClick="btn_save_Click" Text="Submit" AutoPostBack="True" />
                                    </div>
                                </form>
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tblslot" runat="server" CssClass="table table-bordered">
                                          

                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Time Slot</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Time From</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Weeks </asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Shift</asp:TableHeaderCell>
                                                 <asp:TableHeaderCell CssClass="thead-light">Edit</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>


                                        </asp:Table>
                                    </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <script>
                            function updateentime(selectedEndTime) {
                                document.getElementById('<%= hiddenEndtime.ClientID %>').value = selectedEndTime;
                          }
                            
                        </script>
                        <script>
                            function updatestarttime(selectedStartTime) {
                                document.getElementById('<%= hiddenStarttime.ClientID %>').value = selectedStartTime
                            }
                        </script>
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
