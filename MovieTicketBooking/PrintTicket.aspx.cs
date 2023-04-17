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
        CrystalReportSource1.ReportDocument.RecordSelectionFormula = "{booking.booking_id}=" + Request.QueryString["booking_id"].ToString();
        CrystalReportSource1.ReportDocument.Refresh();
        CrystalReportViewer1.RefreshReport();
    }
    
}