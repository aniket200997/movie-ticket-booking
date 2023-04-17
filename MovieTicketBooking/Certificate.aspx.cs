using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Certificate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["certificate_id"]))
        {
            id = Request.QueryString["certificate_id"];
            editData(id);

        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM certificate WHERE certificate_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        certificate_id.Text = Convert.ToString(dr["certificate_id"]);
        certificate_name.Text = Convert.ToString(dr["certificate_name"]);
        certificate_description.Text = Convert.ToString(dr["certificate_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(certificate_id.Text))
        {
            SQL = "UPDATE certificate set certificate_name = @0, certificate_description = @1 WHERE certificate_id = @2";
        }
        else
        {
            SQL = "INSERT INTO certificate (certificate_name, certificate_description) VALUES(@0,@1)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", certificate_name.Text);
        insertCommand.Parameters.AddWithValue("@1", Convert.ToString(certificate_description.Text));
        insertCommand.Parameters.AddWithValue("@2", certificate_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Certificate-report.aspx");
    }
}