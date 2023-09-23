<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="frm_week_day.aspx.cs" Inherits="OnlineBooking.pages.frm_week_day" %>
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
                            <li class="breadcrumb-item active">Days</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Days</h4>
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
                        <h4 class="mt-0 header-title">Week Details</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                             
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tbldays" runat="server" CssClass="table table-bordered">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Days</asp:TableHeaderCell>
                                                <asp:TableHeaderCell CssClass="thead-light">Status</asp:TableHeaderCell>
                                               
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
