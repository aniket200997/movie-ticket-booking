using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["user_id"]))
        {
            id = Request.QueryString["user_id"];
            editData(id);
        }
        if (!Page.IsPostBack)
        {
            FillDepartmentListing();
            FillDesignationListing();
            FillLoginLevelListing();
            FillCityListing();
            FillStateListing();
            FillCountryListing();
        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM [user] WHERE user_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        user_id.Text = Convert.ToString(dr["user_id"]);
        user_designation_id.Text = Convert.ToString(dr["user_designation_id"]);
        user_department_id.Text = Convert.ToString(dr["user_department_id"]);
        user_level_id.Text = Convert.ToString(dr["user_level_id"]);
        user_name.Text = Convert.ToString(dr["user_name"]);
        user_add1.Text = Convert.ToString(dr["user_add1"]);
        user_add2.Text = Convert.ToString(dr["user_add2"]);
        user_city.Text = Convert.ToString(dr["user_city"]);
        user_state.Text = Convert.ToString(dr["user_state"]);
        user_country.Text = Convert.ToString(dr["user_country"]);
        user_email.Text = Convert.ToString(dr["user_email"]);
        user_mobile.Text = Convert.ToString(dr["user_mobile"]);
        user_gender.Text = Convert.ToString(dr["user_gender"]);
        user_dob.Text = Convert.ToString(dr["user_dob"]);
        user_details.Text = Convert.ToString(dr["user_details"]);

        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;

        if (!String.IsNullOrEmpty(user_id.Text))
        {
            SQL = "UPDATE user SET user_designation_id = @0, user_department_id = @1, user_level_id = @2, user_name = @5, user_add1 = @6, user_add2 = @7, user_city = @8, user_state = @9, user_country = @10, user_email = @11, user_mobile = @12, user_gender = @13, user_dob = @14, user_details = @15 WHERE user_id = @16";
        }
        else
        {
            SQL = "INSERT INTO user (user_designation_id, user_department_id, user_level_id, user_username, user_password, user_name, user_add1, user_add2, user_city, user_state, user_country, user_email, user_mobile, user_gender, user_dob, user_details) VALUES (@0, @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@0", user_designation_id.Text);
        insertCommand.Parameters.AddWithValue("@1", user_department_id.Text);
        insertCommand.Parameters.AddWithValue("@2", user_level_id.Text);
        insertCommand.Parameters.AddWithValue("@3", user_username.Text);
        insertCommand.Parameters.AddWithValue("@4", user_password.Text);
        insertCommand.Parameters.AddWithValue("@5", user_name.Text);
        insertCommand.Parameters.AddWithValue("@6", user_add1.Text);
        insertCommand.Parameters.AddWithValue("@7", user_add2.Text);
        insertCommand.Parameters.AddWithValue("@8", user_city.Text);
        insertCommand.Parameters.AddWithValue("@9", user_state.Text);
        insertCommand.Parameters.AddWithValue("@10", user_country.Text);
        insertCommand.Parameters.AddWithValue("@11", user_email.Text);
        insertCommand.Parameters.AddWithValue("@12", user_mobile.Text);
        insertCommand.Parameters.AddWithValue("@13", user_gender.Text);
        insertCommand.Parameters.AddWithValue("@14", user_dob.Text);
        insertCommand.Parameters.AddWithValue("@15", user_details.Text);
        insertCommand.Parameters.AddWithValue("@16", user_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("User-report.aspx"); 
    }
    private void FillDepartmentListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From department", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_department_id.DataValueField = "department_title";
        user_department_id.DataTextField = "department_title";
        user_department_id.DataSource = dt;
        user_department_id.DataBind();
        user_department_id.Items.Insert(0, "Please Select");
    }
    private void FillDesignationListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From designation", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_designation_id.DataValueField = "designation_title";
        user_designation_id.DataTextField = "designation_title";
        user_designation_id.DataSource = dt;
        user_designation_id.DataBind();
        user_designation_id.Items.Insert(0, "Please Select");
    }
    private void FillLoginLevelListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From login_level", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_level_id.DataValueField = "ll_id";
        user_level_id.DataTextField = "ll_title";
        user_level_id.DataSource = dt;
        user_level_id.DataBind();
        user_level_id.Items.Insert(0, "Please Select");
    }
    private void FillCityListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From city", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_city.DataValueField = "city_name";
        user_city.DataTextField = "city_name";
        user_city.DataSource = dt;
        user_city.DataBind();
        user_city.Items.Insert(0, "Please Select");
    }
    private void FillStateListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From state", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_state.DataValueField = "state_name";
        user_state.DataTextField = "state_name";
        user_state.DataSource = dt;
        user_state.DataBind();
        user_state.Items.Insert(0, "Please Select");
    }
    private void FillCountryListing()
    {
        DBConnection cn = new DBConnection();
        SqlCommand cmd;
        cmd = new SqlCommand("Select * From country", cn.con);
        cmd.CommandType = CommandType.Text;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        user_country.DataValueField = "country_name";
        user_country.DataTextField = "country_name";
        user_country.DataSource = dt;
        user_country.DataBind();
        user_country.Items.Insert(0, "Please Select");
    }
}