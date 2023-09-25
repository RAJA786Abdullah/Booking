<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_venue.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_venue" %>

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
                            <li class="breadcrumb-item active">Venue</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Venue</h4>
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
            <asp:Label ID="lbl_error" Visible="false" runat="server" class="form-check-label" Text=""></asp:Label>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Venue Details</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <form>
                                    <div class="form-group">
                                        <%--<label>Enter Vanue</label>--%>
                                    
                                        <asp:TextBox ID="txt_venue" type="text" CssClass="form-control" runat="server" aria-describedby="emailHelp" placeholder="Enter Venue" ></asp:TextBox>

                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_vanue" runat="server" class="form-check-label" />
                                    </div>
                                    <%--<button type="submit" class="btn btn-gradient-primary">Submit</button>--%>
                                    <asp:Button ID="btn_save" runat="server" class="btn btn-gradient-primary" OnClick="btn_save_Click" Text="Submit" />
                                </form>
                                <div class="card-body">
                             
                                    <asp:GridView ID="grd_venue" CssClass="table table-bordered font-12" OnRowCommand="grd_venue_RowCommand"  runat="server"  AutoGenerateColumns="False"  AllowPaging="True" PageSize="20" DataKeyNames="vanue_id" DataSourceID="ObjectDataSource1">


                                        <Columns>
                                            <asp:BoundField DataField="vanue_id" HeaderText="vanue_id" ReadOnly="True" InsertVisible="False" SortExpression="vanue_id" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="vanue_title" HeaderText="Venue" SortExpression="vanue_title"></asp:BoundField>
                                            <asp:CheckBoxField DataField="vanue_status" HeaderText="Status" SortExpression="vanue_status"></asp:CheckBoxField>
                                               <asp:ButtonField CommandName="Select" Text="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-gradient-success" ShowHeader="True" HeaderText="Edit"></asp:ButtonField>

                                        </Columns>
                                    </asp:GridView>

                             
                                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.vanueTableAdapter" UpdateMethod="Update"></asp:ObjectDataSource>
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
