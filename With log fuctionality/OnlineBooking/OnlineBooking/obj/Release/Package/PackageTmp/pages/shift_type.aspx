<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Home.Master" AutoEventWireup="true" CodeBehind="shift_type.aspx.cs" EnableEventValidation="false" Inherits="OnlineBooking.pages.shift_type" %>
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
                            <li class="breadcrumb-item"><a href="javascript:void(0);">shift</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0);">Configuration</a></li>
                            <li class="breadcrumb-item active">shift</li>
                        </ol>
                    </div>
                    <h4 class="page-title">Shift</h4>
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
                        <h4 class="mt-0 header-title">Shift Details</h4>
                        <br />

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <form>
                                    <div class="form-group">
                                        <%--<label>Enter Vanue</label>--%>
                                        <input type="text" class="form-control" runat="server" id="txt_shift" aria-describedby="emailHelp" placeholder="Enter Shift"/>
                                    </div>
                                    <div class="form-group form-check">
                                        <label class="form-check-label">Status</label>
                                        <asp:CheckBox ID="chk_shift" runat="server" class="form-check-label" />
                                    </div>
                                    <%--<button type="submit" class="btn btn-gradient-primary">Submit</button>--%>
                                    <asp:Button ID="btn_save" runat="server" class="btn btn-gradient-primary" onclick="btn_save_Click" Text="Submit" />
                                </form>
                                <div class="card-body">
                                    <div class="table-responsive dash-social">
                                        <asp:Table ID="tblshift" runat="server" CssClass="table table-bordered">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell CssClass="thead-light">Shifts</asp:TableHeaderCell>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="additionalscript" runat="server">
</asp:Content>
