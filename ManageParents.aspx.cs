using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChildVaccine
{
    public partial class ManageParents : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin login check
            if (Session["AdminID"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }

            if (!IsPostBack)
            {
                LoadParents();
            }
        }

        // Load data into GridView
        void LoadParents()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Parents", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvParents.DataSource = dt;
                gvParents.DataBind();
            }
        }
    }
}