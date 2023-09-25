<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="ConfirmBooking.aspx.cs" Inherits="OnlineBooking.pages.ConfirmBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontainer" runat="server">

    <div class="page-content">

                <div class="container-fluid">
                    <!-- Page-Title -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">DHA</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Booking Records</a></li>
                                        <li class="breadcrumb-item active">Confrim Booking</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Booking Records</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
                    <!-- end page title end breadcrumb -->
                    <div class="row">
                        <asp:Label ID="lblalert" Visible="false" runat="server" Text=""></asp:Label>
                          <%--modal for error message start--%>
                            <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="errorModalLabel">Alert!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p id="errorMessage"></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         <%--modal for error message end--%>
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
    
                                    <h4 class="mt-0 header-title">Confirm Booking</h4>
                                      <br />
                                  
                                        <asp:GridView CssClass="table table-bordered dt-responsive nowrap" ID="grd_confirm_booking" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
                                            <Columns>
                                               <asp:BoundField DataField="Booking_no" HeaderText="Booking No" SortExpression="Booking_no"></asp:BoundField>
                                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>
                                                <asp:BoundField DataField="cnic" HeaderText="CNIC" SortExpression="cnic"></asp:BoundField>
                                                <asp:BoundField DataField="mobile_no" HeaderText="Phone" SortExpression="mobile_no"></asp:BoundField>
                                                 <asp:BoundField DataField="vanue_title" HeaderText="Vanue" SortExpression="vanue_title"></asp:BoundField>
                                                <asp:BoundField DataField="booking_type" HeaderText="Booked For" SortExpression="booking_type"></asp:BoundField>
                                                 <asp:BoundField DataField="booking_date" HeaderText="Booking Date" SortExpression="booking_date" ReadOnly="True" DataFormatString="{0:dd-MM-yyyy}"></asp:BoundField>
                                                <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day"></asp:BoundField>
                                                   <asp:BoundField DataField="shift_title" HeaderText="Shift" SortExpression="shift_title"></asp:BoundField>                                                 
                                                <asp:BoundField DataField="time_slot" HeaderText="Time Slot" ReadOnly="True" SortExpression="time_slot"></asp:BoundField>
                                                 <asp:BoundField DataField="total_amount" HeaderText="Charges" SortExpression="total_amount"></asp:BoundField>
                                                <asp:CheckBoxField DataField="is_paid" HeaderText="Paid" SortExpression="is_paid"></asp:CheckBoxField>
                                                <asp:CheckBoxField DataField="is_reservation" HeaderText="Reserved" SortExpression="is_reservation"></asp:CheckBoxField>
                                                <asp:CheckBoxField DataField="is_confirmed" HeaderText="Confirmed" SortExpression="is_confirmed"></asp:CheckBoxField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.frm_booking_recordsTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter SessionField="confirmedStats" Name="confirmed" Type="Boolean" DefaultValue="True"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                  
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->  
                    <</div>
                </div><!-- container -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="additionalscript" runat="server">
    <script type="text/javascript">
                function showErrorModal(errorMessage) {
                    // Set the error message in the modal
                    document.getElementById('errorMessage').textContent = errorMessage;
        
                    // Show the modal
                    $('#errorModal').modal('show');
                }
    </script>
</asp:Content>
