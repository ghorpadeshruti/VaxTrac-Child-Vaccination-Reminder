<%@ Page Language="C#" AutoEventWireup="true" Codefile="admin_login.aspx.cs" Inherits="ChildVaccine.admin_login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>VaxTrack - Admin Login</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
background:#f4f2ff;
display:flex;
justify-content:center;
align-items:center;
}

.logo{
position:absolute;
top:20px;
left:40px;
display:flex;
align-items:center;
gap:8px;
font-size:22px;
font-weight:bold;
color:#5b21b6;
}

.logo-icon{
width:35px;
height:35px;
background:#7b2cff;
border-radius:8px;
display:flex;
justify-content:center;
align-items:center;
color:white;
font-weight:bold;
}

.login-box{
width:380px;
background:white;
padding:35px;
border-radius:20px;
box-shadow:0 10px 30px rgba(0,0,0,.08);
text-align:center;
}

.admin-icon{
width:55px;
height:55px;
background:#7b2cff;
border-radius:50%;
margin:auto;
display:flex;
justify-content:center;
align-items:center;
color:white;
font-size:22px;
margin-bottom:15px;
}

h2{
color:#333;
margin-bottom:5px;
}

.sub-text{
font-size:13px;
color:#777;
margin-bottom:25px;
}

.textbox{
width:100%;
height:45px;
padding:0 15px;
margin-bottom:15px;
border:1px solid #ddd;
border-radius:10px;
background:#f9faff;
outline:none;
}

.textbox:focus{
border-color:#7b2cff;
}

.btn{
width:100%;
height:48px;
border:none;
border-radius:25px;
background:#7b2cff;
color:white;
font-size:15px;
font-weight:600;
cursor:pointer;
}

.btn:hover{
background:#5b1fe0;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="logo">
<div class="logo-icon">V</div>
VaxTrack
</div>

<div class="login-box">

<div class="admin-icon">🛡️</div>

<h2>Admin Login</h2>

<p class="sub-text">
Login to manage parents, children and vaccines
</p>

<asp:TextBox
ID="txtUsername"
runat="server"
CssClass="textbox"
placeholder="Username">
</asp:TextBox>

<asp:TextBox
ID="txtPassword"
runat="server"
TextMode="Password"
CssClass="textbox"
placeholder="Password">
</asp:TextBox>

<asp:Button
ID="btnLogin"
runat="server"
Text="Login"
CssClass="btn"
OnClick="btnLogin_Click"/>
<a href="home.aspx">Back</a>
</div>
    

</form>

</body>
</html>