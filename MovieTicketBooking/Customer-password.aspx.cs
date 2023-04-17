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
        if (Convert.ToString(Session["login"]) != "1")
        {
            Response.Redirect("Login.aspx?msg=Login to your accout. To access the page !!!");
        }
    }
    protected void changePassword_Click(object sender, EventArgs e)
    {
        
        DBConnection cn = new DBConnection();
        String SQL = "select * from customer where customer_id = @userID";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        cmd.Parameters.AddWithValue("@userID", Session["users_id"]);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            if (old_password.Text != Convert.ToString(dr["customer_password"]))
            {
                Response.Redirect("Customer-password.aspx?msg=Invalid Old Password. Try Again !!!");
            }
            else if( new_password.Text != confirm_password.Text)
            {
                Response.Redirect("Customer-password.aspx?msg=Password not matched !!!");
            }
            else
            {
                SQL = "UPDATE customer set customer_password = @0 WHERE customer_id = @1";
                SqlCommand insertCommand = new SqlCommand(SQL, cn.con);
                insertCommand.CommandType = CommandType.Text;

                insertCommand.Parameters.AddWithValue("@0", new_password.Text);
                insertCommand.Parameters.AddWithValue("@1", Session["users_id"]);
                insertCommand.ExecuteNonQuery();
                cn.con.Close();
                old_password.Text = "";
                new_password.Text = "";
                confirm_password.Text = "";
                Response.Redirect("Customer-password.aspx?msg=Password changed successfully.");
            }
        }
    }
}