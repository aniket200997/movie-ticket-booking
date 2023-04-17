<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Show-report.aspx.cs" Inherits="Show_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Show Listing</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="show_id" HeaderText="ID" />
                <asp:TemplateField>
                    <ItemTemplate>
                            <center><img src="uploads/<%# Eval("movie_image") %>" alt="" style="height:50px"></center>  
                    </ItemTemplate>
                     <HeaderTemplate>
                        Movie
                    </HeaderTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="movie_name" HeaderText="Movie Name" />
                <asp:BoundField DataField="audi_title" HeaderText="Audo Name"/>
                <asp:BoundField DataField="Show_From_Date" HeaderText="From Date"/>
                <asp:BoundField DataField="Show_To_Date" HeaderText="To Date"/>
                <asp:BoundField DataField="show_from_time" HeaderText="From Time"/>
                <asp:BoundField DataField="show_to_time" HeaderText="To Time"/>
                <asp:BoundField DataField="show_ticket_price" HeaderText="Ticket Cost"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "Show.aspx?show_id=" + Eval("show_id") %>'>Edit</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("show_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>

