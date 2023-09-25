<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineBooking.aspx.cs" Inherits="OnlineBooking.pages.OnlineBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
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
        .home-text {
            width: 800px; /* Set a fixed width for the div */
            /* Add any other styling you want for the div */
        }
        /* The Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* Modal Content */
        .modal-content {
            background-color: white;
            margin: 20% auto;
            padding: 20px;
            border: 1px solid #888;
            border-radius: 5px;
            width: 30%;
            text-align: center;
            position: relative;
        }

        /* Close Button */
        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            font-weight: bold;
            color: black; /* Text color for the close button is black */
            cursor: pointer;
        }

        /* Text color within the modal */
        #errorMessage {
            color: black; /* Text color within the modal is black */
        }

        .transparent-button {
            background-color: transparent;
            color: white;
            border: 1px solid transparent;
            transition: background-color 0.3s, color 0.3s;
            padding: 8px 16px;
            border-radius: 5px; /* Add rounded corners */
        }

            .transparent-button:hover {
                background-color: white;
                color: black;
                border: 1px solid white;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <header>
                <a href="#" class="logo"><span>DHA</span> Sports Club</a>
                <ul class="navbar">


                    <!-- <li><a href="#" class="btn" id="book-now">Book Now</a></li> -->
                </ul>
                <!-- Social media links -->
                <div class="h-right">
                    <a href="#">Follow Us</a>
                    <a href="https://www.instagram.com/dhaquetta/" target="_blank"><i class="bx bxl-instagram"></i></a>
                    <a href="https://twitter.com/dhaqta_official" target="_blank"><i class="bx bxl-twitter"></i></a>
                    <a href="https://www.facebook.com/DHAQuetta/" target="_blank"><i class="bx bxl-facebook"></i></a>
                    <div class="bx bx-menu" id="menu-icon"></div>
                </div>
            </header>
            <%--modal for error message start--%>
            <div id="errorModal" class="modal">
                <div class="modal-content">
                    <span class="close" id="closeModal">&times;</span>
                    <p id="errorMessage"></p>
                </div>
            </div>
            <%--modal for error message end--%>
            <section class="home">

                <!-- Home section content -->
                <div class="home-text">
                    <div class="formContain">
                        <h1>Booking Form<br />
                        </h1>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="ddType" id="booking-details">
                                    <label for="venue">Venue</label>
                                    <asp:DropDownList ID="dd_venue" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource1" DataTextField="vanue_title" DataValueField="vanue_id" OnSelectedIndexChanged="dd_venue_SelectedIndexChanged1">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString %>' SelectCommand="SELECT [vanue_title], [vanue_id] FROM [vanue] WHERE ([vanue_status] = @vanue_status)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="vanue_status" Type="Boolean"></asp:Parameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <label for="booking-type">Booking type</label>
                                    <asp:DropDownList ID="dd_booking" runat="server" DataSourceID="SqlDataSource2" DataTextField="booking_type" DataValueField="booking_type_id" AutoPostBack="True" OnSelectedIndexChanged="dd_booking_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Online_Booking_SystemConnectionString %>' SelectCommand="SELECT booking_type_id, booking_type, booking_type_status FROM booking_type WHERE (vanue_id = @vanue_id) AND (booking_type_status = 1)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="vanueID" DefaultValue="" Name="vanue_id" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <label for="booking-date">Category</label>
                                    <asp:DropDownList ID="dd_team" runat="server" OnSelectedIndexChanged="dd_team_SelectedIndexChanged" AutoPostBack="True" DataSourceID="ObjectDataSource1" DataTextField="team_title" DataValueField="team_category_id"></asp:DropDownList>

                                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.team_categoryTableAdapter" UpdateMethod="Update"></asp:ObjectDataSource>
                                    <label for="booking-date">Booking date</label>
                                    <asp:Calendar ID="dtp_booking_date" CssClass="Clndar" runat="server" NextPrevStyle-BorderStyle="None" OtherMonthDayStyle-ForeColor="#CCCCCC" SelectedDayStyle-BackColor="#E4E6E7" TitleStyle-Wrap="True" Visible="True" SelectedDayStyle-ForeColor="#666666" DayStyle-ForeColor="White"></asp:Calendar>
                                    <asp:Button ID="btnBookNow" runat="server" CssClass="btn" Text="Book Now" OnClick="btnBookNow_Click" AutoPostBack="true" />
                                </div>
                                <div id="timeslots">
                                    <asp:GridView ID="grd_Booking" runat="server" CssClass="form-control" OnRowCommand="grd_Booking_RowCommand" EnableViewState="False" AutoGenerateColumns="False" HeaderStyle-BackColor="Silver" DataSourceID="ObjectDataSource4" CellPadding="0" DataKeyNames="schedule_id,shift_id,charges_amount">
                                        <Columns>
                                            <asp:BoundField DataField="schedule_id" HeaderText="schedule_id" ReadOnly="True" InsertVisible="False" SortExpression="schedule_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="shift_id" HeaderText="shift_id" SortExpression="shift_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="shift_title" HeaderText="Shift" SortExpression="shift_title"></asp:BoundField>
                                            <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
                                            <asp:BoundField DataField="charges_amount" HeaderText="Amount" SortExpression="charges_amount"></asp:BoundField>
                                            <asp:BoundField DataField="day_id" HeaderText="day_id" SortExpression="day_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="booking_type_id" HeaderText="booking_type_id" SortExpression="booking_type_id" Visible="false"></asp:BoundField>
                                            <asp:CheckBoxField DataField="is_confirmed" HeaderText="sis_confirmed" SortExpression="is_confirmed" Visible="false"></asp:CheckBoxField>
                                            <asp:BoundField DataField="booking_date" HeaderText="booking_date" SortExpression="booking_date" Visible="false"></asp:BoundField>
                                            <asp:CheckBoxField DataField="is_reservation" HeaderText="is_reservation" SortExpression="is_reservation" Visible="false"></asp:CheckBoxField>
                                            <asp:ButtonField CommandName="Select" Text="Select" ButtonType="Button" ShowHeader="True" HeaderText="Select" ControlStyle-CssClass="btn btn-gradient-success"></asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource4" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.booking_paymentsTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="Book_Type" DefaultValue="0" Name="id1" Type="Int32"></asp:SessionParameter>
                                            <asp:SessionParameter SessionField="DAYID" DefaultValue="0" Name="id" Type="Int32"></asp:SessionParameter>
                                            <asp:SessionParameter SessionField="TEAM" DefaultValue="0" Name="id2" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    <br />

                                    <div>
                                        <asp:GridView ID="grd_additional_ch" runat="server" CssClass="form-control" EnableViewState="False" AutoGenerateColumns="False" DataKeyNames="additional_ch_id,amount" DataSourceID="ObjectDataSource8" HeaderStyle-BackColor="Silver">
                                            <Columns>
                                                <asp:BoundField DataField="charges_title" HeaderText="Title" SortExpression="charges_title"></asp:BoundField>
                                                <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount"></asp:BoundField>
                                                <asp:BoundField DataField="additional_ch_id" HeaderText="additional_ch_id" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="additional_ch_id"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Check">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chk_additional" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>



                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource8" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.Additional_ch_configTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter SessionField="VenueID" DefaultValue="0" Name="id" Type="Int32"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
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
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

            <script>
                // Get references to the modal and close button
                var modal = document.getElementById("errorModal");
                var closeButton = document.getElementById("closeModal");
                var errorMessage = document.getElementById("errorMessage");

                // Function to open the modal with a custom message
                function openModal(message) {
                    errorMessage.innerText = message;
                    modal.style.display = "block";
                }

                // Close the modal when the close button is clicked
                closeButton.onclick = function () {
                    modal.style.display = "none";
                };

                // Close the modal when the user clicks outside the modal
                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                };


            </script>




            <script src="../../assets/js/scriptGPT.js"></script>
        </div>
    </form>
</body>
</html>
