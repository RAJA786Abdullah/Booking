<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_shift_timing.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_shift_timing" %>

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
                            <li class="breadcrumb-item active">Time Shifts</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Time Shifts</h4>
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
            <asp:Label ID="lbl_error" runat="server" CssClass="form-check-label" Text=""></asp:Label>
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
                                        <label class="form-check-label">Shift Title</label>
                                        <asp:TextBox ID="txt_shift" CssClass="form-control"  runat="server" required="required"></asp:TextBox>
                                                </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Season</label>

                                       <asp:DropDownList ID="dd_season" CssClass="form-control" runat="server" 
                                        DataTextField="Season" DataValueField="SEASON">
                                           <asp:ListItem Text="Seect Season" Value="Seect Season" />
                                        <asp:ListItem Text="SUMMER" Value="SUMMER" />
                                        <asp:ListItem Text="WINTER" Value="WINTER" />
                                           
                                    </asp:DropDownList>                                     
                                    </div>
                                    <div class="form-group">
                                        <label class="form-check-label">Start Time</label>
                                       <input type="time" id="dtp_start" class="form-control" runat="server" name="starttime"/>     </div>
                                    <div class="form-group">
                                        <label class="form-check-label">End Time</label>
                                        <input type="time" id="dtp_end" class="form-control" runat="server" name="endtime" />
                                        <%--<input type="hidden" id="hiddenStarttime" runat="server" />--%>
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
                                      <div class="form-group">
                                          <asp:GridView ID="grd_slot" runat="server" CssClass="table table-bordered font-12" OnRowCommand="grd_slot_RowCommand" DataKeyNames="shift_id" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">

                                              <Columns>
                                                  <asp:BoundField DataField="shift_id" HeaderText="shift_id" ReadOnly="True" InsertVisible="False" Visible="false" SortExpression="shift_id"></asp:BoundField>
                                                  <asp:BoundField DataField="shift_title" HeaderText="Shift Title" SortExpression="shift_title"></asp:BoundField>
                                                   <asp:BoundField DataField="season" HeaderText="Season" SortExpression="season"></asp:BoundField>
                                                   <asp:BoundField DataField="time_from" HeaderText="Start Time" SortExpression="time_from"></asp:BoundField>
                                                  <asp:BoundField DataField="time_to" HeaderText="End Time" SortExpression="time_to"></asp:BoundField>
                                                  <asp:CheckBoxField DataField="shift_status" HeaderText="Status" SortExpression="shift_status"></asp:CheckBoxField>
                                                  <asp:ButtonField CommandName="Select" Text="Edit" ButtonType="Button" ControlStyle-CssClass="btn btn-gradient-success" ShowHeader="True" HeaderText="Edit"></asp:ButtonField>
                                              </Columns>
                                          </asp:GridView>

                                          <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.shift_slotsTableAdapter" UpdateMethod="Update">
                                              <DeleteParameters>
                                                  <asp:Parameter Name="Original_shift_id" Type="Int32"></asp:Parameter>
                                              </DeleteParameters>
                                              <InsertParameters>
                                                  <asp:Parameter Name="shift_title" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="shift_status" Type="Boolean"></asp:Parameter>
                                                  <asp:Parameter Name="time_from" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="time_to" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="season" Type="String"></asp:Parameter>
                                              </InsertParameters>
                                              <UpdateParameters>
                                                  <asp:Parameter Name="shift_title" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="shift_status" Type="Boolean"></asp:Parameter>
                                                  <asp:Parameter Name="time_from" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="time_to" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="season" Type="String"></asp:Parameter>
                                                  <asp:Parameter Name="Original_shift_id" Type="Int32"></asp:Parameter>
                                              </UpdateParameters>
                                          </asp:ObjectDataSource>
                                      </div>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                     <%--   <script>
                            function updateentime(selectedEndTime) {
                                document.getElementById('<%= hiddenEndtime.ClientID %>').value = selectedEndTime;
                          }
                            
                        </script>
                        <script>
                            function updatestarttime(selectedStartTime) {
                                document.getElementById('<%= hiddenStarttime.ClientID %>').value = selectedStartTime
                            }
                        </script>--%>
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
