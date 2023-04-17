using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Department : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["department_id"]))
        {
            id = Request.QueryString["department_id"];
            editData(id);

        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM department WHERE department_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        department_id.Text = Convert.ToString(dr["department_id"]);
        department_title.Text = Convert.ToString(dr["department_title"]);
        department_description.Text = Convert.ToString(dr["department_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(department_id.Text))
        {
            SQL = "UPDATE department set department_title = @0, department_description = @1 WHERE department_id = @2";
        }
        else
        {
            SQL = "INSERT INTO department (department_title, department_description) VALUES(@0,@1)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", department_title.Text);
        insertCommand.Parameters.AddWithValue("@1", Convert.ToString(department_description.Text));
        insertCommand.Parameters.AddWithValue("@2", department_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Department-report.aspx");
    }
}