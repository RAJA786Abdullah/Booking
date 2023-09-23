<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.Booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>DHA Quetta</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico" />



    <!-- App css -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/app.min.css" rel="stylesheet" type="text/css" />


    <!-- Sweet Alert -->
    <link href="../assets/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/plugins/animate/animate.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <!-- Log In page -->
        <div class="container-fluid">
            <div class="row vh-100">
                <div class="col-12">
                    <div class="card-body p-0">
                        <div class="row d-flex align-items-center">
                            <div class="col-md-5 col-xl-3 col-lg-4">
                                <div class="card mb-0 border-0">
                                    <div class="card-body p-0">
                                        <div class="text-center p-3">
                                            <a href="index.html" class="logo logo-admin">
                                                <img src="../assets/images/logo-sm.png" height="200" alt="logo" class="auth-logo">
                                            </a>
                                            <h4 class="mt-3 mb-1 fw-semibold font-18">Welcome DHA Quetta Portal</h4>
                                            <p class="text-muted  mb-0">Sign in to download vouchers.</p>
                                        </div>
                                    </div>
                                    <!--end card-body-->
                                    <div class="card-body pt-0">

                                        <form class="my-4" action="https://mannatthemes.com/metrica/default/index.html">
                                            <div class="form-group mb-2">
                                                <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
                                                <label class="form-label" for="cnic">Venue</label>
                                                <asp:DropDownList ID="dd_venue" runat="server" class="form-control" placeholder="Add venue" required="required" DataSourceID="ObjectDataSource1" DataTextField="vanue_title" DataValueField="vanue_id" AutoPostBack="True"></asp:DropDownList>



                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.DataSet1TableAdapters.vanueTableAdapter" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_vanue_id" Type="Int32"></asp:Parameter>
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="vanue_title" Type="String"></asp:Parameter>
                                                        <asp:Parameter Name="vanue_status" Type="Boolean"></asp:Parameter>
                                                    </InsertParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="vanue_title" Type="String"></asp:Parameter>
                                                        <asp:Parameter Name="vanue_status" Type="Boolean"></asp:Parameter>
                                                        <asp:Parameter Name="Original_vanue_id" Type="Int32"></asp:Parameter>
                                                    </UpdateParameters>
                                                </asp:ObjectDataSource>
                                            </div>

                                            <div class="form-group">
                                                <label class="form-label" for="userpassword">Booking</label>
                                                <asp:DropDownList ID="dd_booking" runat="server" class="form-control" placeholder="Add Booking Type" required="required" DataSourceID="ObjectDataSource2" DataTextField="booking_type" DataValueField="booking_type_id"></asp:DropDownList>

                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.DataSet1TableAdapters.booking_typeTableAdapter" UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_booking_type_id" Type="Int32"></asp:Parameter>
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="booking_type" Type="String"></asp:Parameter>
                                                        <asp:Parameter Name="booking_type_status" Type="Boolean"></asp:Parameter>
                                                        <asp:Parameter Name="vanue_id" Type="Int32"></asp:Parameter>
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="dd_venue" PropertyName="SelectedValue" DefaultValue="0" Name="id" Type="Int32"></asp:ControlParameter>
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="booking_type" Type="String"></asp:Parameter>
                                                        <asp:Parameter Name="booking_type_status" Type="Boolean"></asp:Parameter>
                                                        <asp:Parameter Name="vanue_id" Type="Int32"></asp:Parameter>
                                                        <asp:Parameter Name="Original_booking_type_id" Type="Int32"></asp:Parameter>
                                                    </UpdateParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                            <div class="form-group">
                                                <label class="form-label">Date time</label>
                                                <%--<asp:DropDownList type="time" id="dd_calender" runat="server" class="form-control" placeholder="Add Type" required="required"></asp:DropDownList>--%>
                                                <input type="date" id="dd_calender" runat="server" class="form-control" onchange="dateChanged()" name="dateInput" />

                                            </div>
                                            <div class="form-group mb-0 row">
                                                <div class="col-12">
                                                    <div class="d-grid mt-3">
                                                        <asp:Button ID="btn_Serch" runat="server" CssClass="btn btn-primary" OnClick="btn_Serch_Click" CausesValidation="True" Text="Search" />
                                                        <asp:HiddenField ID="hiddenDayName" runat="server" />
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end form-group-->
                                            <div class="form-group mb-0 row">

                                                <label class="form-label" for="cnic">Booking Time</label>
                                                <asp:DropDownList ID="dtp_booking_time" runat="server" class="form-control" DataSourceID="ObjectDataSource3" DataTextField="BookingTime" DataValueField="time_slot_id"></asp:DropDownList>

                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.DataSet1TableAdapters.Booking_timeTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter SessionField="Days_id" Name="id" Type="String"></asp:SessionParameter>
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </div>
                                            <div class="form-group mb-0 row">

                                                <label class="form-label" for="cnic">Charges</label>
                                                <asp:DropDownList ID="dtp_charges" class="form-control" runat="server" DataSourceID="ObjectDataSource4" DataTextField="charges_amount" DataValueField="schedule_id"></asp:DropDownList>

                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource4" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.DataSet1TableAdapters.booking_scheduleTableAdapter">
                                                    <SelectParameters>
                                                        <asp:SessionParameter SessionField="type_id" Name="id" Type="Int32"></asp:SessionParameter>
                                                        <asp:SessionParameter SessionField="Days_id" DefaultValue="0" Name="id2" Type="String"></asp:SessionParameter>
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label9" runat="server" Text="Enter Name "></asp:Label>
                                                <input type="text" id="txt_name" runat="server" class="form-control" />


                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label10" runat="server" Text="Enter Cnic "></asp:Label>
                                                <input type="text" id="txt_cnic" runat="server" class="form-control" />


                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="Label11" runat="server" Text="Phone No "></asp:Label>
                                                <input type="number" id="txt_phone" runat="server" class="form-control" />


                                            </div>
                                          
                                    
                                               
                                              <div class="form-group mb-0 row">
                                                <div class="col-12">
                                                    <div class="d-grid mt-3">
                                                        <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary" OnClick="btn_save_Click" CausesValidation="True" Text="Save" />
                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>

                                        </form>
                                        <!--end form-->



                                    </div>
                                    <!--end card-body-->
                                </div>
                                <!--end card-->
                            </div>



                            <!--end col-->




                         
                            <!--end col-->


                        </div>
                        <!--end row-->
                    </div>
                    <!--end card-body-->
                </div>
                <!--end col-->
            </div>
            <!--end row-->
        </div>
        <!--end container-->
    </form>
    <!-- Javascript  -->
    <script type="text/javascript">
        function dateChanged() {
            var selectedDate = document.getElementById("dd_calender").value;
            var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            var date = new Date(selectedDate);
            var dayName = dayNames[date.getDay()];

            document.getElementById('<%= hiddenDayName.ClientID %>').value = dayName;
        }
    </script>


    <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
    <script src="../assets/pages/analytics-index.init.js"></script>


    <!-- App js -->
    <script src="../assets/js/app.js"></script>

    <!-- Javascript  -->
    <!-- Sweet-Alert  -->
    <script src="../assets/plugins/sweet-alert2/sweetalert2.min.js"></script>
    <script src="../assets/pages/sweet-alert.init.js"></script>

</body>
</html>



