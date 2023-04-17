<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="BookMovie.aspx.cs" Inherits="Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script>
jQuery(function() {
    jQuery("#MainContent_booking_date").datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: "-0:+0",
    dateFormat: 'd MM,yy'
});
});
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Book Movie Show</h2>
            <div>
                <label for="email">Select Date<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="booking_date" ErrorMessage="Plzz select date"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="booking_date" runat="server" ></asp:TextBox>
            </div>
            <div>
                <label for="email">Select Movie<span>*</span></label>
                <asp:DropDownList ID="booking_movie_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Select Show<span>*</span></label>
                <asp:DropDownList ID="booking_show_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">No Of Tickets<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="booking_no_seats" ErrorMessage="Plzz select no of ticket"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="booking_no_seats" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Book Show" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

