using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data.SqlClient;


/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
    public SqlConnection con;
    public String conString;

    public DBConnection()
    {
        conString = "Data Source=LAPTOP-NHU9OUBJ\\SQLEXPRESS;Initial Catalog=Movie_Ticket;Integrated Security=True";
        con = new SqlConnection(conString);
        con.Open();
    }
}