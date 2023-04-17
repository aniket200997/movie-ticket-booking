<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Movies.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30">
        <!-- Middle Column -->
        <div class="one_half" style="width:95%"> 
          <!-- ################################################################################################ -->
          <h2>Current Running Shows in Cinemas</h2>
          <ul class="nospace listing" style="padding:1px 1px; margin:1px 1px">
          <%     
              System.Data.DataTable dt = this.showDataListing();
              foreach (System.Data.DataRow row in dt.Rows)
              {
          %>
            <li style="padding:1px 1px; margin:1px 1px; float:left; width:280px">
              <div class="imgl borderedbox"><a href="MovieDetails.aspx?movie_id=<%=row["movie_id"].ToString()%>"><img src="uploads/<%=row["movie_image"].ToString()%>" alt="" style="height:160px;"></a></div>
              <p class="nospace btmspace-15"><a href="MovieDetails.aspx?movie_id=<%=row["movie_id"].ToString()%>"><%=row["movie_name"].ToString()%></a></p>
              <div><%=row["language_name"].ToString()%> Movie</div>
              <div><%=row["type_name"].ToString()%></div>
              <div>Director : <%=row["movie_director"].ToString()%></div>
              <div><%=row["movie_duration"].ToString()%></div>
            </li>
           <%
              }
           %>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Middle Column --> 
      </div>
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>
</asp:Content>

