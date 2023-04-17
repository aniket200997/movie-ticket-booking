<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Introduction of Movie Ticket Booking System </h2>
	    <p>
        Movie Ticket Booking is an online portal for booking online movie ticker. A ticket may be valid for any seat ("free seating") or for a specific one ("allocated seating"). Sometimes, ex: for some train journeys, both are available, with an increased charge for a reserved seat. Free seating in a train means the risk that one has to stand, but in ex: a cinema it means a seat is guaranteed, just not a specific one.
        </p>
        <p>
        Paper or card is generally used, although plastic may be used instead for durability. Some have a barcode or magnetic stripe for keeping simple data stored on them, higher end ones use chips to store more data and prevent counterfeiting.
        </p>
        <p>
        A paper ticket often is perforated so it can be separated into two parts, one (the ticket stub) to be kept by the customer, and one to be kept by the ticket controller. Whether or not one can leave and reenter with the customer part only varies. It may not be allowed to avoid subsequent use of one ticket by multiple people, or even simultaneous use by giving the ticket to someone before the ticket check (if this is physically possible), but it may also be allowed, ex: in a movie theatre to buy, during a movie, a snack or drink before the ticket check and reenter.
        </p>
      </div>
    </main>
  </div>
</div>
</asp:Content>
