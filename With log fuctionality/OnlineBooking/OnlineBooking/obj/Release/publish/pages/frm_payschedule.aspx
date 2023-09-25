<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_payschedule.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_payschedule" %>
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
                            <li class="breadcrumb-item active">Pay Shedule</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Pay Schedule</h4>
                </div>
                <!--end page-title-box-->
            </div>
            <!--end col-->
        </div>
        <!-- end page title end breadcrumb -->


        <div class="row">
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
            <asp:Label ID="lbl_error" runat="server" class="form-check-label" Text=""></asp:Label>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Payment Schedule</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                               
                                <form>
                                    <div class="form-group">
                                        <label class="form-check-label">Booking Type</label>
                                        <asp:DropDownList ID="dd_booking" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource5" DataTextField="booking_type" DataValueField="booking_type_id"></asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource5" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.booking_typeTableAdapter" UpdateMethod="Update">
                                      
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Shift</label>
                                        <asp:DropDownList ID="dd_shift" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="time_slot" DataValueField="shift_id"></asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.shiftTableAdapter" UpdateMethod="Update">
                                      
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Day</label>
                                        <asp:DropDownList ID="dd_days" runat="server" CssClass="form-control" DataSourceID="ObjectDataSource4" DataTextField="day" DataValueField="day_id"></asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource4" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.week_daysTableAdapter">
                                     
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Team Catagory</label>
                                        <asp:DropDownList CssClass="form-control" ID="dd_team" runat="server" DataSourceID="ObjectDataSource7" DataTextField="team_title" DataValueField="team_category_id">
                                        </asp:DropDownList>

                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource7" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.team_categoryTableAdapter" UpdateMethod="Update">
                                      
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Policy</label>
                                        <asp:DropDownList  CssClass="form-control" ID="dd_policy" runat="server" DataSourceID="ObjectDataSource3" DataTextField="title_year" DataValueField="policy_id"></asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.policyTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
                                         
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Charges</label>
                                        <asp:TextBox ID="txt_charges"  CssClass="form-control" type="number" required="required" MaxLength="5" runat="server"></asp:TextBox>
                                       
                                    </div>
                                    <div class="form-group">
                                       <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_status" runat="server" />
                                    </div>

                                    <div class="form-group">    
                                                                          
                                        <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" AutoPostBack="true" CssClass="btn btn-gradient-primary" />
                                    </div>
                                </form> 
                                <div class="cax rd-body">
                          
                                    <asp:GridView ID="gdv_payschedule" CssClass="table table-bordered font-12" OnRowCommand="gdv_payschedule_RowCommand" runat="server" AutoGenerateColumns="False"  AllowPaging="True" PageSize="20" DataKeyNames="schedule_id,policy_id,booking_type_id,shift_id,day_id,team_category_id,vanue_id" DataSourceID="ObjectDataSource2">
                                        <Columns>
                                            <asp:BoundField DataField="policy_title" HeaderText="Policy" SortExpression="policy_title"></asp:BoundField>
                                            <asp:BoundField DataField="vanue_title" HeaderText="Venue" SortExpression="vanue_title"></asp:BoundField>
                                            <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day"></asp:BoundField>
                                            <asp:BoundField DataField="booking_type" HeaderText="Booking Type" SortExpression="booking_type"></asp:BoundField>
                                            <asp:BoundField DataField="team_title" HeaderText="Team Category" SortExpression="team_title"></asp:BoundField>
                                            <asp:BoundField DataField="charges_amount" HeaderText="Charges" SortExpression="charges_amount"></asp:BoundField>
                                            <asp:CheckBoxField DataField="schedule_status" HeaderText="Status" SortExpression="schedule_status"></asp:CheckBoxField>
                                            <asp:BoundField DataField="time_slot" HeaderText="Time" ReadOnly="True" SortExpression="time_slot"></asp:BoundField>
                                            <asp:BoundField DataField="schedule_id" HeaderText="schedule_id" ReadOnly="True" InsertVisible="False" SortExpression="schedule_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="policy_id" HeaderText="policy_id" SortExpression="policy_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="booking_type_id" HeaderText="booking_type_id" SortExpression="booking_type_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="shift_id" HeaderText="shift_id" SortExpression="shift_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="day_id" HeaderText="day_id" SortExpression="day_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="team_category_id" HeaderText="team_category_id" SortExpression="team_category_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="vanue_id" HeaderText="vanue_id" SortExpression="vanue_id" Visible="false"></asp:BoundField>
                                               <asp:ButtonField CommandName="Select" Text="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-gradient-success" ShowHeader="True" HeaderText="Edit"></asp:ButtonField>
                                        </Columns>
                                    </asp:GridView>


                                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.booking_pay_scheduleTableAdapter"></asp:ObjectDataSource>
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
     <script type="text/javascript">
    function showErrorModal(errorMessage) {
        // Set the error message in the modal
        document.getElementById('errorMessage').textContent = errorMessage;
        
        // Show the modal
        $('#errorModal').modal('show');
    }
</script>
</asp:Content>
