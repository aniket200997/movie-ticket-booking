<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Show.aspx.cs" Inherits="Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        jQuery(function () {
            jQuery("#ctl00_MainContent_show_from_date").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+0",
                dateFormat: 'd MM,yy'
            });
        });
        jQuery(function () {
            jQuery("#ctl00_MainContent_show_to_date").datepicker({
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
      <h2>Add Show</h2>
            <div>
                <label for="email">Select Movie<span>*</span></label>
                <asp:DropDownList ID="show_movie_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Select Audi<span>*</span></label>
                <asp:DropDownList ID="show_audi_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
           <div>
                <label for="email">From Date<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="show_from_date" ErrorMessage="Plzz enter movie release date"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_from_date" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">To Date<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="show_to_date" ErrorMessage="Plzz enter movie end date"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_to_date" runat="server"></asp:TextBox>
            </div>
            <div>
            <div>
                <label for="email">From Time<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="show_from_time" ErrorMessage="Plzz specify show start time"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_from_time" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">To Time<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="show_to_time" ErrorMessage="plzz specify show end time"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_to_time" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Ticket Price<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="show_ticket_price" ErrorMessage="Plzz specify ticket price"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_ticket_price" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Description<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="show_description" ErrorMessage="Plzz fill shoow details"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="show_description" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="show_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Show" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

