<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_booking.aspx.cs" Inherits="OnlineBooking.pages.frm_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cricket Stadium Booking</title>
    <!-- CSS -->
    <link rel="stylesheet" href="../../assets/css/styleGPT.css" />
    <!-- BoxIcon link -->
    <%-- <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css" />--%>
    <link rel="stylesheet" href="../../assets/css/box_icon.css" />
    <!-- Google Fonts link -->
    <link rel="stylesheet" href="https://fonts.googleapis.com" />
    <link rel="stylesheet" href="https://fonts.gstatic.com" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap" />
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="demo_modal" visible="false" runat="server" class="modal">
                <div class="modal_content">
                    <h1>CSS Only Modal</h1>
                    <p>
                        You can use the :target pseudo-class to create a modals with Zero JavaScript. Enjoy!
                    </p>
                    <a href="#" class="modal__close">&times;</a>
                </div>
            </div>
            <header>
                <a href="#" class="logo"><span>DHA</span>VENUE RESERVATION</a>
                <ul class="navbar">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Information</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="#" class="" id="">Book Now</a></li>

                    <!-- <li><a href="#" class="btn" id="book-now">Book Now</a></li> -->
                </ul>
                <!-- Social media links -->
                <div class="h-right">
                    <a href="#">Follow Us</a>
                    <a href="#"><i class="bx bxl-instagram"></i></a>
                    <a href="#"><i class="bx bxl-twitter"></i></a>
                    <a href="#"><i class="bx bxl-facebook"></i></a>
                    <div class="bx bx-menu" id="menu-icon"></div>
                </div>
            </header>

            <section class="home">
                <!-- Home section content -->
                <div class="home-text">

                    <h1>BOOKING MADE EASY<br />
                    </h1>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="ddType" id="booking-details">
                                <label for="venue">Venue</label>
                                <asp:DropDownList ID="dd_venue" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="vanue_title" DataValueField="vanue_title" OnSelectedIndexChanged="dd_venue_SelectedIndexChanged1">
                                    <asp:ListItem Text="--<< Please Select Venue >>--" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString2 %>' SelectCommand="SELECT [vanue_title], [vanue_id] FROM [vanue]"></asp:SqlDataSource>

                                <label for="booking-type">Booking type</label>
                                <asp:DropDownList ID="dd_booking" runat="server" DataSourceID="SqlDataSource2" DataTextField="booking_type" DataValueField="booking_type" OnSelectedIndexChanged="dd_booking_SelectedIndexChanged1"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString2 %>' SelectCommand="SELECT [booking_type] FROM [booking_type] WHERE ([vanue_id] = @vanue_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="venueID" DefaultValue="0" Name="vanue_id" Type="Int32"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <label for="booking-date">Booking date</label>
                                <asp:Calendar ID="dtp_date" CssClass="Clndar" runat="server" NextPrevStyle-BorderStyle="None" OtherMonthDayStyle-ForeColor="#CCCCCC" SelectedDayStyle-BackColor="#E4E6E7" TitleStyle-Wrap="True" Visible="True" SelectedDayStyle-ForeColor="#666666" DayStyle-ForeColor="White"></asp:Calendar>
                                <asp:Button ID="btnBookNow" runat="server" CssClass="btn" Text="Book Now" OnClick="btnBookNow_Click" AutoPostBack="true" />
                            </div>



                            <div id="timeslots">
                                <asp:GridView ID="grd_Booking" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="Silver" OnRowCommand="grd_Booking_RowCommand" DataSourceID="ObjectDataSource1" DataKeyNames="schedule_id,time_slot_id,charges_amount" CellPadding="0">
                                    <Columns>
                                        <asp:BoundField DataField="shift_title" HeaderText="Shift" SortExpression="shift_title"></asp:BoundField>
                                        <asp:BoundField DataField="time_from" HeaderText="Start" SortExpression="time_from"></asp:BoundField>
                                        <asp:BoundField DataField="time_to" HeaderText="End" SortExpression="time_to"></asp:BoundField>
                                        <asp:BoundField DataField="charges_amount" HeaderText="Charges" SortExpression="charges_amount"></asp:BoundField>
                                        <asp:BoundField DataField="schedule_id" HeaderText="schedule_id" ReadOnly="True" InsertVisible="False" SortExpression="schedule_id" Visible="false"></asp:BoundField>
                                        <asp:BoundField DataField="time_slot_id" HeaderText="time_slot_id" ReadOnly="True" InsertVisible="False" SortExpression="time_slot_id" Visible="false"></asp:BoundField>

                                        <asp:ButtonField CommandName="Select" Text="Select" ControlStyle-CssClass="btngrd" ButtonType="Button" ShowHeader="True" HeaderText="Select">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="silver" ForeColor="#FFFFFF" />
                                        </asp:ButtonField>

                                    </Columns>
                                    <RowStyle CssClass="table table-bordered" />
                                </asp:GridView>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.time_scheduleTableAdapter">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="dayID" DefaultValue="0" Name="day" Type="Int32"></asp:SessionParameter>
                                        <asp:SessionParameter SessionField="venueID" DefaultValue="0" Name="vanue" Type="Int32"></asp:SessionParameter>
                                        <asp:SessionParameter SessionField="bookingtypeID" DefaultValue="0" Name="type" Type="Int32"></asp:SessionParameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>

                            <!-- Customer Entry Form Started Here-->
                            <div id="customer-form">
                                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                <asp:TextBox ID="txt_customerName" runat="server" MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfv_name" runat="server" ControlToValidate="txt_customerName"
                                    ErrorMessage="Name is required." Display="Dynamic" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="rev_name" runat="server" ControlToValidate="txt_customerName"
                                    ValidationExpression="^[a-zA-Z\s]+$" ValidationGroup="vld1" ErrorMessage="Name must contain only letters." Display="Dynamic" ForeColor="Red" />
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="CNIC"></asp:Label>
                                <asp:TextBox ID="txt_customerCnic" MaxLength="13" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfv_cnic" runat="server" ControlToValidate="txt_customerCnic"
                                    ErrorMessage="CNIC is required." Display="Dynamic" ForeColor="Red" />

                                <asp:RegularExpressionValidator ValidationGroup="vld1" ID="rev_cnic12" runat="server" ControlToValidate="txt_customerCnic"
                                    ValidationExpression="^\d{13}$" ErrorMessage="CNIC must be 13 digits   " Display="Dynamic" ForeColor="Red" />
                                <asp:RegularExpressionValidator ValidationGroup="vld1" ID="rev_cnic" runat="server" ControlToValidate="txt_customerCnic"
                                    ValidationExpression="^\d+$" ErrorMessage="CNIC must be in numbers" Display="Dynamic" ForeColor="Red" />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Contact No"></asp:Label>
                                <asp:TextBox ID="txt_customerContactno" MaxLength="11" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneNumber" ValidationGroup="vld1" runat="server" ControlToValidate="txt_customerContactno"
                                    ErrorMessage="Contact number is required." Display="Dynamic" ForeColor="Red" InitialValue="" />

                                <asp:RegularExpressionValidator ID="Rve_cno" runat="server" ValidationGroup="vld1" ControlToValidate="txt_customerContactno"
                                    ValidationExpression="^\d+$" ErrorMessage="Do not use any character" Display="Dynamic" ForeColor="Red" />
                                <br />
                                <asp:RegularExpressionValidator ID="revPhoneNumber" ValidationGroup="vld1" runat="server" ControlToValidate="txt_customerContactno"
                                    ValidationExpression="^\d{11}$" ErrorMessage="Contact number must be exactly 11 digits." Display="Dynamic" ForeColor="Red" />
                                <br />
                                <asp:Button ID="btn_customerSave" ValidationGroup="vld1" CssClass="btn" runat="server" OnClick="btn_customerSave_Click" Text="Submit" />
                                <asp:Label ID="lblCntVld" runat="server"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>
            </section>
            <!-- footer -->

            <footer>
                <div class="footer-content">
                    <div class="footer-logo">
                        <!-- <img src="./img/logo.jpg" alt="DHA Logo"> -->
                    </div>
                    <div class="footer-text">
                        <p>&copy; 2023 DHA Quetta. All rights reserved.</p>
                    </div>
                </div>
            </footer>
            <%--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
$(function () {
    $(".datepicker").datepicker();
});
</script>--%>

            <script src="../../assets/js/scriptGPT.js"></script>
        </div>
    </form>
</body>
</html>
