using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class SelectMultiPlexAudiShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void booking_date_TextChanged(object sender, EventArgs e)
    {
        String Movie_id = Request.QueryString["movie_id"].ToString();
        String Movie_date = booking_date.Text;
        //finding multiplex as per movie id and booking date
        string strsql = "SELECT * FROM     audi INNER JOIN show ON audi.audi_id = show.show_audi_id and Convert(date ,'"+ Movie_date  +"', 109) between convert(date,show_from_date,109) AND convert(date,show_to_date,109)";
        DBConnection cn = new DBConnection();
        SqlDataAdapter da = new SqlDataAdapter(strsql, cn.con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        multiplex.DataTextField = "audi_description";
        multiplex.DataValueField = "audi_id";
        multiplex.DataSource = ds.Tables[0];
        multiplex.DataBind();

    }
    protected void multiplex_SelectedIndexChanged(object sender, EventArgs e)
    {
        String Movie_id = Request.QueryString["movie_id"].ToString();
        String Movie_date = booking_date.Text;
        //finding multiplex as per movie id and booking date
        
        string strsql = "SELECT * FROM  audi INNER JOIN show ON audi.audi_id = show.show_audi_id and  audi_description='"+ multiplex.SelectedItem.ToString() +"' and Convert(date ,'" + Movie_date + "', 109) between convert(date,show_from_date,109) AND convert(date,show_to_date,109)";
        DBConnection cn = new DBConnection();
        SqlDataAdapter da = new SqlDataAdapter(strsql, cn.con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        audi.DataTextField = "audi_title";
        audi.DataValueField = "audi_id";
        audi.DataSource = ds.Tables[0];
        audi.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        String Movie_id = Request.QueryString["movie_id"].ToString();
        String Movie_date = booking_date.Text;
        //finding multiplex as per movie id and booking date
        string strsql = "SELECT *,show_from_time+'-'+show_to_time as 'showtime' FROM     audi INNER JOIN show ON audi.audi_id = show.show_audi_id and audi_id='" + audi.SelectedValue +"' and  audi_description='" + multiplex.SelectedItem.ToString() + "' and Convert(date ,'" + Movie_date + "', 109) between convert(date,show_from_date,109) AND convert(date,show_to_date,109)";
        DBConnection cn = new DBConnection();
        SqlDataAdapter da = new SqlDataAdapter(strsql, cn.con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        show.DataTextField = "showtime";
        show.DataValueField = "show_id";
        show.DataSource = ds.Tables[0];
        show.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session.Add("bdate", booking_date.Text);
        string url = "~/SelectSeats.aspx?showid=" + show.SelectedValue.ToString();
        Response.Redirect(url);
    }
}