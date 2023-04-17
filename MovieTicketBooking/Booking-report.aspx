<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Booking-report.aspx.cs" Inherits="Job_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Booking Details</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="movie_name" HeaderText="Movie Name" />
                <asp:BoundField DataField="booking_date" HeaderText="Booking Date"/>
                <asp:BoundField DataField="booking_amount" HeaderText="Booking Amount" />
                <asp:BoundField DataField="booking_no_seats" HeaderText="Total Seats"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "PrintTicket.aspx?booking_id=" + Eval("booking_id") %>'>View Details</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>

