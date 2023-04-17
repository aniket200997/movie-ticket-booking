using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        movie_id.Text = Request.QueryString["movie_id"];
    }

    public DataTable showDataListing()
    {
        DBConnection cn = new DBConnection();
        String id = Request.QueryString["movie_id"];
        String SQL = "SELECT * FROM movie,type,certificate,language WHERE movie_certificate_id = certificate_id AND movie_type_id = type_id AND movie_language_id = language_id AND movie_id = '" + id + "'";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        cn.con.Close();
        return dt;
    }
    public Boolean checkApplication()
    {
        String id = Request.QueryString["movie_id"];
        DBConnection cn = new DBConnection();
        String SQL = "SELECT* from apply WHERE  apply_movie_id = '" + id + "' AND  apply_user_id = '" + Session["users_id"] + "'";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        cn.con.Close();
        if (dt.Rows.Count == 0)
            return true;
        return false;
    }
    protected void applyMovie_Click(object sender, EventArgs e)
    {
        String id = Request.QueryString["movie_id"];
        DBConnection cn = new DBConnection();
        String SQL;
        String date = (DateTime.Today).ToString();
        SQL = "INSERT INTO apply (apply_movie_id, apply_user_id, apply_date) VALUES (@1, @2, @3);";
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@1", id);
        insertCommand.Parameters.AddWithValue("@2", Session["users_id"]);
        insertCommand.Parameters.AddWithValue("@3", date);

        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("MoviesDetails.aspx?movie_id=" + id+"&msg=You have successfully applied for the movie");
    }
}