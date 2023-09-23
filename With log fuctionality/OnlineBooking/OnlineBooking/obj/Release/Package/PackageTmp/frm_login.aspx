<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_login.aspx.cs" Inherits="OnlineBooking.pages.frm_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DHA</title>
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="../assets/images/favicon.ico" />

    <!-- App css -->
    <link href="../assets/css/styleregi_login.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
            <div class="container" >
                <div class="row justify-content-center">
                    <div class="c1">
                        <h1 class="form-title">Login</h1>

                        <label for="username">Name</label>
                        <asp:TextBox ID="txt_username" runat="server" type="text" name="username" placeholder="Name"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="rfvUsername" ValidationGroup="loginVld" runat="server" ControlToValidate="txt_username" InitialValue="" ErrorMessage="Username is required" Display="Dynamic" ForeColor="Red" />    
                        <label for="password">Password</label>
                        <asp:TextBox ID="txt_password" runat="server" type="password" name="password" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ValidationGroup="loginVld" ControlToValidate="txt_password" InitialValue="" ErrorMessage="Password is required" Display="Dynamic" ForeColor="Red" />
                        <br />
                        <asp:Button ID="btn_submit" CssClass="btn btn-soft-blue" ValidationGroup="loginVld" type="submit" value="Sign Up" runat="server" OnClick="btn_submit_Click" Text="Submit" />
                        <p class="have-account-line"><a href="frm_registration.aspx">Already have an Account? Sign in</a></p>
                    </div>
                </div>
            </div>

    </form>
</body>
</html>
