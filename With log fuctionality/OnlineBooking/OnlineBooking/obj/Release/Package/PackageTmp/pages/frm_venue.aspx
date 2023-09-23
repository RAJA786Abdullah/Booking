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
            <asp:Label ID="lbl_error" runat="server" class="form-check-label" Text=""></asp:Label>
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
                                        <input type="text" class="form-control" runat="server" id="txt_vanue" aria-describedby="emailHelp" placeholder="Enter Venue"/>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_vanue" runat="server" class="form-check-label" />
                                    </div>
                                    <%--<button type="submit" class="btn btn-gradient-primary">Submit</button>--%>
                                    <asp:Button ID="btn_save" runat="server" class="btn btn-gradient-primary" OnClick="btn_save_Click" Text="Submit" />
                                </form>
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tblvanue" runat="server" CssClass="table table-bordered">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Vanue</asp:TableHeaderCell>
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
