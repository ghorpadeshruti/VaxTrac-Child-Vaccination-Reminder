using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ChildVaccine
{
    public partial class home : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string message = txtMessage.Text.Trim();

                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(@"
                INSERT INTO Contact (FullName, Email, Message)
                VALUES (@n, @e, @m)", con);

                    cmd.Parameters.AddWithValue("@n", name);
                    cmd.Parameters.AddWithValue("@e", email);
                    cmd.Parameters.AddWithValue("@m", message);

                    cmd.ExecuteNonQuery();
                }

                // clear fields
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";

                Response.Write("<script>alert('Message sent successfully');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "") + "');</script>");
            }
        }
    }
}