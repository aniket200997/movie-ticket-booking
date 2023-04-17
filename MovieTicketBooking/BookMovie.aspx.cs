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
        if (!Page.IsPostBack)
        {
            FillMovieListing();
            FillShowListing();
            
        }

    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        //finding audi id and total seats of audi from booking_show_id
        String audiid = this.getAudiID(booking_show_id.Text);
        String nseats = this.getAudiIDSeats(audiid);

        //finding total seats book as per booking id
        String bs = this.getAudiNumberOfBookSeats(booking_show_id.Text);
        //checking whether seats are remaining
        //if not display error message then return
        int availableseats = int.Parse(nseats) - int.Parse(bs);
        if (availableseats < int.Parse(booking_no_seats.Text))
        {
            //show error
            Response.Redirect("Movies.aspx?msg=seats are not avilable sry!!!");
            return;
        }
        String ticketCost = this.getShowAmount(booking_show_id.Text);
        int totalCost = Convert.ToInt32(ticketCost) * Convert.ToInt32(booking_no_seats.Text);

        DBConnection cn = new DBConnection();
        String SQL;
        String userID = Convert.ToString(Session["users_id"]);
        SQL = "INSERT INTO booking (booking_movie_id, booking_user_id, booking_show_id, booking_date, booking_no_seats, booking_amount, booking_status ) VALUES (@1, @2, @3, @4, @5, @6, @7);";

        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@1", booking_movie_id.Text);
        insertCommand.Parameters.AddWithValue("@2", userID);
        insertCommand.Parameters.AddWithValue("@3", booking_show_id.Text);
        insertCommand.Parameters.AddWithValue("@4", booking_date.Text);
        insertCommand.Parameters.AddWithValue("@5", booking_no_seats.Text);
        insertCommand.Parameters.AddWithValue("@6", totalCost);
        insertCommand.Parameters.AddWithValue("@7", '0');

        insertCommand.ExecuteNonQuery();
        //finding last inserted id
        SqlDataAdapter da = new SqlDataAdapter("Select max(booking_id) from booking", cn.con);
        DataSet tempds = new DataSet();
        da.Fill(tempds);
        long bookingID = long.Parse(tempds.Tables[0].Rows[0][0].ToString());
        cn.con.Close();
        Response.Redirect("payment.aspx?booking_id=" + bookingID + "&amt=" + totalCost);
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
        booking_movie_id.DataValueField = "movie_id";
        booking_movie_id.DataTextField = "movie_name";
        booking_movie_id.DataSource = dt;
        booking_movie_id.DataBind();
        booking_movie_id.Items.Insert(0, "Please Select");
    }

    private void FillShowListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From show", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        booking_show_id.DataValueField = "show_id";
        booking_show_id.DataTextField = "show_from_time";
        booking_show_id.DataSource = dt;
        booking_show_id.DataBind();
        booking_show_id.Items.Insert(0, "Please Select");
    }

    public String getShowAmount(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM show WHERE show_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        String showAmount = Convert.ToString(dr["show_ticket_price"]);
        cn.con.Close();
        return showAmount;
    }
    public String getAudiID(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT show_audi_id FROM show WHERE show_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        String showAmount = Convert.ToString(dr["show_audi_id"]);
        cn.con.Close();
        return showAmount;
    }
    public String getAudiIDSeats(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT audi_no_of_seats FROM audi WHERE audi_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        String showAmount = Convert.ToString(dr["audi_no_of_seats"]);
        cn.con.Close();
        return showAmount;
    }
    public String getAudiNumberOfBookSeats(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT sum(booking_no_seats) FROM booking WHERE booking_show_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        String showAmount = Convert.ToString(dr[0]);
        cn.con.Close();
        return showAmount;
    }
    
}