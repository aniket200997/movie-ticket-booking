using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public DataTable showDataListing()
    {
        DBConnection cn = new DBConnection();
        String SQL = "SELECT * FROM movie,type,certificate,language WHERE movie_certificate_id = certificate_id AND movie_type_id = type_id AND movie_language_id = language_id";
        SqlCommand cmd = new SqlCommand(SQL, cn.con);
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter(cmd);
        adp.Fill(dt);
        cn.con.Close();
        return dt;
    }
}