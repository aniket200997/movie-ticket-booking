using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Language : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["language_id"]))
        {
            id = Request.QueryString["language_id"];
            editData(id);

        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM language WHERE language_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        language_id.Text = Convert.ToString(dr["language_id"]);
        language_name.Text = Convert.ToString(dr["language_name"]);
        language_description.Text = Convert.ToString(dr["language_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(language_id.Text))
        {
            SQL = "UPDATE language set language_name = @0, language_description = @1 WHERE language_id = @2";
        }
        else
        {
            SQL = "INSERT INTO language (language_name, language_description) VALUES(@0,@1)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", language_name.Text);
        insertCommand.Parameters.AddWithValue("@1", Convert.ToString(language_description.Text));
        insertCommand.Parameters.AddWithValue("@2", language_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Language-report.aspx");
    }
}