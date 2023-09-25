<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_registration.aspx.cs" Inherits="OnlineBooking.pages.frm_registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DHA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
         <link rel="shortcut icon" href="../assets/images/DHA_Logo.jfif"/>

    <!-- App css -->
       <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />

</head>
<body  class="account-body accountbg"  style=" height:145vh;">
         <div class="row vh-100 " style="margin:50px auto">
            <div class="col-12 align-self-center">
                <div class="auth-page" style="margin:35px auto;">
                    <div class="card auth-card shadow-lg">
                        <%--Enter modal here--%>

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
                        <div class="card-body">
                            <div class="px-3">
                                <div class="auth-logo-box">
                                    <a href="#" class="logo logo-admin"><img src="/assets/images/DHA_Logo.jfif" height="55" alt="logo" class="auth-logo" /></a>
                                </div><!--end auth-logo-box-->
                                
                                <div class="text-center auth-logo-text">
                                    <h4 class="mt-0 mb-3 mt-5">DHA Quetta Sports Club</h4>
                                    <p class="text-muted mb-0">DHA User Registration Form.</p>  
                                </div> <!--end auth-logo-text-->  

                                
								<form id="form1" class="form-horizontal auth-form my-4" runat="server">
								 <div class="form-group">
                                        <label for="username">directorate</label>
                                        <div class="input-group mb-3">                                                                                                         
                                            <asp:DropDownList ID="dd_directorate" class="form-control" runat="server" DataSourceID="ObjectDataSource1" DataTextField="dte_name" DataValueField="dte_id"></asp:DropDownList>
                                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.directorateTableAdapter" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_dte_id" Type="Int32"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="dte_name" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="dte_status" Type="Boolean"></asp:Parameter>
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="dte_name" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="dte_status" Type="Boolean"></asp:Parameter>
                                                    <asp:Parameter Name="Original_dte_id" Type="Int32"></asp:Parameter>
                                                </UpdateParameters>
                                            </asp:ObjectDataSource>
                                        </div>                                    
                                    </div>
									
									<div class="form-group">
                                        <label for="User role">User Role</label>
                                        <div class="input-group mb-3">
                                                                                                                                                      
                                            <asp:DropDownList ID="dd_userrole" class="form-control" runat="server" DataSourceID="ObjectDataSource2" DataTextField="role" DataValueField="role_id"></asp:DropDownList>
                                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.user_roleTableAdapter" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_role_id" Type="Int32"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="record_status" Type="Boolean"></asp:Parameter>
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="record_status" Type="Boolean"></asp:Parameter>
                                                    <asp:Parameter Name="Original_role_id" Type="Int32"></asp:Parameter>
                                                </UpdateParameters>
                                            </asp:ObjectDataSource>
                                        </div>                                    
                                    </div>
									<div class="form-group">
                                        <label for="name">Name</label>
                                        <div class="input-group mb-3">
                                            <asp:TextBox ID="txt_name" class="form-control" runat="server" placeholder="Name" />
                                            <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfvName" runat="server" ControlToValidate="txt_name" InitialValue="" ErrorMessage="Name is required." Display="Dynamic" ForeColor="Red" />
                                        </div>                                    
                                    </div>
									<div class="form-group">
                                        <label for="DHA No">DHA No</label>
                                        <div class="input-group mb-3">
                                             <asp:TextBox ID="txt_dhano" runat="server" class="form-control" type="name" name="name" placeholder="DHA Number"/>                                                                                                            
                                        </div>                                    
                                    </div>
        
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <div class="input-group mb-3">
                                            <asp:TextBox ID="txt_username" runat="server" class="form-control" type="name" name="name" placeholder="Username"  />
                                            <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfvUsername" runat="server" ControlToValidate="txt_username"
                                                InitialValue="" ErrorMessage="Username is required." Display="Dynamic" ForeColor="Red" />                                                                                                           
                                           
                                        </div>                                    
                                    </div><!--end form-group--> 

                                    <div class="form-group">
                                        <label for="useremail">Email</label>
                                        <div class="input-group mb-3">
                                            <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="abc@website.com" />
                                            <asp:RegularExpressionValidator ValidationGroup="vld1" ID="revEmail" runat="server" ControlToValidate="txt_email"
                                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Invalid email format." Display="Dynamic" ForeColor="Red" />                                                                                                            
                                        </div>                                    
                                    </div><!--end form-group-->
        
                                    <div class="form-group">
                                        <label for="userpassword">Password</label>                                            
                                        <div class="input-group mb-3"> 
                                             <asp:TextBox ID="txt_password" runat="server" class="form-control" required="required" MaxLength="20"  TextMode="Password" />                                                      
                                        </div>                               
                                    </div><!--end form-group--> 

                                    <div class="form-group">
                                        <label for="conf_password">Confirm Password</label>                                            
                                        <div class="input-group mb-3"> 
                                            <asp:TextBox ID="txt_confirmpassword" CssClass="form-control" runat="server" TextMode="Password" required="required" MaxLength="20" />   
                                            <asp:CompareValidator ID="cvPasswordMatch" runat="server" ValidationGroup="vld1" ControlToValidate="txt_confirmpassword"
                                            ControlToCompare="txt_password" Operator="Equal" Type="String" ErrorMessage="Passwords do not match." 
                                            Display="Dynamic" ForeColor="Red" />                                                
                                        </div>  
                                        
                                        <div class="form-group">
                                            <label for="Status">Status</label>                                            
                                            <div class="input-group mb-3">                                                
                                                <asp:CheckBox ID="chk_status" CssClass="form-check-input" Style="margin: 0 10px" Text ="Account Status" runat="server" />
                                            </div>                               
                                        </div>
                                    </div><!--end form-group--> 
        
                                    <div class="form-group mb-0 row">
                                        <div class="col-12 mt-2">
                                            <asp:Button ID="btn_submit" type="submit" CssClass="btn btn-gradient-primary btn-round btn-block waves-effect waves-light" ValidationGroup="vld1" value="Sign Up" runat="server" Text="Register" OnClick="btn_submit_Click" />
                                            
                                        </div><!--end col--> 
                                    </div> <!--end form-group-->    
                                     <div class="form-group mb-0 row">
                                        <div class="col-12 mt-2">
                                            <br />
                                           <p>Already a user? <a href="../Login.aspx">Login here</a></p>
                                        </div><!--end col--> 
                                    </div> <!--end form-group-->                          
                                </form><!--end form-->
                            </div><!--end /div-->
                            
                          
                        </div><!--end card-body-->
                    </div><!--end card-->
                </div><!--end auth-card-->
            </div><!--end col-->           
        </div><!--end row-->



            <%--<div class="container" >
                <div class="row justify-content-center">
                    <div class="c1">
               
                    <h1 class="form-title">Registration</h1>
                        <label for="username">Directorate</label>
                            <asp:DropDownList ID="dd_directorate" CssClass="form-control dropdown-menu-xl-left" Style="border-radius: 20px; border: solid 1px #cacaca;" runat="server" DataSourceID="ObjectDataSource2" DataTextField="dte_name" DataValueField="dte_id"></asp:DropDownList>
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.directorateTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_dte_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="dte_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="dte_status" Type="Boolean"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="dte_name" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="dte_status" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="Original_dte_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:ObjectDataSource>

                        <label for="username">User Role</label>
                            <asp:DropDownList ID="dd_userrole" CssClass="form-control dropdown-menu-xl-left" Style="border-radius: 20px; border: solid 1px #cacaca" runat="server" DataSourceID="ObjectDataSource1" DataTextField="role" DataValueField="role_id"></asp:DropDownList>

                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.user_roleTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_role_id" Type="Int32"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="record_status" Type="Boolean"></asp:Parameter>
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="role" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="record_status" Type="Boolean"></asp:Parameter>
                                    <asp:Parameter Name="Original_role_id" Type="Int32"></asp:Parameter>
                                </UpdateParameters>
                            </asp:ObjectDataSource>

                        <asp:Label ID="lblName" AssociatedControlID="txt_name" runat="server" Text="Name"></asp:Label>
                        <asp:TextBox ID="txt_name" runat="server" placeholder="Name" />
                        <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfvName" runat="server" ControlToValidate="txt_name" InitialValue="" ErrorMessage="Name is required." Display="Dynamic" ForeColor="Red" />


                        <label for="lbldhano">DHA No</label>
                        <asp:TextBox ID="txt_dhano" runat="server" type="name" name="name" placeholder="DHA Number" autofocus required></asp:TextBox>

                        <label for="usernale">User Name</label>
                        <asp:TextBox ID="txt_username" runat="server" type="name" name="name" placeholder="Username" autofocus required></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="vld1" ID="rfvUsername" runat="server" ControlToValidate="txt_username"
                            InitialValue="" ErrorMessage="Username is required." Display="Dynamic" ForeColor="Red" />

                        <asp:Label ID="lblEmail" AssociatedControlID="txt_email" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="txt_email" runat="server" placeholder="abc@website.com" />
                        <asp:RegularExpressionValidator ValidationGroup="vld1" ID="revEmail" runat="server" ControlToValidate="txt_email"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" ErrorMessage="Invalid email format." Display="Dynamic" ForeColor="Red" />

                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txt_password" Text="Password"></asp:Label>
                        <asp:TextBox ID="txt_password" runat="server" TextMode="Password" />

                        <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txt_confirmpassword" Text="Confirm Password"></asp:Label>
                        <asp:TextBox ID="txt_confirmpassword" runat="server" TextMode="Password" />

                        <asp:CompareValidator ID="cvPasswordMatch" runat="server" ValidationGroup="vld1" ControlToValidate="txt_confirmpassword"
                            ControlToCompare="txt_password" Operator="Equal" Type="String" ErrorMessage="Passwords do not match." 
                            Display="Dynamic" ForeColor="Red" />
                        <br />
                        
                        <asp:CheckBox ID="chk_status" CssClass="form-check-input" Style="margin: 0 10px" Text ="Account Status" runat="server" />
                        <br />
                        <asp:Label ID="lblalert" runat="server" Visible="false" Text="" ForeColor="Red" Font-Size="X-Large"></asp:Label>
                        <asp:Button ID="btn_submit" type="submit" ValidationGroup="vld1" value="Sign Up" runat="server" Text="Register" OnClick="btn_submit_Click" />
                        <p class="have-account-line">Already have an Account?<a href="booktype"> Sign in</a></p>
                   </div>   
                </div>
            </div>--%>

      <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>
              <script type="text/javascript">
    function showErrorModal(errorMessage) {
        // Set the error message in the modal
        document.getElementById('errorMessage').textContent = errorMessage;
        
        // Show the modal
        $('#errorModal').modal('show');
    }
</script>

</body>
</html>
