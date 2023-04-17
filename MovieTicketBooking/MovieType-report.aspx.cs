using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MovieType_report : System.Web.UI.Page
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
        String SQL = "SELECT * FROM type";
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
        String SQL = "DELETE FROM type WHERE type_id = @0";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        cmd.Parameters.AddWithValue("@0", btn.CommandArgument);
        cmd.ExecuteNonQuery();
        showDataListing();
    }

    protected void editData_Click(object sender, EventArgs e)
    {
    }
}