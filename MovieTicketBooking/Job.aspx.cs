using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Job : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["job_id"]))
        {
            id = Request.QueryString["job_id"];
            editData(id);
        }
        if (!Page.IsPostBack)
        {
            FillJobTypeListing();
            FillJobCity();
            FillCompanyListing();
        }

    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM job WHERE job_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        job_id.Text = Convert.ToString(dr["job_id"]);
        job_company_id.Text = Convert.ToString(dr["job_company_id"]);
        job_jt_id.Text = Convert.ToString(dr["job_jt_id"]);
        job_title.Text = Convert.ToString(dr["job_title"]);
        job_skills.Text = Convert.ToString(dr["job_skills"]);
        job_post_date.Text = Convert.ToString(dr["job_post_date"]);
        job_city.Text = Convert.ToString(dr["job_city"]);
        job_description.Text = Convert.ToString(dr["job_description"]);
        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;
        if (Convert.ToInt32(Session["login_level"]) == 3)
        {
            job_company_id.Text = Convert.ToString(Session["users_id"]);
        }
        if (!String.IsNullOrEmpty(job_id.Text))
        {
            SQL = "UPDATE job SET job_company_id = @1, job_title = @2, job_skills = @3, job_post_date = @4, job_city = @5, job_description = @6 WHERE job_id = @7;";
        }
        else
        {
            SQL = "INSERT INTO job (job_company_id, job_title, job_skills, job_post_date, job_city, job_description) VALUES (@1, @2, @3, @4, @5, @6);";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@1", job_company_id.Text);
        insertCommand.Parameters.AddWithValue("@2", job_title.Text);
        insertCommand.Parameters.AddWithValue("@3", job_skills.Text); 
        insertCommand.Parameters.AddWithValue("@4", job_post_date.Text);
        insertCommand.Parameters.AddWithValue("@5", job_city.Text);
        insertCommand.Parameters.AddWithValue("@6", job_description.Text);
        insertCommand.Parameters.AddWithValue("@7", job_id.Text);
        
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Job-report.aspx");
    }
    private void FillCompanyListing()
    {
        DBConnection cn = new DBConnection(); 
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From company", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        job_company_id.DataValueField = "company_id";
        job_company_id.DataTextField = "company_name";
        job_company_id.DataSource = dt;
        job_company_id.DataBind();
        job_company_id.Items.Insert(0, "Please Select");
    }

    private void FillJobCity()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From city", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        job_city.DataValueField = "city_id";
        job_city.DataTextField = "city_name";
        job_city.DataSource = dt;
        job_city.DataBind();
        job_city.Items.Insert(0, "Please Select");
    }

    private void FillJobTypeListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From job_type", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        job_jt_id.DataValueField = "jt_id";
        job_jt_id.DataTextField = "jt_title";
        job_jt_id.DataSource = dt;
        job_jt_id.DataBind();
        job_jt_id.Items.Insert(0, "Please Select");
    }
}