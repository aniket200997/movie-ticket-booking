<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="PrintTicket.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

 
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <center>
    <form id="form1" runat="server">
    
        <div style="background-color: #800000; background-image: url('images/M.png');">
    <table>
        <tr>
            <td>
                <CR:CrystalReportViewer ID="CrystalReportViewer1"  runat="server" AutoDataBind="True"    ReportSourceID="CrystalReportSource1"  />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="CrystalReport.rpt">
        </Report>
    </CR:CrystalReportSource>
            </td>
            <td>
                <asp:Button Text="hello" runat="server" ID="b1" />
            </td>
        </tr>

    </table>
            
    
    </div>
    </form>
        </center>
</body>
</html>
 
  

    
 

