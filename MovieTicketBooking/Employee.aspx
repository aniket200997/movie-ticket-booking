<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script>
  jQuery(function() {
      jQuery("#MainContent_user_dob").datepicker({
      changeMonth: true,
      changeYear: true,
       yearRange: "-50:-18",
       dateFormat: 'd MM,yy'
    });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add User</h2>
            <div>
                <label for="email">Select Role<span>*</span></label>
                <asp:DropDownList ID="user_level_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Select Department<span>*</span></label>
                <asp:DropDownList ID="user_department_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Select Designation<span>*</span></label>
                <asp:DropDownList ID="user_designation_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Name<span>*</span></label>
                <asp:TextBox ID="user_name" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <% if (Request.QueryString["user_id"] == "" || Convert.ToInt32(Session["login_level"]) == 1)
               { %>
            <div class="half_width">
                <label for="email">Username<span>*</span></label>
                <asp:TextBox ID="user_username" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Password<span>*</span></label>
                <asp:TextBox ID="user_password" runat="server" TextMode="Password" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Confirm Password<span>*</span></label>
                <asp:TextBox ID="user_confirm_password" runat="server" TextMode="Password" style="width:300px;"></asp:TextBox>
            </div>
            <% } %>
            <div class="half_width">
                <label for="email">Email<span>*</span></label>
                <asp:TextBox ID="user_email" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Gender<span>*</span></label>
                <asp:TextBox ID="user_gender" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Date of Birth<span>*</span></label>
                <asp:TextBox ID="user_dob" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Contact Number<span>*</span></label>
                <asp:TextBox ID="user_mobile" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 1<span>*</span></label>
                <asp:TextBox ID="user_add1" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 2<span>*</span></label>
                <asp:TextBox ID="user_add2" runat="server" required style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">City<span>*</span></label>
                <asp:DropDownList ID="user_city" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">State<span>*</span></label>
                <asp:DropDownList ID="user_state" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Country<span>*</span></label>
                <asp:DropDownList ID="user_country" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Description<span>*</span></label>
                <asp:TextBox ID="user_details" runat="server" required TextMode="MultiLine" style="width:300px; height:100px"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="user_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save User" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>