<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ChildVaccine.home" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>VaxTrack | Pediatric Excellence</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />

    <style>


        /* --- BRAND PALETTE --- */
        :root {
            --vax-primary: #7F56D9;      /* Main Purple */
            --vax-primary-soft: #F4EBFF; /* Soft Lavender Tint */
            --vax-bg: #F9F5FF;           /* Global Page Background */
            --vax-text-dark: #101828;
            --vax-text-muted: #667085;
            --vax-white: #FFFFFF;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: var(--vax-bg);
            color: var(--vax-text-dark);
            line-height: 1.6;
            scroll-behavior: smooth;
        }

        .container { max-width: 1200px; margin: 0 auto; padding: 0 2rem; }

        /* --- TRANSPARENT NAV --- */
        nav { 
            position: absolute; 
            top: 0; left: 0; right: 0; z-index: 1000;
            height: 100px;
            display: flex; justify-content: space-between; align-items: center; 
        }

        /* LOGO STYLE ADDED */
        .nav-logo { 
            font-size: 1.5rem; 
            font-weight: 800; 
            color: #5b21b6; 
            display: flex; 
            align-items: center; 
            gap: 10px;
            cursor: pointer;
        }
        .logo-icon {
            width: 35px;
            height: 35px;
            background: #7c3aed;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
        }

        .nav-links { display: flex; gap: 2.5rem; }
        .nav-links a { 
            text-decoration: none; color: var(--vax-text-muted); 
            font-size: 14px; font-weight: 600; transition: 0.3s;
        }
        .nav-links a:hover { color: var(--vax-primary); }

        /* --- BUTTONS --- */
        .btn-main {
            background: var(--vax-primary);
            color: white; border: none; padding: 0.8rem 2rem; border-radius: 12px;
            font-weight: 700; cursor: pointer; transition: all 0.3s ease;
            box-shadow: 0 4px 14px 0 rgba(127, 86, 217, 0.39);
            text-decoration: none; /* Added to keep link looking like a button */
            display: inline-block; /* Added for proper padding on links */
        }
        .btn-main:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(127, 86, 217, 0.23); }

        /* --- HERO SECTION --- */
        .hero { position: relative; padding: 180px 0 100px; overflow: hidden; }
        
        .hero::after {
            content: "VAX"; position: absolute; bottom: -50px; right: -50px;
            font-size: 30rem; font-weight: 900; color: rgba(127, 86, 217, 0.03); z-index: -1;
        }

        .hero-grid { display: grid; grid-template-columns: 1fr 1.1fr; gap: 4rem; align-items: center; }
        
        .hero-tag { 
            background: var(--vax-primary-soft); color: var(--vax-primary);
            padding: 6px 14px; border-radius: 20px; font-size: 13px; font-weight: 700;
            display: inline-block; margin-bottom: 1.5rem;
        }

        .hero-title { font-size: 4rem; line-height: 1.1; font-weight: 800; color: var(--vax-text-dark); margin-bottom: 1.5rem; }
        .hero-title span { color: var(--vax-primary); }
        .hero-desc { font-size: 1.15rem; color: var(--vax-text-muted); margin-bottom: 2.5rem; max-width: 500px; }

        .hero-image-container { position: relative; }
        .hero-image { 
            width: 100%; border-radius: 40px; 
            box-shadow: 0 32px 64px -12px rgba(16, 24, 40, 0.14);
            border: 8px solid white;
        }

        /* --- FEATURES SECTION --- */
        .features-section { padding: 100px 0; background-color: var(--vax-white); text-align: center; }
        .features-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 2rem; margin-top: 4rem; }
        .vax-card { 
            background: var(--vax-white); padding: 3rem 2.5rem; border-radius: 2.5rem; 
            border: 1px solid #F1F5F9; transition: 0.3s; text-align: left;
        }
        .vax-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(127, 86, 217, 0.1); }

        /* --- ABOUT US SECTION --- */
        .about-section { padding: 100px 0; background: var(--vax-bg); }
        .about-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 5rem; align-items: center; }
        .about-img { width: 100%; border-radius: 32px; box-shadow: 0 20px 40px rgba(0,0,0,0.05); }
        .about-check { display: flex; align-items: center; gap: 10px; font-weight: 700; color: var(--vax-text-dark); margin-bottom: 1rem; }
        .about-check span { color: var(--vax-primary); font-size: 1.2rem; }

        /* --- HOW IT WORKS --- */
        .steps-section { padding: 100px 0; background: white; border-radius: 100px 100px 0 0; }
        .section-header { text-align: center; margin-bottom: 5rem; }
        .section-header h2 { font-size: 2.5rem; font-weight: 800; margin-bottom: 1rem; }

        .steps-wrapper { 
            display: flex; justify-content: space-between; position: relative;
            max-width: 1000px; margin: 0 auto;
        }
        
        .steps-wrapper::before {
            content: ""; position: absolute; top: 35px; left: 10%; right: 10%;
            height: 2px; background: #EAECF0; z-index: 1;
        }

        .step-card { flex: 1; text-align: center; position: relative; z-index: 2; }
        .step-icon { 
            width: 70px; height: 70px; background: white; border: 2px solid var(--vax-primary);
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            margin: 0 auto 1.5rem; color: var(--vax-primary); font-weight: 800; font-size: 1.2rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .step-card h4 { font-weight: 800; text-transform: uppercase; letter-spacing: 1px; font-size: 13px; margin-bottom: 8px; }
        .step-card p { font-size: 14px; color: var(--vax-text-muted); }

        /* --- CONTACT CARD --- */
        .contact-area { padding: 100px 0; }
        .glass-card {
            background: white; border-radius: 32px; display: flex; overflow: hidden;
            box-shadow: 0 24px 48px -12px rgba(16, 24, 40, 0.08); border: 1px solid #EAECF0;
        }
        .contact-left { width: 40%; background: var(--vax-primary); padding: 4rem; color: white; }
        .contact-right { flex: 1; padding: 4rem; }
        
        .input-group { margin-bottom: 1.5rem; }
        .input-group label { display: block; font-size: 12px; font-weight: 700; color: var(--vax-text-muted); margin-bottom: 8px; text-transform: uppercase; }
        .form-control { 
            width: 100%; padding: 14px; border-radius: 12px; border: 1px solid #D0D5DD;
            background: #F9FAFB; outline: none; transition: 0.3s;
        }
        .form-control:focus { border-color: var(--vax-primary); box-shadow: 0 0 0 4px var(--vax-primary-soft); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <nav class="container">
            <div class="nav-logo">
                <div class="logo-icon">V</div>
                VaxTrack
            </div>
            <div class="nav-links">
                <a href="#features">Features</a>
                <a href="#about">About Us</a>
                <a href="#how">How it Works</a>
                <a href="#contact">Support</a>
            </div>
            <!-- Link to Login added here -->
            <a href="login.aspx" class="btn-main">Login</a>
        </nav>

        <section class="hero container">
            <div class="hero-grid">
                <div>
                    <span class="hero-tag">✨ Automated Health Tracking</span>
                    <h1 class="hero-title">Protect Your Child's Future with <span>Timely Vaccination</span></h1>
                    <p class="hero-desc">Personalized schedules, smart reminders, and verified records. VaxTrack ensures you never miss a critical health milestone.</p>
                    <div style="display: flex; gap: 1rem;">
                        <!-- Link to Register added here -->
                        <a href="register.aspx" class="btn-main" style="padding: 1.2rem 3rem;">Create Account</a>
                        <button type="button" style="background: white; border: 1px solid #D0D5DD; padding: 1.2rem 2rem; border-radius: 12px; font-weight: 700; color: var(--vax-text-dark); cursor: pointer;">View Demo</button>
                    </div>
                </div>
                <div class="hero-image-container">
                    <img src="images/banner5.jpeg" class="hero-image" alt="Child Health" />
                </div>
            </div>
        </section>

        <!-- FEATURES SECTION -->
        <section id="features" class="features-section">
            <div class="container">
                <h2 style="font-size: 2.25rem; font-weight: 800;">Empowering Parents</h2>
                <p style="color: var(--vax-text-muted); margin-top: 0.5rem;">Designed to be simple, reliable ensuring every child receives the care they deserve</p>
                <div class="features-grid">
                    <div class="vax-card">
                        <span style="font-size: 2rem; margin-bottom: 1.5rem; display: block;">⏱</span>
                        <h3 style="font-weight: 800; margin-bottom: 1rem;">Auto Scheduling</h3>
                        <p style="color: var(--vax-text-muted); font-size: 0.9rem;">Smart calendars generated based on birth date and national standards.</p>
                    </div>
                    <div class="vax-card">
                        <span style="font-size: 2rem; margin-bottom: 1.5rem; display: block;">🔔</span>
                        <h3 style="font-weight: 800; margin-bottom: 1rem;">Smart Reminders</h3>
                        <p style="color: var(--vax-text-muted); font-size: 0.9rem;">Receive automated alerts via SMS and email before every scheduled dose.</p>
                    </div>
                    <div class="vax-card">
                        <span style="font-size: 2rem; margin-bottom: 1.5rem; display: block;">📊</span>
                        <h3 style="font-weight: 800; margin-bottom: 1rem;">Unified Dashboard</h3>
                        <p style="color: var(--vax-text-muted); font-size: 0.9rem;">Manage multiple child profiles and history from one secure, easy place.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- ABOUT US SECTION -->
        <section id="about" class="about-section">
            <div class="container about-grid">
                <div>
                    <img src="images/banner6.jpeg" class="about-img" alt="About VaxTrack" />
                </div>
                <div>
                    <span class="hero-tag">Our Mission</span>
                    <h2 style="font-size: 2.5rem; font-weight: 800; margin-bottom: 1.5rem;">Dedicated to Every Child's Health Journey</h2>
                    <p style="color: var(--vax-text-muted); font-size: 1.1rem; margin-bottom: 2rem;">VaxTrack was developed to empower parents with the information they need to protect their families. By leveraging automation, we ensure that medical schedules never get in the way of a child's health.</p>
                    <div class="about-check"><span>✓</span> Reliable Data Security</div>
                    <div class="about-check"><span>✓</span> User-Centric Design</div>
                    <div class="about-check"><span>✓</span> Real-time Medical Alerts</div>
                </div>
            </div>
        </section>

        <section id="how" class="steps-section">
            <div class="container">
                <div class="section-header">
                    <h2>Getting Started is Easy</h2>
                    <p style="color: var(--vax-text-muted);">Four simple steps to ensure your child's lifelong health</p>
                </div>

                <div class="steps-wrapper">
                    <!-- Wrapped Step 1 in a link to Register -->
                    <a href="register.aspx" style="text-decoration: none; color: inherit; flex: 1;">
                        <div class="step-card">
                            <div class="step-icon">1</div>
                            <h4>Register</h4>
                            <p>Sign up with your email</p>
                        </div>
                    </a>
                    <div class="step-card">
                        <div class="step-icon">2</div>
                        <h4>Add Child</h4>
                        <p>Enter child details</p>
                    </div>
                    <div class="step-card">
                        <div class="step-icon">3</div>
                        <h4>Auto Schedule</h4>
                        <p>Smart roadmap generated</p>
                    </div>
                    <div class="step-card">
                        <div class="step-icon">4</div>
                        <h4>Get Notified</h4>
                        <p>Alerts for upcoming doses</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="contact" class="contact-area container">
            <div class="glass-card">
                <div class="contact-left">
                    <h2 style="font-size: 2rem; margin-bottom: 1rem;">Contact Us</h2>
                    <p style="opacity: 0.8; margin-bottom: 2rem;">Our support team is here to help you</p>
                    <div style="margin-bottom: 1rem;">📍 Global Pediatric HQ</div>
                    <div>📞 1800-VAX-TRACK</div>
                </div>
                <div class="contact-right">
                   <div class="input-group">
                      <label>Full Name</label>
                     <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                <div class="input-group">
                     <label>Email Address</label>
                       <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

                <div class="input-group">
                         <label>Your Message</label>
                           <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                </div>

            <asp:Button ID="btnSend" runat="server" Text="Send Message"
                         CssClass="btn-main"
                         OnClick="btnSend_Click" />
                </div>
            </div>
        </section>

        <footer style="padding: 3rem 0; text-align: center; color: var(--vax-text-muted); font-size: 14px; border-top: 1px solid #EAECF0; background: white;">
            &copy; 2026 VaxTrack Systems. Built for Pediatric Excellence.
        </footer>

    </form>
</body>
</html>