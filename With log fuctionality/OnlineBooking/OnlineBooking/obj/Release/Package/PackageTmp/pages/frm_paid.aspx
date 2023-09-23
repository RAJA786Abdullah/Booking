<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_paid.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.frm_paid" %>

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
                    <h4 class="page-title">Payment Details</h4>
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
                        <h4 class="mt-0 header-title">Payment Details</h4>
                        <br />

                          
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>                                                                
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-inline bg bg-danger col-md-4" style ="overflow:auto; flex-direction:row; justify-content:space-between; border-radius: 10px" runat="server" visible="false" id="popup">
                                        <asp:Label CssClass="alert alert-danger m-2 float-left"  Visible="false" ID="lbl_alert" runat="server" Text=""></asp:Label>
                                        <asp:Button ID="btn_alert" Visible="false" CssClass="btn btn-danger float-right" Style="padding: 8px; box-shadow: none" runat="server" Text="X" OnClick="btn_alert_Click" />
                                </div>
                                <div class="form-inline bg bg-success col-md-4" style ="overflow:auto; flex-direction:row; justify-content:space-between; border-radius: 10px" runat="server" visible="false" id="SuccesDiv">
                                        <asp:Label CssClass="alert alert-success m-2 float-left"  Visible="false" ID="lbl_succes" runat="server" Text=""></asp:Label>
                                        <asp:Button ID="btn_alrtscu" Visible="false" CssClass="btn btn-success float-right" Style="padding: 8px; box-shadow: none" runat="server" Text="X" OnClick="btn_alrtscu_Click" />
                                </div>
                                <form>
                                    <div class="form-group">
                                        <%--<label>Enter Vanue</label>--%>
                                        <input type="text" class="form-control" runat="server" id="txt_vchrno" aria-describedby="emailHelp" placeholder="Enter Voucher No"/>
                                    </div>                   
                                    <asp:Button ID="btn_sserch" runat="server" class="btn btn-gradient-primary" OnClick="btn_sserch_Click" Text="Submit" />
                                </form>
                                <div class="card-body">
                                      <div class="form-group">
                                        <asp:GridView ID="grd_paid" runat="server" CssClass="table table-bordered font-12" OnRowCommand="grd_paid_RowCommand" AutoGenerateColumns="False" DataKeyNames="customer_booking_id" DataSourceID="ObjectDataSource1" AllowPaging="True">
                                            <Columns>
                                                <asp:BoundField DataField="Booking_no" HeaderText="Booking No" SortExpression="Booking_no"></asp:BoundField>
                                                <asp:BoundField DataField="cnic" HeaderText="CNIC" SortExpression="cnic"></asp:BoundField>
                                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name"></asp:BoundField>
                                                <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day"></asp:BoundField>
                                                <asp:BoundField DataField="booking_type" HeaderText="Type" SortExpression="booking_type"></asp:BoundField>
                                                <asp:BoundField DataField="vanue_title" HeaderText="Vanue" SortExpression="vanue_title"></asp:BoundField>
                                                <asp:BoundField DataField="shift_title" HeaderText="Shift" SortExpression="shift_title"></asp:BoundField>
                                                <asp:BoundField DataField="customer_booking_id" HeaderText="customer_booking_id" Visible="false" SortExpression="customer_booking_id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="time_slot" HeaderText="Time Slot" SortExpression="time_slot" ReadOnly="True"></asp:BoundField>
                                                <asp:BoundField DataField="total_amount" HeaderText="Charges" SortExpression="total_amount"></asp:BoundField>
                                                <asp:BoundField DataField="mobile_no" HeaderText="Mobile #" Visible="false" SortExpression="mobile_no"></asp:BoundField>
                                                <asp:ButtonField CommandName="Select" Text="Mark Paid" ControlStyle-CssClass="btn btn-gradient-success" ButtonType="Button" ShowHeader="True" HeaderText="Mark Paid"></asp:ButtonField>
                                                <asp:ButtonField CommandName="SelectRcpt" Text="Reciept" ButtonType="Button" ControlStyle-CssClass="btn btn-gradient-info" ShowHeader="True" HeaderText="Reciept"></asp:ButtonField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.payment_detailsTableAdapter">
                                            <SelectParameters>
                                                <asp:SessionParameter SessionField="BOOKID" DefaultValue="0" Name="id" Type="Int32"></asp:SessionParameter>
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                        
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
    <!--end card-->


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="additionalscript" runat="server">

</asp:Content>
