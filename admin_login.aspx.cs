using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ChildVaccine
{
    public partial class admin_login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT AdminID FROM Admins WHERE Username=@Username AND Password=@Password";

                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    con.Open();

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        Session["AdminID"] = result.ToString();

                        Response.Redirect("admin_dash.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(
                            this.GetType(),
                            "alert",
                            "alert('Invalid Username or Password');",
                            true);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "alert",
                    "alert('Error: " + ex.Message.Replace("'", "") + "');",
                    true);
            }
        }
    }
}