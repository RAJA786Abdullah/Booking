<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_booking_type.aspx.cs" EnableEventValidation="false"  Inherits="OnlineBooking.pages.frm_booking_type" %>


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
            <asp:Label ID="lbl_error" runat="server" class="form-check-label" Text=""></asp:Label>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Booking Type</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <triggers><asp:PostBackTrigger ControlID="Btn_save" /></triggers>

                            <ContentTemplate>

                                <form>
                                    <div class="form-group">

                                        <input type="text" class="form-control" runat="server" id="txt_booking" aria-describedby="emailHelp" placeholder="Enter Booking Type" />
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_booking" runat="server" class="form-check-label" />
                                    </div>

                                    <asp:Button ID="Btn_save" runat="server" CssClass="btn btn-gradient-primary" OnClick="Btn_save_Click" Text="Submit" />


                                </form>
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tblbook" runat="server" CssClass="table table-bordered">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Booking Status</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Status</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Edit</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>


                                        </asp:Table>
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
