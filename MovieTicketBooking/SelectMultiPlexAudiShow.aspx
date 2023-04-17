<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelectMultiPlexAudiShow.aspx.cs" Inherits="SelectMultiPlexAudiShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        jQuery(function () {
            jQuery("#ctl00_MainContent_booking_date").datepicker({
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
                <asp:TextBox ID="booking_date" runat="server" OnTextChanged="booking_date_TextChanged" Width="298px" ></asp:TextBox>
                <asp:Button ID="mybutton" runat="server" Text="Show MultiPlex" OnClick="booking_date_TextChanged" ValidationGroup="a" />
            </div>
            <div>
                <label for="email">Select MultiPlex<span>*</span></label>
                <asp:DropDownList ID="multiplex" runat="server" CssClass="select-box" style="width:300px;" AutoPostBack="True" OnSelectedIndexChanged="multiplex_SelectedIndexChanged" ></asp:DropDownList>
                  <asp:Button ID="Button2" runat="server" Text="Show Audi" OnClick="multiplex_SelectedIndexChanged" ValidationGroup="a" />
            </div>
            <div>
                <label for="email">Select Audi<span>*</span></label>
                <asp:DropDownList ID="audi" runat="server" CssClass="select-box" style="width:300px;" ></asp:DropDownList>
                <asp:Button ID="Button3" runat="server" Text="Show Timings"  ValidationGroup="a" OnClick="Button3_Click" />

            </div>
            <div>
                <label for="email">Select Show<span>*</span></label>
                <asp:DropDownList ID="show" runat="server" CssClass="select-box" style="width:300px;" ></asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Select Seats" OnClick="Button1_Click1"   />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

