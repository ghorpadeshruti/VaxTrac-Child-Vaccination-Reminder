<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageChildren.aspx.cs" Inherits="ChildVaccine.ManageChildren" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Children</title>

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

            <h2>Manage Children</h2>

            <asp:GridView
                ID="gvChildren"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="BabyID">

                <Columns>

                    <asp:BoundField DataField="BabyID" HeaderText="ID" />
                    <asp:BoundField DataField="ChildName" HeaderText="Child Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" />
                    <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                    <asp:BoundField DataField="ParentID" HeaderText="Parent ID" />

                </Columns>

            </asp:GridView>

            <br />

            <a href="admin_dash.aspx" class="back">Back Dashboard</a>

        </div>

    </form>
</body>
</html>