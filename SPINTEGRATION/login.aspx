﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SPINTEGRATION.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" name="viewport">
  <title>Login &rsaquo; SP &mdash; Innovation</title>

  <link rel="stylesheet" href="../dist/modules/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../dist/modules/ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="../dist/modules/fontawesome/web-fonts-with-css/css/fontawesome-all.min.css">

  <link rel="stylesheet" href="../dist/css/demo.css">
  <link rel="stylesheet" href="../dist/css/style.css">
</head>
<body>
    <div id="app">
        <section class="section">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                        <div class="login-brand">
                            SP Innovation
           
                        </div>

                        <div class="card card-primary">
                            <div class="card-header">
                                <h4>Login</h4>
                            </div>

                            <div class="card-body">
                                <form method="POST" action="#" class="needs-validation" novalidate="" runat="server">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <asp:TextBox ID="txt_email" runat="server" class="form-control" name="email" TabIndex="1" required autofocus></asp:TextBox>
                                        <%--   <input id="email" type="email" class="form-control" name="email" tabindex="1" required autofocus>--%>
                                        <div class="invalid-feedback">
                                            Please fill in your email
                   
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password" class="d-block">
                                            Password
                     
                                        <div class="float-right">
                                            <a href="forgot.html">Forgot Password?
                                            </a>
                                        </div>
                                        </label>
                                        <%-- <input id="password" type="password" class="form-control" name="password" tabindex="2" required>--%>
                                        <asp:TextBox ID="txt_password" runat="server" class="form-control" TextMode="Password" name="password" TabIndex="2" required></asp:TextBox>
                                        <div class="invalid-feedback">
                                            please fill in your password
                   
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                                            <label class="custom-control-label" for="remember-me">Remember Me</label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="btn_login" runat="server" Text="Login" class="btn btn-primary btn-block" TabIndex="4" OnClick="btn_login_Click" />

                                    </div>
                                </form>
                            </div>
                        </div>
                        <%--<div class="mt-5 text-muted text-center">
                            Don't have an account? <a href="singup.aspx">Sing Up</a>
                        </div>--%>
                        <div class="simple-footer">
                            Copyright &copy; SP Innovation 2023
           
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script src="../dist/modules/jquery.min.js"></script>
    <script src="../dist/modules/popper.js"></script>
    <script src="../dist/modules/tooltip.js"></script>
    <script src="../dist/modules/bootstrap/js/bootstrap.min.js"></script>
    <script src="../dist/modules/nicescroll/jquery.nicescroll.min.js"></script>
    <script src="../dist/modules/moment.min.js"></script>
    <script src="../dist/modules/scroll-up-bar/dist/scroll-up-bar.min.js"></script>
    <script src="../dist/js/sa-functions.js"></script>

    <script src="../dist/js/scripts.js"></script>
    <script src="../dist/js/custom.js"></script>
    <script src="../dist/js/demo.js"></script>
</body>
</html>
