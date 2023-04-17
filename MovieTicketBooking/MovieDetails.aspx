<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MovieDetails.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 33px;
        }
        .auto-style2 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script>
    function openWin(url)
    {
        location.href = url;
    }
</script>
<div class="wrapper row3">
<%     
    System.Data.DataTable dt = this.showDataListing();
    System.Data.DataRow row = dt.Rows[0];
%>
  <div class="rounded">
    <main class="container clear"> 
        <% if (Request.QueryString["msg"] != "" && Request.QueryString["msg"] != null)
         { %>
      <div align="center" class="msg"><%=Request.QueryString["msg"]%></div>
      <%} %>
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30">
        <!-- Middle Column -->
        <div class="one_half comments" style="width:70%"> 
          <!-- ################################################################################################ -->
          <h2>Movie Name : <%=row["movie_name"].ToString()%></h2>
          <ul class="nospace listing" style="padding:1px 1px; margin:1px 1px">
            <li class="clear" style="padding:1px 1px; margin:1px 1px">
              <div class="imgl borderedbox"><img src="uploads/<%=row["movie_image"].ToString()%>" alt="" style="height:80px; width:80px"></div>
              <p class="nospace btmspace-15"><a href="#"><%=row["movie_name"].ToString()%></a></p>
              <p><%=(row["movie_description"].ToString())%></p>
            </li>
          </ul>
          <!-- ################################################################################################ --> 
          <table>
              <tr>
                  <th style="width:200px">Movie Name</th>
                  <td><%=row["movie_name"].ToString()%></td>
              </tr>
              <tr>
                  <th>Certificate</th>
                  <td><%=row["certificate_name"].ToString()%></td>
              </tr>
              <tr>
                  <th>Language</th>
                  <td><%=row["language_name"].ToString()%></td>
              </tr>
              <tr>
                  <th>Movie Type</th>
                  <td><%=row["type_name"].ToString()%></td>
              </tr>
              <tr>
                  <th>Duration</th>
                  <td><%=row["movie_duration"].ToString()%></td>
              </tr>
              <tr>
                  <th>Release Date</th>
                  <td><%=row["movie_release_date"].ToString()%></td>
              </tr>
              <tr>
                  <th>Director</th>
                  <td><%=row["movie_director"].ToString()%></td>
              </tr>
              <tr>
                  <th class="auto-style1">Castings</th>
                  <td class="auto-style2"><%=row["movie_cast"].ToString()%></td>
              </tr>
              <tr>
                  <th>Release Date</th>
                  <td><%=row["movie_release_date"].ToString()%></td>
              </tr>
              <tr style="background-color:#ffffff">
                <td colspan="2">
                    <%=(row["movie_description"].ToString()).Replace("\r","\n").Replace("\n","<br>")%>
                </td>
              </tr>
          </table>
            <div style="float:right">
            <% if (Convert.ToInt32(Session["login"]) != 1)
                { %>
              <input value="Login to Book Ticket" type="button" onclick="openWin('Customer-Login.aspx')">
            <% } else { %>
                <input value="Book Ticket" type="button" onclick="openWin('SelectMultiPlexAudiShow.aspx?movie_id=<%=movie_id.Text %>')">
                <asp:TextBox ID="movie_id" runat="server" Visible="False"></asp:TextBox>
            <% } %>
            </div>
        </div>
        <!-- / Middle Column --> 
      </div>
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>
</asp:Content>

