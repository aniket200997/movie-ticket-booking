using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;


public partial class Audi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        booking_amount.Text = Session["ticketamount"].ToString();
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        //record saved in table
        //booking
        String moviename="";
        //finding movie name,movie date,mltiplex,autdi from show id show timings
        String strsql = "SELECT dbo.movie.movie_id,dbo.movie.movie_name, dbo.movie.movie_image, dbo.show.show_from_time, dbo.show.show_to_time, dbo.audi.audi_description, dbo.audi.audi_title, dbo.show.show_id";
        strsql = strsql + " FROM     dbo.show INNER JOIN dbo.movie ON dbo.show.show_movie_id = dbo.movie.movie_id INNER JOIN dbo.audi ON dbo.show.show_audi_id = dbo.audi.audi_id ";
        strsql = strsql + " where show_id=" + Session["showid"].ToString();

        DBConnection cn = new DBConnection();
        SqlCommand cmd = new SqlCommand(strsql, cn.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            moviename = dr[1].ToString();
             strsql = "Insert into booking (booking_user_id,booking_movie_id,booking_show_id,booking_date,booking_no_seats,booking_amount, booking_status) values(@a,@b,@c,@d,@e,@f,@g)";
             DBConnection cn1 = new DBConnection();
             SqlCommand cmd1 = new SqlCommand(strsql, cn1.con);
             cmd1.Parameters.AddWithValue("@a", Session["users_id"].ToString());
             cmd1.Parameters.AddWithValue("@b", dr[0].ToString());
             cmd1.Parameters.AddWithValue("@c", Session["showid"].ToString());
             cmd1.Parameters.AddWithValue("@d", Session["bdate"].ToString());
             cmd1.Parameters.AddWithValue("@e", Session["ctrseat"].ToString());
             cmd1.Parameters.AddWithValue("@f", Session["ticketamount"].ToString());
             cmd1.Parameters.AddWithValue("@g", "1");
             cmd1.ExecuteNonQuery();
             
        }
        //finding newly inserted booking id
        strsql = "select max(booking_id) from booking";
        if (cn.con.State == ConnectionState.Open) cn.con.Close();
        cn.con.Open();
        cmd = new SqlCommand(strsql, cn.con);
        dr = cmd.ExecuteReader();
        int bookingid = 0;
        if (dr.Read()) 
            bookingid=int.Parse(dr[0].ToString());


         //record save in table
        //booking_seats
        string allseats = Session["selectedseat"].ToString();
        string[] tempseats = allseats.Split('#');
        
        foreach (string x in tempseats)
        {
            if (x != "")
            {
                 //add record
                strsql = "insert into booking_seats (booking_show_id,bs_booking_id,bs_seatnumber) values(@a,@b,@c)";
                if (cn.con.State == ConnectionState.Open) cn.con.Close();
                cn.con.Open();
                cmd = new SqlCommand(strsql, cn.con);
                cmd.Parameters.AddWithValue("@a", Session["showid"].ToString());
                cmd.Parameters.AddWithValue("@b", bookingid);
                cmd.Parameters.AddWithValue("@c", x);
                cmd.ExecuteNonQuery();
                

            }
        }
        //finding email address of user

        //send mail
        string mailbody = "Thanks for booking " + moviename + " From us Show date is " + Session["bdate"].ToString() + " Total seats booked by you are " + Session["ctrseat"].ToString() + " Seat Numbers are " + Session["selectedseat"].ToString();
        Utility u1 = new Utility();
        u1.sendMail(Session["user_email"].ToString(), "Booking Details", mailbody);
        //clear session values
        Session.Remove("showid");
        Session.Remove("ticketamount");
        Session.Remove("selectedseat");
        Session.Remove("bdate");
        Session.Remove("ctrseat");
        Response.Redirect("PrintTicket.aspx?booking_id="+ bookingid);
    }
}