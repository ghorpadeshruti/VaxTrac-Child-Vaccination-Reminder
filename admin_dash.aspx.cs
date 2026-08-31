using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ChildVaccine
{
    public partial class admin_dash : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("admin_login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCounts();
            }
        }

        private void LoadCounts()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                lblParents.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM Parents", con)
                    .ExecuteScalar().ToString();

                lblChildren.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM BabyDetails", con)
                    .ExecuteScalar().ToString();

                lblVaccines.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM Vaccines", con)
                    .ExecuteScalar().ToString();

                lblMessages.Text = new SqlCommand(
                    "SELECT COUNT(*) FROM Contact", con)
                    .ExecuteScalar().ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("admin_login.aspx");
        }
    }
}