<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ChildVaccine.login" %>




<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VaxTrack - Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            height: 100vh;
            background-color: #E6E0F8;
            position: relative;
        }

        /* LEFT LOGO (same as other pages) */
        .navbar {
            position: absolute;
            top: 20px;
            left: 40px;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 22px;
            font-weight: bold;
            color: #5b1fe0;
        }

        .logo-icon {
            width: 35px;
            height: 35px;
            background: #7b2cff;
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: bold;
        }

        /* CENTER FIX ONLY */
        .page-wrapper {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            width: 380px;
            background: #fff;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.05);
            text-align: center;
        }

        .logo-icon-circle {
            width: 45px;
            height: 45px;
            background: #7b2cff;
            border-radius: 50%;
            margin: 0 auto 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 20px;
        }

        h2 {
            font-size: 26px;
            font-weight: 700;
            color: #333;
            margin-bottom: 5px;
        }

        .underline {
            width: 30px;
            height: 3px;
            background: #7b2cff;
            margin: 0 auto 20px;
            border-radius: 2px;
        }

        h3 {
            font-size: 18px;
            color: #333;
            margin-bottom: 8px;
        }

        .sub-text {
            font-size: 13px;
            color: #888;
            margin-bottom: 25px;
        }

        .input-label {
            text-align: left;
            display: block;
            font-size: 11px;
            font-weight: bold;
            color: #aaa;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

        .textbox {
            width: 100%;
            height: 45px;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 0 15px;
            font-size: 14px;
            background: #f8f9ff;
            outline: none;
        }

        .textbox:focus {
            border-color: #7b2cff;
        }

        .forgot-link {
            float: right;
            font-size: 11px;
            color: #7b2cff;
            text-decoration: none;
            font-weight: bold;
        }

        .checkbox-container {
            text-align: left;
            font-size: 13px;
            color: #777;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-signin {
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 25px;
            background: #8b5cf6;
            color: white;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-signin:hover {
            background: #7c3aed;
        }

        .footer-text {
            margin-top: 25px;
            font-size: 13px;
            color: #777;
        }

        .footer-text a {
            color: #7b2cff;
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- LEFT LOGO (FIXED SAME AS OTHER PAGES) -->
    <div class="navbar">
        <div class="logo-icon">V</div>
        VaxTrack
    </div>

    <!-- CENTER FORM -->
    <div class="page-wrapper">

        <div class="login-box">

            <div class="logo-icon-circle">💉</div>

            <h3>Welcome Back</h3>
            <p class="sub-text">Please enter your details to sign in.</p>

            <div class="input-container">
                <label class="input-label">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" ></asp:TextBox>
            </div>

            <div class="input-container">
                <label class="input-label">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" ></asp:TextBox>
            </div>

            <div class="checkbox-container">
                <asp:CheckBox ID="chkRemember" runat="server" />
                <span>Remember me for 30 days</span>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-signin"  OnClick="btnLogin_Click" />

            <div class="footer-text">
                Don't have an account? <a href="register.aspx">Create Account</a>
            </div>

        </div>

    </div>

</form>

</body>
</html>