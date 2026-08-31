<%@ Page Language="C#" AutoEventWireup="true" Codefile="admin_dash.aspx.cs" Inherits="ChildVaccine.admin_dash" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Admin Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI';
}

body{
background:#f4f2ff;
}

.navbar{
background:white;
padding:20px 40px;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 2px 10px rgba(0,0,0,.05);
}

.logo{
font-size:24px;
font-weight:bold;
color:#7b2cff;
}

.container{
padding:40px;
}

.cards{
display:grid;
grid-template-columns:repeat(4,1fr);
gap:20px;
margin-bottom:40px;
}

.card{
background:white;
padding:25px;
border-radius:15px;
text-align:center;
box-shadow:0 5px 15px rgba(0,0,0,.05);
}

.count{
font-size:35px;
font-weight:bold;
color:#7b2cff;
}

.title{
margin-top:10px;
color:#666;
}

.menu{
display:grid;
grid-template-columns:repeat(2,1fr);
gap:20px;
}

.btn{
display:block;
padding:20px;
background:#7b2cff;
color:white;
text-decoration:none;
text-align:center;
border-radius:15px;
font-weight:bold;
}

.logout{
background:#dc3545;
border:none;
padding:12px 25px;
color:white;
border-radius:10px;
cursor:pointer;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="navbar">

<div class="logo">
VaxTrack Admin
</div>

<asp:Button
ID="btnLogout"
runat="server"
Text="Logout"
CssClass="logout"
OnClick="btnLogout_Click"/>

</div>

<div class="container">

<div class="cards">

<div class="card">
<div class="count">
<asp:Label ID="lblParents" runat="server"></asp:Label>
</div>
<div class="title">Parents</div>
</div>

<div class="card">
<div class="count">
<asp:Label ID="lblChildren" runat="server"></asp:Label>
</div>
<div class="title">Children</div>
</div>

<div class="card">
<div class="count">
<asp:Label ID="lblVaccines" runat="server"></asp:Label>
</div>
<div class="title">Vaccines</div>
</div>

<div class="card">
<div class="count">
<asp:Label ID="lblMessages" runat="server"></asp:Label>
</div>
<div class="title">Messages</div>
</div>

</div>

<div class="menu">

<a href="ManageParents.aspx" class="btn">
Manage Parents
</a>

<a href="ManageChildren.aspx" class="btn">
Manage Children
</a>

<a href="ManageVaccine.aspx" class="btn">
Manage Vaccines
</a>

<a href="ManageContact.aspx" class="btn">
Manage Contact
</a>

</div>

</div>

</form>

</body>
</html>
