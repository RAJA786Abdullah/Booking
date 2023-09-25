<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_login.aspx.cs" Inherits="OnlineBooking.frm_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DHA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <%--<link rel="shortcut icon" href="../assets/images/favicon.ico" />--%>
    <link rel="shortcut icon" href="../assets/images/DHA_Logo.jfif"/>
    <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
   <%-- <link href="../assets/css/styleregi_login.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />--%>
</head>

<body class="account-body accountbg">
    
         <div class="row vh-100 ">
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

            <div class="col-12 align-self-center">
                <div class="auth-page">
                    <div class="card auth-card shadow-lg">
                        <div class="card-body">
                            <div class="px-3">
                                <div class="auth-logo-box">
                                    <a href="https://www.dhaquetta.org/" class="logo logo-admin" target="_blank"><img src="/assets/images/DHA_Logo.jfif" height="55" alt="DHA Quetta Logo" class="auth-logo" /></a>
                                </div><!--end auth-logo-box-->
                                
                                <div class="text-center auth-logo-text">
                                    <h4 class="mt-0 mb-3 mt-5">DHA Quetta Sports Club</h4>
                                    <p class="text-muted mb-0">Sign in to continue to sports club bookings.</p>  
                                </div> <!--end auth-logo-text-->  

                                <form id="form1" class="form-horizontal auth-form my-4" runat="server">
                                <%--<form class="" action="index.html">--%>
        
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <div class="input-group mb-3">
                                            <span class="auth-form-icon">
                                                <i class="dripicons-user"></i> 
                                            </span>                                                                                                              
                                            <asp:TextBox ID="txt_username" CssClass="form-control" runat="server" type="text" name="username" required="required" placeholder="Name"></asp:TextBox>
                                        </div>                                    
                                    </div><!--end form-group--> 
        
                                    <div class="form-group">
                                        <label for="userpassword">Password</label>                                            
                                        <div class="input-group mb-3"> 
                                            <span class="auth-form-icon">
                                                <i class="dripicons-lock"></i> 
                                            </span>                                                       
                                           <asp:TextBox ID="txt_password" cssClass="form-control" runat="server" type="password" name="password" required="required" placeholder="Password"></asp:TextBox>
                                        </div>                               
                                    </div><!--end form-group--> 
        
                                  
                                        </div><!--end col-> !ALSO COMMENT IT
                                    
                                    
                                <!--Comment ended here-->
                                <!--You can add captcha here-->

                                    <div class="form-group mb-0 row">
                                        <div class="col-12 mt-2">
                                            <asp:Button ID="btn_submit" CssClass="btn btn-gradient-primary btn-round btn-block waves-effect waves-light" ValidationGroup="loginVld" type="submit" value="Sign Up" runat="server" OnClick="btn_submit_Click" Text="Submit" />
                                           <%-- <button class="btn btn-gradient-primary btn-round btn-block waves-effect waves-light" type="submit">Log In <i class="fas fa-sign-in-alt ml-1"></i></button>--%>
                                        </div><!--end col--> 
                                    </div> 
                              <div class="form-group mb-0 row">
                                        <div class="col-12 mt-2">
                                            <br />
                                          <%-- <p>New user? <a href="pages/frm_registration.aspx">Register here</a></p>--%>
                                        </div><!--end col--> 
                                    </div><!--end form-group-->                           
                                </form><!--end form-->
                            </div><!--end /div-->


                            <!-- also commented this REGISTER NOW -->

                        <!--
                            <div class="m-3 text-center text-muted">
                                <p class="">Don't have an account ?  <a href="../authentication/auth-register.html" class="text-primary ml-2">Free Resister</a></p>
                            </div>
                        </div><!--end card-body->
                    </div>

                    -->
                        <!--end card-->

                        <!--Comment ended here -->



                        <!-- commented this LOGIN WITH GOOGLE FACEBOOK-->
                    <!--
                    <div class="account-social text-center mt-4">
                        <h6 class="my-4">Or Login With</h6>
                        <ul class="list-inline mb-4">
                            <li class="list-inline-item">
                                <a href="" class="">
                                    <i class="fab fa-facebook-f facebook"></i>
                                </a>                                    
                            </li>
                            <li class="list-inline-item">
                                <a href="" class="">
                                    <i class="fab fa-twitter twitter"></i>
                                </a>                                    
                            </li>
                            <li class="list-inline-item">
                                <a href="" class="">
                                    <i class="fab fa-google google"></i>
                                </a>                                    
                            </li>
                        </ul>
                    </div><!--end account-social->
                        -->

                        <!-- End comment here-->


                </div><!--end auth-page-->
            </div><!--end col-->           
        </div><!--end row-->

      </div>
  <%--  <script type="text/javascript">
    function showErrorModal(errorMessage) {
        // Set the error message in the modal
        document.getElementById('errorMessage').textContent = errorMessage;
        
        // Show the modal
        $('#errorModal').modal('show');
    }
</script>--%>
        <script type="text/javascript">
    function showErrorModal(errorMessage) {
        // Set the error message in the modal
        document.getElementById('errorMessage').textContent = errorMessage;
        
        // Show the modal
        $('#errorModal').modal('show');
    }
</script>
    <script>
    // Disable browser back button on the login page
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
        alert("Request Timeout: Please log in again.");
    });
</script>

</body>
</html>
