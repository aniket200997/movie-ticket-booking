using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Designation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["designation_id"]))
        {
            id = Request.QueryString["designation_id"];
            editData(id);

        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM designation WHERE designation_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        designation_id.Text = Convert.ToString(dr["designation_id"]);
        designation_title.Text = Convert.ToString(dr["designation_title"]);
        designation_description.Text = Convert.ToString(dr["designation_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(designation_id.Text))
        {
            SQL = "UPDATE designation set designation_title = @0, designation_description = @1 WHERE designation_id = @2";
        }
        else
        {
            SQL = "INSERT INTO designation (designation_title, designation_description) VALUES(@0,@1)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", designation_title.Text);
        insertCommand.Parameters.AddWithValue("@1", Convert.ToString(designation_description.Text));
        insertCommand.Parameters.AddWithValue("@2", designation_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Designation-report.aspx");
    }
}