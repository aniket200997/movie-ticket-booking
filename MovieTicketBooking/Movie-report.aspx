<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Movie-report.aspx.cs" Inherits="Movie_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Movie Listing</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="movie_id" HeaderText="ID" />
                <asp:TemplateField>
                    <ItemTemplate>
                            <center><img src="uploads/<%# Eval("movie_image") %>" alt="" style="height:50px"></center>  
                    </ItemTemplate>
                     <HeaderTemplate>
                        Logo
                    </HeaderTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="movie_name" HeaderText="Name" />
                <asp:BoundField DataField="movie_director" HeaderText="Director"/>
                <asp:BoundField DataField="movie_release_date" HeaderText="Release Date"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "Movie.aspx?movie_id=" + Eval("movie_id") %>'>Edit</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("movie_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>

