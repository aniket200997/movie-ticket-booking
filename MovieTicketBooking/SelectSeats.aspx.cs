using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
public partial class SelectSeats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ctrseat"] == null)
        {
            Session.Add("ctrseat", "0");
            Session.Add("ticketamount", "0");
            Session.Add("selectedseat", "");
            Session.Add("showid", Request.QueryString["showid"].ToString());
           
        }
        l1.Text = "";
        
        //removing all records from seatallocation
        DBConnection cn = new DBConnection();
        string sql = "delete from SeatAllocation";
        SqlCommand cmd = new SqlCommand(sql, cn.con);
        cmd.ExecuteNonQuery();
        //adding records in seatallocation
        if (cn.con.State == ConnectionState.Open)
            cn.con.Close();
        cn.con.Open();
        for (int i = 65; i <= 75; i++)
        {
            sql="Insert into SeatAllocation values('"+ (char)i +"','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif','~/images/1.gif')";
            cmd = new SqlCommand(sql, cn.con);
            cmd.ExecuteNonQuery();
        }
        //changing seat values which are booked
        if (cn.con.State == ConnectionState.Open) cn.con.Close();
        cn.con.Open();
        sql = "select * from booking_seats where booking_show_id=" + Request.QueryString["showid"];
        cmd = new SqlCommand(sql, cn.con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            sql = "update seatallocation set " + dr["bs_seatnumber"].ToString().Substring(1) + "='~/images/2.gif' where RowAlphabate='" + dr["bs_seatnumber"].ToString().Substring(0, 1) + "'";
            DBConnection cn1 = new DBConnection();
            SqlCommand cmd2 = new SqlCommand(sql, cn1.con);
            cmd2.ExecuteNonQuery();
        }

    }
   
    public void checkbook(object sender, ImageClickEventArgs e)
    {
        
        //find show base price
        DBConnection cn = new DBConnection();
        int baseprice=0;
        int amount = 0;
        string sql = "select show_ticket_price from show where show_id=" + Request.QueryString["showid"];
        
        SqlCommand cmd = new SqlCommand(sql, cn.con);
        SqlDataReader dr = cmd.ExecuteReader();
        if(dr.Read())
            baseprice =int.Parse(dr[0].ToString());
        ImageButton i1 = (ImageButton)sender;
        
        if (i1.ImageUrl == "~/images/1.gif")
        {
            i1.ImageUrl = "~/images/3.gif";
            Session["ctrseat"] = int.Parse(Session["ctrseat"].ToString())+1;
            String selectedseat = i1.AlternateText.ToString().Substring(0, 1);
            Session["selectedseat"] = Session["selectedseat"].ToString() + "#" + i1.AlternateText.ToString();
            if (selectedseat == "A" || selectedseat == "B")
                amount = baseprice + (int)(baseprice * .20);
            else if (selectedseat == "I" || selectedseat == "J" || selectedseat == "K")
                amount = baseprice - (int)(baseprice * .20);
            else
                amount = baseprice;
            Session["ticketamount"] = int.Parse(Session["ticketamount"].ToString()) + amount;

            l1.Text = "Number of Seats Selected " + Session["ctrseat"].ToString() +" Amount Payable "+ Session["ticketamount"].ToString() ;
            l2.Text = Session["selectedseat"].ToString();
        }
        else if (i1.ImageUrl == "~/images/3.gif")
        {
            i1.ImageUrl = "~/images/1.gif";
            Session["ctrseat"] = int.Parse(Session["ctrseat"].ToString()) - 1;
            String selectedseat = i1.AlternateText.ToString().Substring(0, 1);
            string allseats = Session["selectedseat"].ToString();
            string[] tempseats = allseats.Split('#');
            ArrayList a1 = new ArrayList();
            foreach (string x in tempseats)
            {
                if (x != "")
                {
                    if (x != i1.AlternateText.ToString())
                        a1.Add(x);
                }
            }
            allseats = "";
            foreach (string temp in a1)
            {
                allseats = allseats + temp +"#";
            }
            Session["selectedseat"] = allseats;
            if (selectedseat == "A" || selectedseat == "B")
                amount = baseprice = (int)(baseprice * .20);
            else if (selectedseat == "I" || selectedseat == "J" || selectedseat == "K")
                amount = baseprice - (int)(baseprice * .20);
            else
                amount = baseprice;
            Session["ticketamount"] = int.Parse(Session["ticketamount"].ToString()) - amount;
            l1.Text = "Number of Seats Selected " + Session["ctrseat"].ToString() + " Amount Payable " + Session["ticketamount"].ToString();
            l2.Text = Session["selectedseat"].ToString();
        }
      
    }

   
}