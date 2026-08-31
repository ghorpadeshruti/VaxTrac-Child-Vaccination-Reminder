using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChildVaccine
{
    public partial class ManageChildren : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("admin_login.aspx");
            }

            if (!IsPostBack)
            {
                LoadChildren();
            }
        }

        void LoadChildren()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BabyDetails", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvChildren.DataSource = dt;
                gvChildren.DataBind();
            }
        }
    }
}