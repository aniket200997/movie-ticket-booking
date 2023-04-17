using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Teacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String id;
        if (!Page.IsPostBack && !String.IsNullOrEmpty(Request.QueryString["customer_id"]))
        {
            id = Request.QueryString["customer_id"];
            editData(id);
        }
        if (!Page.IsPostBack)
        {
            FillCityListing();
            FillStateListing();
            FillCountryListing();
        }
    }
    public void editData(String id)
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM customer WHERE customer_id = '" + id + "'";
        SqlCommand command = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(command);
        adp.Fill(dt);
        DataRow dr = dt.Rows[0];
        customer_id.Text = Convert.ToString(dr["customer_id"]);
        customer_name.Text = Convert.ToString(dr["customer_name"]);
        customer_add1.Text = Convert.ToString(dr["customer_add1"]);
        customer_add2.Text = Convert.ToString(dr["customer_add2"]);
        customer_city.Text = Convert.ToString(dr["customer_city"]);
        customer_state.Text = Convert.ToString(dr["customer_state"]);
        customer_country.Text = Convert.ToString(dr["customer_country"]);
        customer_email.Text = Convert.ToString(dr["customer_email"]);
        customer_mobile.Text = Convert.ToString(dr["customer_mobile"]);
        customer_gender.Text = Convert.ToString(dr["customer_gender"]);
        customer_dob.Text = Convert.ToString(dr["customer_dob"]);
        customer_details.Text = Convert.ToString(dr["customer_details"]);

        cn.con.Close();
    }
    protected void save_data_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL;
        string fileName = upload_file.Text;

        ////Upload File to database /////
        if (customer_resume.HasFile)
        {
            fileName = Path.GetFileName(customer_resume.PostedFile.FileName);
            customer_resume.PostedFile.SaveAs(Server.MapPath("uploads/") + fileName);
        }

        if (!String.IsNullOrEmpty(customer_id.Text))
        {
            SQL = "UPDATE customer SET  customer_resume = @17, customer_name = @5, customer_add1 = @6, customer_add2 = @7, customer_city = @8, customer_state = @9, customer_country = @10, customer_email = @11, customer_mobile = @12, customer_gender = @13, customer_dob = @14, customer_details = @15 WHERE customer_id = @16";
        }
        else
        {
            SQL = "INSERT INTO customer (customer_username, customer_password, customer_name, customer_add1, customer_add2, customer_city, customer_state, customer_country, customer_email, customer_mobile, customer_gender, customer_dob, customer_details, customer_resume) VALUES (@3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13, @14, @15, @17)";
        }
        SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
        insertCommand.CommandType = CommandType.Text;

        insertCommand.Parameters.AddWithValue("@3", customer_username.Text);
        insertCommand.Parameters.AddWithValue("@4", customer_password.Text);
        insertCommand.Parameters.AddWithValue("@5", customer_name.Text);
        insertCommand.Parameters.AddWithValue("@6", customer_add1.Text);
        insertCommand.Parameters.AddWithValue("@7", customer_add2.Text);
        insertCommand.Parameters.AddWithValue("@8", customer_city.Text);
        insertCommand.Parameters.AddWithValue("@9", customer_state.Text);
        insertCommand.Parameters.AddWithValue("@10", customer_country.Text);
        insertCommand.Parameters.AddWithValue("@11", customer_email.Text);
        insertCommand.Parameters.AddWithValue("@12", customer_mobile.Text);
        insertCommand.Parameters.AddWithValue("@13", customer_gender.Text);
        insertCommand.Parameters.AddWithValue("@14", customer_dob.Text);
        insertCommand.Parameters.AddWithValue("@15", customer_details.Text);
        insertCommand.Parameters.AddWithValue("@17", fileName);
        insertCommand.Parameters.AddWithValue("@16", customer_id.Text);
        insertCommand.ExecuteNonQuery();
        cn.con.Close();
        Response.Redirect("Customer-login.aspx?msg=Your account has been registered successfully !!! Login to your account. "); 
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
        customer_city.DataValueField = "city_id";
        customer_city.DataTextField = "city_name";
        customer_city.DataSource = dt;
        customer_city.DataBind();
        customer_city.Items.Insert(0, "Please Select");
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
        customer_state.DataValueField = "state_id";
        customer_state.DataTextField = "state_name";
        customer_state.DataSource = dt;
        customer_state.DataBind();
        customer_state.Items.Insert(0, "Please Select");
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
        customer_country.DataValueField = "country_id";
        customer_country.DataTextField = "country_name";
        customer_country.DataSource = dt;
        customer_country.DataBind();
        customer_country.Items.Insert(0, "Please Select");
    }
}