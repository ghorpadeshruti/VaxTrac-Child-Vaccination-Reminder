<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="ChildVaccine.DashBoard" %>


<!DOCTYPE html>
<html>
<head runat="server">
    <title>VaxTrack | Dashboard</title>
    <!-- Modern Font -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    
    <style>
        /* Base Reset & Layout */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #f8fafc; 
            color: #1e293b;
            display: flex;
            min-height: 100vh;
        }

        /* White Sidebar Styling */
        .sidebar { 
            width: 280px; 
            background-color: #ffffff; 
            color: #64748b; 
            position: fixed; 
            height: 100vh; 
            border-right: 1px solid #e2e8f0;
            display: flex;
            flex-direction: column;
            padding: 2rem 1.5rem;
            z-index: 50;
        }
        .logo { 
            font-size: 1.5rem; 
            font-weight: 800; 
            color: #6D28D9; 
            margin-bottom: 2.5rem; 
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .nav-link { 
            display: flex; 
            align-items: center; 
            gap: 1rem; 
            padding: 0.875rem 1rem; 
            border-radius: 12px; 
            text-decoration: none; 
            color: #64748b; 
            font-weight: 600;
            transition: all 0.2s;
            margin-bottom: 0.5rem;
        }
        .nav-link.active { background-color: #f5f3ff; color: #6D28D9; }
        .nav-link:hover:not(.active) { background-color: #f8fafc; color: #1e293b; }

        /* Main Content */
        .main-content { margin-left: 280px; flex-grow: 1; padding: 3rem; }
        
        .header { display: flex; justify-between; align-items: center; margin-bottom: 2.5rem; }
        .header-title h1 { font-size: 1.875rem; font-weight: 800; color: #1e293b; }
        .header-title p { color: #64748b; font-weight: 500; }

        /* Dropdown Styling */
        .child-selector { background: white; padding: 0.5rem; border-radius: 1rem; border: 1px solid #e2e8f0; display: flex; align-items: center; gap: 1rem; }
        .dropdown { border: none; font-weight: 700; color: #6D28D9; cursor: pointer; outline: none; background: #f8fafc; padding: 0.5rem 1rem; border-radius: 0.75rem; }

        /* Hero Banner */
        .hero-banner { 
            background: linear-gradient(to right, #818CF8, #6D28D9); 
            border-radius: 2.5rem; 
            padding: 2.5rem; 
            color: white; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            margin-bottom: 2.5rem;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 25px -5px rgba(109, 40, 217, 0.1);
        }
        .banner-img { width: 180px; height: 180px; border-radius: 50%; object-fit: cover; border: 8px solid rgba(255,255,255,0.2); z-index: 10; }

        /* Stats Cards */
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem; margin-bottom: 2.5rem; }
        .stat-card { background: white; padding: 2rem; border-radius: 2.5rem; border: 1px solid #e2e8f0; transition: transform 0.2s; }
        .stat-card:hover { transform: translateY(-4px); }
        .stat-label { font-size: 0.7rem; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.1em; }
        
        /* Progress Bar */
        /* Progress Bar - FIXED & IMPROVED */
.progress-container {
    margin-top: 1.5rem;
}

.progress-bar-bg {
    width: 100%;
    background: #e2e8f0;
    height: 18px;              /* ⬆ increased height */
    border-radius: 999px;
    overflow: hidden;
    box-shadow: inset 0 2px 4px rgba(0,0,0,0.05);
}

.progress-bar-fill {
    background: linear-gradient(90deg, #6D28D9, #8B5CF6);
    height: 100%;
    width: 0%;
    border-radius: 999px;
    transition: width 1.2s ease-in-out;
}

        /* Table Styling */
        .table-container { 
    background: white; 
    border-radius: 2.5rem; 
    padding: 2.5rem; 
    border: 1px solid #e2e8f0; 
}

table { 
    width: 100%; 
    border-collapse: collapse; 
}

th { 
    text-align: left; 
    padding-bottom: 1.5rem; 
    font-size: 0.7rem; 
    color: #94a3b8; 
    text-transform: uppercase; 
    letter-spacing: 0.1em; 
    border-bottom: 1px solid #f1f5f9; 
}

td { 
    padding: 1.5rem 0; 
    border-bottom: 1px solid #f8fafc; 
    font-weight: 600; 
}

/* BADGES */
.badge { 
    padding: 0.5rem 1rem; 
    border-radius: 12px; 
    font-size: 0.65rem; 
    font-weight: 800; 
    text-transform: uppercase; 
}

.badge-pending { 
    background: #fffbeb; 
    color: #d97706; 
    border: 1px solid #fef3c7; 
}

.badge-done { 
    background: #ecfdf5; 
    color: #059669; 
    border: 1px solid #d1fae5; 
}

/* ✅ ADD THIS NEW */
.badge-missed {
    background: #fee2e2;
    color: #dc2626;
    border: 1px solid #fecaca;
}

/* BUTTON */
.btn-mark { 
    background: #f5f3ff; 
    color: #6D28D9; 
    padding: 0.75rem 1.5rem; 
    border-radius: 1rem; 
    text-decoration: none; 
    font-size: 0.75rem; 
    font-weight: 800; 
    transition: all 0.2s; 
}

.btn-mark:hover { 
    background: #6D28D9; 
    color: white; 
}
.logout-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;

    width: 100%;
    padding: 12px 16px;

    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;

    border-radius: 14px;

    font-weight: 700;
    font-size: 0.9rem;

    text-decoration: none;

    box-shadow: 0 10px 20px rgba(239, 68, 68, 0.2);

    transition: all 0.25s ease-in-out;
}

.logout-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 25px rgba(239, 68, 68, 0.3);
    background: linear-gradient(135deg, #dc2626, #b91c1c);
}

.logout-btn i {
    font-size: 1rem;
}
    </style>
</head>
<body>
    <form id="form1" runat="server" style="display:contents;">
        <!-- SIDEBAR -->
        <aside class="sidebar">
            <div class="logo">
                <i class="fas fa-shield-virus"></i> VaxTrack
            </div>
            <nav style="flex-grow: 1;">
                <a href="#" class="nav-link active"><i class="fas fa-th-large"></i> Dashboard</a>
             
                <a href="parent.aspx" class="nav-link"><i class="fas fa-child"></i> Add Baby</a>
            </nav>
            <div style="margin-top:auto;">
    <div style="margin-top:auto; padding-top: 20px;">
    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click"
        CssClass="logout-btn">
        <i class="fas fa-sign-out-alt"></i> Logout
    </asp:LinkButton>
</div>
</div>
        </aside>

        <!-- MAIN CONTENT -->
        <main class="main-content">
            <header class="header" style="display: flex; justify-content: space-between;">
                <div class="header-title">
                    <h1>Health Dashboard</h1>
                    <p>Monitoring your child's immunization status</p>
                </div>
                <div class="child-selector">
                    <span style="font-size: 0.75rem; font-weight: 800; color: #94a3b8; padding-left: 10px;">SELECT CHILD:</span>
                    <asp:DropDownList ID="ddlChild" runat="server" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlChild_SelectedIndexChanged" CssClass="dropdown">
                    </asp:DropDownList>
                    
                </div>
            </header>

            <section class="hero-banner">
                <div style="z-index: 10;">
                    <h2 style="font-size: 2.5rem; font-weight: 800; margin-bottom: 0.5rem;">Hello ! 👋</h2>
                    <p style="font-size: 1.1rem; opacity: 0.9; margin-bottom: 2rem;">Stay on top of your child's health. You have a vaccination coming up soon.</p>
                    <asp:Label ID="lblReminder" runat="server" style="background: rgba(239, 68, 68, 0.2); padding: 0.5rem 1rem; border-radius: 8px; font-weight: 700; font-size: 0.875rem;"></asp:Label>
                </div>
                <img src="images/banner5.jpeg" alt="Baby" class="banner-img" />
            </section>

            <div class="stats-grid">
                <div class="stat-card">
                    <p class="stat-label">Next Dose</p>
                    <h3 style="font-size: 1.5rem; font-weight: 800; margin: 0.5rem 0;"><asp:Label ID="lblVaccine" runat="server" Text="N/A"></asp:Label></h3>
                    <p style="color: #6D28D9; font-weight: 700; font-size: 0.875rem;">
                        <i class="far fa-calendar-alt"></i> <asp:Label ID="lblDate" runat="server"></asp:Label>
                        <span style="color: #cbd5e1; margin: 0 0.5rem;">|</span>
                        <asp:Label ID="lblDays" runat="server" style="color: #64748b;"></asp:Label>
                    </p>
                </div>

                <div class="stat-card">
                    <p class="stat-label">Child Details</p>
                    <h3 style="font-size: 1.5rem; font-weight: 800; margin: 0.5rem 0;"><asp:Label ID="lblName" runat="server"></asp:Label></h3>
                    <div style="display: flex; gap: 8px;">
                        <span style="background: #f1f5f9; padding: 4px 12px; border-radius: 20px; font-size: 0.7rem; font-weight: 700;">Blood: <asp:Label ID="lblBlood" runat="server"></asp:Label></span>
                        <span style="background: #f1f5f9; padding: 4px 12px; border-radius: 20px; font-size: 0.7rem; font-weight: 700;">Age: <asp:Label ID="lblAge" runat="server"></asp:Label></span>
                    </div>
                </div>

                <div class="stat-card">
                    <div style="display: flex; justify-content: space-between; align-items: flex-end;">
                        <p class="stat-label">Immunity Progress</p>
                       <span id="percentText" runat="server"
                                                 style="font-size: 2rem; font-weight: 900; color: #6D28D9;">
                            0%
                        </span>
                    </div>
                    <div class="progress-container">
                        <div class="progress-bar-bg">
                            <div id="progressBar" runat="server" class="progress-bar-fill" style="width: 0%"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-container">
                <h4 style="font-size: 1.25rem; font-weight: 800; margin-bottom: 2rem;">Detailed Vaccination Schedule</h4>
                <table>
                    <thead>
                        <tr>
                            <th>Vaccine Name</th>
                            <th>Expected Date</th>
                            <th>Status</th>
                            <th style="text-align: right;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptVaccines" runat="server" OnItemCommand="rptVaccines_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td style="color: #334155; font-weight: 800;"><%# Eval("VaccineName") %></td>
                                    <td style="color: #64748b; font-size: 0.875rem;"><%# Eval("DueDate","{0:dd MMM yyyy}") %></td>
                                   <td>
                            <span class='<%# 
                                              Eval("Status").ToString() == "Completed" ? "badge badge-done" : 
                                                 Eval("Status").ToString() == "Missed" ? "badge badge-missed" : 
                                             "badge badge-pending" %>'>

                                                  <%# Eval("Status") %>
                                </span>
                            </td>
                                    <td style="text-align:right;">

<asp:Panel runat="server"
    Visible='<%# Eval("Status").ToString() != "Completed" %>'>

    <asp:LinkButton ID="btnDone"
        runat="server"
        CommandName="Done"
        CommandArgument='<%# Eval("VaccineName") %>'
        CssClass="btn-mark">
        Mark as Received
    </asp:LinkButton>

</asp:Panel>

<asp:Panel runat="server"
    Visible='<%# Eval("Status").ToString() == "Completed" %>'>

    <span style="color:green;font-weight:bold;">
        ✓ Received
    </span>

</asp:Panel>

</td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </main>
    </form>

</body>
</html>
