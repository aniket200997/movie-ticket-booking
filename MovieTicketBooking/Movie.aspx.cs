using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


public partial class Movie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["movie_id"]))
        {
            id = Request.QueryString["movie_id"];
            editData(id);
        }
        if (!Page.IsPostBack)
        {
            FillCertificateListing();
            FillLanguageListing();
            FillTypeListing();
        }

    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM movie WHERE movie_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        movie_certificate_id.Text = Convert.ToString(dr["movie_certificate_id"]);
        movie_name.Text = Convert.ToString(dr["movie_name"]);
        upload_picture.Text  = Convert.ToString(dr["movie_image"]);
        movie_trailer_url.Text = Convert.ToString(dr["movie_trailer_url"]);
        movie_language_id.Text = Convert.ToString(dr["movie_language_id"]);
        movie_type_id.Text = Convert.ToString(dr["movie_type_id"]);
        movie_duration.Text = Convert.ToString(dr["movie_duration"]);
        movie_release_date.Text = Convert.ToString(dr["movie_release_date"]);
        movie_director.Text = Convert.ToString(dr["movie_director"]);
        movie_cast.Text = Convert.ToString(dr["movie_cast"]);
        movie_description.Text = Convert.ToString(dr["movie_description"]);
        movie_end_date.Text = Convert.ToString(dr["movie_end_date"]);
        movie_id.Text = Convert.ToString(dr["movie_id"]);

        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;
        string fileName = upload_picture.Text;
    
        ////Upload File to database /////
        if (movie_image.HasFile)
        {
            fileName = Path.GetFileName(movie_image.PostedFile.FileName);
            movie_image.PostedFile.SaveAs(Server.MapPath("uploads/") + fileName);
        }

        if (!String.IsNullOrEmpty(movie_id.Text))
        {
            SQL = "UPDATE movie SET movie_certificate_id = @1, movie_name = @2, movie_image = @3, movie_trailer_url = @4, movie_language_id = @5, movie_type_id = @6, movie_duration = @7, movie_release_date = @8, movie_director = @9, movie_cast = @10, movie_description = @11, movie_end_date = @12 WHERE movie_id = @13;";
        }
        else
        {
            SQL = "INSERT INTO movie (movie_certificate_id, movie_name, movie_image, movie_trailer_url, movie_language_id, movie_type_id, movie_duration, movie_release_date, movie_director, movie_cast, movie_description, movie_end_date) VALUES (@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12);";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;
        
        insertCommand.Parameters.AddWithValue("@1", movie_certificate_id.Text);
        insertCommand.Parameters.AddWithValue("@2", movie_name.Text);
        insertCommand.Parameters.AddWithValue("@3", fileName); 
        insertCommand.Parameters.AddWithValue("@4", movie_trailer_url.Text);
        insertCommand.Parameters.AddWithValue("@5", movie_language_id.Text);
        insertCommand.Parameters.AddWithValue("@6", movie_type_id.Text);
        insertCommand.Parameters.AddWithValue("@7", movie_duration.Text);
        insertCommand.Parameters.AddWithValue("@8", movie_release_date.Text);
        insertCommand.Parameters.AddWithValue("@9", movie_director.Text);
        insertCommand.Parameters.AddWithValue("@10", movie_cast.Text);
        insertCommand.Parameters.AddWithValue("@11", movie_description.Text);
        insertCommand.Parameters.AddWithValue("@12", movie_end_date.Text);
        insertCommand.Parameters.AddWithValue("@13", movie_id.Text);

        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Movie-report.aspx");
    }
    private void FillCertificateListing()
    {
        DBConnection cn = new DBConnection(); 
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From certificate", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        movie_certificate_id.DataValueField = "certificate_id";
        movie_certificate_id.DataTextField = "certificate_name";
        movie_certificate_id.DataSource = dt;
        movie_certificate_id.DataBind();
        movie_certificate_id.Items.Insert(0, "Please Select");
    }
    
    private void FillLanguageListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From language", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        movie_language_id.DataValueField = "language_id";
        movie_language_id.DataTextField = "language_name";
        movie_language_id.DataSource = dt;
        movie_language_id.DataBind();
        movie_language_id.Items.Insert(0, "Please Select");
    }

    private void FillTypeListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From type", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        movie_type_id.DataValueField = "type_id";
        movie_type_id.DataTextField = "type_name";
        movie_type_id.DataSource = dt;
        movie_type_id.DataBind();
        movie_type_id.Items.Insert(0, "Please Select");
    }
}