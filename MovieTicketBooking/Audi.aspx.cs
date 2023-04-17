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
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["audi_id"]))
        {
            id = Request.QueryString["audi_id"];
            editData(id);
        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM audi WHERE audi_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        audi_title.Text = Convert.ToString(dr["audi_title"]);
        audi_no_of_seats.Text = Convert.ToString(dr["audi_no_of_seats"]);
        audi_row_start.Text = Convert.ToString(dr["audi_row_start"]);
        audi_row_end.Text = Convert.ToString(dr["audi_row_end"]);
        audi_column_start.Text = Convert.ToString(dr["audi_column_start"]);
        audi_column_end.Text = Convert.ToString(dr["audi_column_end"]);
        audi_description.Text = Convert.ToString(dr["audi_description"]);
        audi_id.Text = Convert.ToString(dr["audi_id"]);

        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;
        if (!String.IsNullOrEmpty(audi_id.Text))
        {
            SQL = "UPDATE audi SET audi_title = @1, audi_no_of_seats = @2, audi_row_start = @3, audi_row_end = @4, audi_column_start = @5, audi_column_end = @6, audi_description = @7 WHERE audi_id = @8;";
        }
        else
        {
            SQL = "INSERT INTO audi (audi_title, audi_no_of_seats, audi_row_start, audi_row_end, audi_column_start, audi_column_end, audi_description) VALUES (@1, @2, @3, @4, @5, @6, @7);";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;
        
        insertCommand.Parameters.AddWithValue("@1", audi_title.Text);
        insertCommand.Parameters.AddWithValue("@2", audi_no_of_seats.Text);
        insertCommand.Parameters.AddWithValue("@3", audi_row_start.Text); 
        insertCommand.Parameters.AddWithValue("@4", audi_row_end.Text);
        insertCommand.Parameters.AddWithValue("@5", audi_column_start.Text);
        insertCommand.Parameters.AddWithValue("@6", audi_column_end.Text);
        insertCommand.Parameters.AddWithValue("@7", audi_description.Text);
        insertCommand.Parameters.AddWithValue("@8", audi_id.Text);

        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Audi-report.aspx");
    }
}