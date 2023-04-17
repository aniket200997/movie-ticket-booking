using System;   
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MovieType : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["type_id"]))
        {
            id = Request.QueryString["type_id"];
            editData(id);

        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM type WHERE type_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        type_id.Text = Convert.ToString(dr["type_id"]);
        type_name.Text = Convert.ToString(dr["type_name"]);
        type_description.Text = Convert.ToString(dr["type_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(type_id.Text))
        {
            SQL = "UPDATE type set type_name = @0, type_description = @1 WHERE type_id = @3";
        }
        else
        {
            SQL = "INSERT INTO type (type_name, type_description) VALUES(@0,@1)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", type_name.Text);
        insertCommand.Parameters.AddWithValue("@1", Convert.ToString(type_description.Text));
        insertCommand.Parameters.AddWithValue("@3", type_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("MovieType-report.aspx");
    }
}