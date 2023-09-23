<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_registration.aspx.cs" Inherits="OnlineBooking.pages.frm_registration" %>

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
                        <p class="have-account-line">Already have an Account?<a href="frm_login.aspx"> Sign in</a></p>
                   </div>   
                </div>
            </div>
     
    </form>
            

</body>
</html>
