using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


public partial class Show : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["show_id"]))
        {
            id = Request.QueryString["show_id"];
            editData(id);
        }
        if (!Page.IsPostBack)
        {
            FillMovieListing();
            FillAudiListing();
        }

    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM show WHERE show_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        show_movie_id.Text = Convert.ToString(dr["show_movie_id"]);
        show_from_time.Text = Convert.ToString(dr["show_from_time"]);
        show_to_time.Text = Convert.ToString(dr["show_to_time"]);
        show_audi_id.Text = Convert.ToString(dr["show_audi_id"]);
        show_ticket_price.Text = Convert.ToString(dr["show_ticket_price"]);
        show_description.Text = Convert.ToString(dr["show_description"]);
        show_from_date.Text =Convert.ToString(dr["show_from_date"]);
        show_to_date.Text = Convert.ToString(dr["show_to_date"]);
        show_id.Text = Convert.ToString(dr["show_id"]);

        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(show_id.Text))
        {
            SQL = "UPDATE show SET show_movie_id = @1, show_from_time = @2, show_to_time = @3, show_audi_id = @4, show_ticket_price = @5, show_description = @6 ,show_from_date=@8,show_to_date=@9 WHERE show_id = @7;";
        }
        else
        {
            SQL = "INSERT INTO show (show_movie_id, show_from_time, show_to_time, show_audi_id, show_ticket_price, show_description,show_from_date,show_to_date ) VALUES (@1, @2, @3, @4, @5, @6,@8,@9);";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;
        
        insertCommand.Parameters.AddWithValue("@1", show_movie_id.Text);
        insertCommand.Parameters.AddWithValue("@2", show_from_time.Text);
        insertCommand.Parameters.AddWithValue("@3", show_to_time.Text); 
        insertCommand.Parameters.AddWithValue("@4", show_audi_id.Text);
        insertCommand.Parameters.AddWithValue("@5", show_ticket_price.Text);
        insertCommand.Parameters.AddWithValue("@6", show_description.Text);
        insertCommand.Parameters.AddWithValue("@7", show_id.Text);
        insertCommand.Parameters.AddWithValue("@8", show_from_date.Text);
        insertCommand.Parameters.AddWithValue("@9",show_to_date.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Show-report.aspx");
    }
    private void FillMovieListing()
    {
        DBConnection cn = new DBConnection(); 
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From movie", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        show_movie_id.DataValueField = "movie_id";
        show_movie_id.DataTextField = "movie_name";
        show_movie_id.DataSource = dt;
        show_movie_id.DataBind();
        show_movie_id.Items.Insert(0, "Please Select");
    }

    private void FillAudiListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From audi", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        show_audi_id.DataValueField = "audi_id";
        show_audi_id.DataTextField = "audi_title";
        show_audi_id.DataSource = dt;
        show_audi_id.DataBind();
        show_audi_id.Items.Insert(0, "Please Select");
    }
}