using System;
using System.Data.SqlClient;
using System.Configuration;

namespace ChildVaccine
{
    public partial class login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT ParentID FROM Parents WHERE Email=@Email AND Password=@Password";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    con.Open();
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        int parentId = Convert.ToInt32(result);
                        Session["ParentID"] = parentId;

                        // ✅ SEND EMAIL ON LOGIN
                        ReminderService.SendDailyReminders();

                        // Check child exists
                        string childCheck = "SELECT COUNT(*) FROM BabyDetails WHERE ParentID=@ParentID";
                        SqlCommand checkCmd = new SqlCommand(childCheck, con);
                        checkCmd.Parameters.AddWithValue("@ParentID", parentId);

                        int childCount = (int)checkCmd.ExecuteScalar();

                        if (childCount > 0)
                        {
                            Response.Redirect("Dashboard.aspx", false);
                        }
                        else
                        {
                            Response.Redirect("parent.aspx", false);
                        }

                        Context.ApplicationInstance.CompleteRequest();
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Email or Password');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }
    }
}