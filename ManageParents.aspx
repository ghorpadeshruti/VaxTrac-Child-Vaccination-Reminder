<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageParents.aspx.cs" Inherits="ChildVaccine.ManageParents" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Parents</title>

    <style>
        body {
            font-family: 'Segoe UI';
            background: #f4f2ff;
            padding: 30px;
        }

        .box {
            background: white;
            padding: 25px;
            border-radius: 15px;
        }

        h2 {
            color: #7b2cff;
            margin-bottom: 20px;
        }

        .grid {
            width: 100%;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background: #7b2cff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="box">

            <h2>Manage Parents</h2>

            <!-- VIEW ONLY GRID -->
            <asp:GridView
                ID="gvParents"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="ParentID">

                <Columns>
                    <asp:BoundField DataField="ParentID" HeaderText="ID" />
                    <asp:BoundField DataField="FullName" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                </Columns>

            </asp:GridView>

            <br />

            <a href="admin_dash.aspx" class="back">Back Dashboard</a>

        </div>

    </form>
</body>
</html>