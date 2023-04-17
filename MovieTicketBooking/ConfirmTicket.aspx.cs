using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class ConfirmTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Showid.Text = Session["showid"].ToString();
        Amountpaybale.Text = Session["ticketamount"].ToString();
        Seatnumber.Text = Session["selectedseat"].ToString();
        MovieDate.Text = Session["bdate"].ToString();
        Numberofseat.Text = Session["ctrseat"].ToString();
        //finding movie name,movie date,mltiplex,autdi from show id show timings
        String strsql="SELECT dbo.movie.movie_name, dbo.movie.movie_image, dbo.show.show_from_time, dbo.show.show_to_time, dbo.audi.audi_description, dbo.audi.audi_title, dbo.show.show_id";
        strsql = strsql + " FROM     dbo.show INNER JOIN dbo.movie ON dbo.show.show_movie_id = dbo.movie.movie_id INNER JOIN dbo.audi ON dbo.show.show_audi_id = dbo.audi.audi_id ";
        strsql = strsql + " where show_id=" + Session["showid"].ToString();

        DBConnection cn = new DBConnection();
        SqlCommand cmd = new SqlCommand(strsql, cn.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            MovieName.Text = dr[0].ToString();
            MovieImage.ImageUrl = "~/Uploads/"+dr[1].ToString();
            Multiplex.Text = dr[4].ToString();
            Audi.Text = dr[5].ToString();
            ShowTimings.Text = dr[2].ToString() + "-" + dr[3].ToString();

        }

    }
    protected void Cancel_Click(object sender, EventArgs e)
    {
        Session.Remove("showid");
        Session.Remove("ticketamount");
        Session.Remove("selectedseat");
        Session.Remove("bdate");
        Session.Remove("ctrseat");
        Response.Redirect("Movies.aspx");
    }
    protected void Payment_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
}