using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_button_Click(object sender, EventArgs e)
    {
        DBConnection cn = new DBConnection();
        String SQL = "select * from customer where customer_username = @username and customer_password = @password";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        cmd.Parameters.AddWithValue("@username", users_username.Text);
        cmd.Parameters.AddWithValue("@password", users_password.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            Session["login"] = 1;
            Session["user_name"] = dr["customer_name"];
            Session["login_level"] = "3";
            Session["users_id"] = dr["customer_id"];
            Session["user_email"] = dr["customer_email"].ToString();
            Response.Redirect("Default.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
        }
    }
}