using System;

using System.Data;

using System.Data.SqlClient;

using System.Configuration;



namespace ChildVaccine

{

    public partial class DashBoard : System.Web.UI.Page

    {

        string cs = ConfigurationManager.ConnectionStrings["ChildConnectionString"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)

        {

            if (Session["ParentID"] == null)

            {

                Response.Redirect("login.aspx");

            }



            if (!IsPostBack)

            {

                LoadChildren();

                LoadDashboard();

            }

        }



        protected void ddlChild_SelectedIndexChanged(object sender, EventArgs e)

        {

            LoadDashboard();

        }



        // CHILD LIST

        void LoadChildren()

        {

            using (SqlConnection con = new SqlConnection(cs))

            {

                SqlDataAdapter da = new SqlDataAdapter(

                    "SELECT BabyID, ChildName FROM BabyDetails WHERE ParentID=@pid", con);



                da.SelectCommand.Parameters.AddWithValue("@pid", Session["ParentID"]);



                DataTable dt = new DataTable();

                con.Open();

                da.Fill(dt);

                con.Close();



                ddlChild.DataSource = dt;

                ddlChild.DataTextField = "ChildName";

                ddlChild.DataValueField = "BabyID";

                ddlChild.DataBind();

            }

        }



        void LoadDashboard()

        {

            if (ddlChild.Items.Count == 0) return;



            int id = Convert.ToInt32(ddlChild.SelectedValue);



            LoadChild(id);

            LoadNextVaccine(id);

            LoadUpcoming(id);

            LoadProgress(id);

        }



        // CHILD INFO

        void LoadChild(int id)

        {

            using (SqlConnection con = new SqlConnection(cs))

            {

                SqlCommand cmd = new SqlCommand(

                    "SELECT * FROM BabyDetails WHERE BabyID=@id", con);



                cmd.Parameters.AddWithValue("@id", id);



                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.Read())

                {

                    lblName.Text = dr["ChildName"].ToString();

                    lblBlood.Text = dr["BloodGroup"].ToString();



                    DateTime dob = Convert.ToDateTime(dr["DateOfBirth"]);

                    lblAge.Text = (DateTime.Now.Year - dob.Year) + " Years";

                }



                dr.Close();

                con.Close();

            }

        }



        // NEXT VACCINE (SAFE NULL FIX)

        void LoadNextVaccine(int id)

        {

            using (SqlConnection con = new SqlConnection(cs))

            {

                SqlCommand cmd = new SqlCommand(@"

                    SELECT TOP 1 VaccineName, DueDate

                    FROM VaccineSchedule

                    WHERE BabyID=@id AND IsCompleted=0

                    ORDER BY DueDate", con);



                cmd.Parameters.AddWithValue("@id", id);



                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();



                if (dr.Read())

                {

                    lblVaccine.Text = dr["VaccineName"].ToString();



                    DateTime due = Convert.ToDateTime(dr["DueDate"]);

                    lblDate.Text = due.ToString("dd MMM yyyy");



                    int days = (due - DateTime.Now).Days;

                    lblDays.Text = days + " Days Left";



                    lblReminder.Text = (days <= 3)

                        ? "⚠ Vaccine due soon!"

                        : "";

                }

                else

                {

                    lblVaccine.Text = "No Vaccine";

                    lblDate.Text = "";

                    lblDays.Text = "";

                    lblReminder.Text = "";

                }



                dr.Close();

                con.Close();

            }

        }



        // UPCOMING

        void LoadUpcoming(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter(@"
            SELECT VaccineName, DueDate,
            CASE 
                WHEN IsCompleted = 1 THEN 'Completed'
                WHEN DueDate < CAST(GETDATE() AS DATE) THEN 'Missed'
                ELSE 'Pending'
            END AS Status
            FROM VaccineSchedule
            WHERE BabyID=@id
            ORDER BY DueDate", con);

                da.SelectCommand.Parameters.AddWithValue("@id", id);

                DataTable dt = new DataTable();
                con.Open();
                da.Fill(dt);
                con.Close();

                rptVaccines.DataSource = dt;
                rptVaccines.DataBind();
            }
        }


        // PROGRESS

        void LoadProgress(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(@"
            SELECT 
                COUNT(*) Total,
                SUM(CASE WHEN IsCompleted=1 THEN 1 ELSE 0 END) Done
            FROM VaccineSchedule
            WHERE BabyID=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    int total = Convert.ToInt32(dr["Total"]);
                    int done = Convert.ToInt32(dr["Done"]);

                    int percent = (total == 0) ? 0 : (done * 100 / total);

                    // ✅ progress bar width
                    progressBar.Attributes["style"] = "width:" + percent + "%";

                    // ❗ IMPORTANT: update percentage text also
                    percentText.InnerText = percent + "%";
                }

                dr.Close();
            }
        }



        // MARK DONE

        protected void rptVaccines_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)

        {

            if (e.CommandName == "Done")

            {

                string vaccine = e.CommandArgument.ToString();

                int id = Convert.ToInt32(ddlChild.SelectedValue);



                using (SqlConnection con = new SqlConnection(cs))

                {

                    SqlCommand cmd = new SqlCommand(@"

                        UPDATE VaccineSchedule

                        SET IsCompleted=1

                        WHERE BabyID=@id AND VaccineName=@v", con);



                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@v", vaccine);



                    con.Open();

                    cmd.ExecuteNonQuery();

                    con.Close();

                }



                LoadDashboard();

            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.Abandon();
            Response.Redirect("home.aspx");

        }
    }

}