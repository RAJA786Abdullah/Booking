<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="BookingType.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.BookingType" %>




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
                    <h4 class="page-title">Booking Type</h4>
                </div>
                <!--end page-title-box-->
            </div>
            <!--end col-->
        </div>
        <!-- end page title end breadcrumb -->


        <div class="row">

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
           
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Booking Type</h4>
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="Btn_save" />
                            </Triggers>
                            <ContentTemplate>
                                <form>
                                    <div class="form-group">
                                        <label class="form-check-label">Venue</label>
                                        <asp:DropDownList ID="dd_venue" CssClass="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="vanue_title" DataValueField="vanue_id"></asp:DropDownList>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.vanueTableAdapter"></asp:ObjectDataSource>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txt_booking" CssClass="form-control" runat="server" aria-describedby="emailHelp" placeholder="Enter Booking Type"></asp:TextBox>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_booking" runat="server" class="form-check-label" />
                                    </div>
                                    <asp:Button ID="Btn_save" runat="server" Text="Submit" CssClass="btn btn-gradient-primary" OnClick="Btn_save_Click"/>


                                </form>
                                <div class="card-body">
                                    <asp:GridView ID="grd_booking_type" CssClass="table table-bordered font-12" OnRowCommand="grd_booking_type_RowCommand" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False" DataKeyNames="booking_type_id" DataSourceID="ObjectDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="vanue_title" HeaderText="Venue" SortExpression="vanue_title"></asp:BoundField>
                                            <asp:BoundField DataField="booking_type" HeaderText="Booking Type" SortExpression="booking_type"></asp:BoundField>
                                            <asp:CheckBoxField DataField="booking_type_status" HeaderText="Status" SortExpression="booking_type_status"></asp:CheckBoxField>
                                            <asp:BoundField DataField="booking_type_id" HeaderText="booking_type_id" ReadOnly="True" InsertVisible="False" SortExpression="booking_type_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="vanue_id" HeaderText="vanue_id" SortExpression="vanue_id" Visible="false"></asp:BoundField>
                                            <asp:ButtonField CommandName="Select" Text="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-gradient-success" ShowHeader="True" HeaderText="Edit"></asp:ButtonField>

                                        </Columns>
                                    </asp:GridView>
                                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy1" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.booking_typeTableAdapter"></asp:ObjectDataSource>
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
    <!--end card-->
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

