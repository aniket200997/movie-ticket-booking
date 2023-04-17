using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Job_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        showDataListing();
    }

    public void showDataListing()
    {
        DBConnection cn = new DBConnection();
        String SQL;
        if (Convert.ToInt32(Session["login_level"]) == 3)
            SQL = "SELECT * FROM movie,type,certificate,language,booking,show,customer WHERE booking_user_id = customer_id AND booking_show_id = show_id AND booking_movie_id = movie_id AND movie_certificate_id = certificate_id AND movie_type_id = type_id AND movie_language_id = language_id AND customer_id = '" + Session["users_id"] + "'";
        else
            SQL = "SELECT * FROM movie,type,certificate,language,booking,show,customer WHERE booking_user_id = customer_id AND booking_show_id = show_id AND booking_movie_id = movie_id AND movie_certificate_id = certificate_id AND movie_type_id = type_id AND movie_language_id = language_id;";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        DataReportListing.DataSource = dt;
        DataReportListing.DataBind();
        cn.con.Close();
    }

    protected void deleteData_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        DBConnection cn = new DBConnection();
        String SQL = "DELETE FROM job WHERE job_id = @0";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        cmd.Parameters.AddWithValue("@0", btn.CommandArgument);
        cmd.ExecuteNonQuery();
        showDataListing();
    }

    protected void editData_Click(object sender, EventArgs e)
    {
    }
}