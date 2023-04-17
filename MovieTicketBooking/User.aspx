<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script>
  jQuery(function() {
      jQuery("#ctl00_MainContent_user_dob").datepicker({
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
                <label for="email">Select Role<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_level_id" ErrorMessage="Plzz select user role"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_level_id" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Select Department<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="user_department_id" ErrorMessage="Plzz selecct user department"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_department_id" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Select Designation<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="user_designation_id" ErrorMessage="Plzz select user designation"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_designation_id" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Name<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="user_name" ErrorMessage="Plzz enter the name"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_name" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <% if (Request.QueryString["user_id"] == "" || Convert.ToInt32(Session["login_level"]) == 1)
               { %>
            <div class="half_width">
                <label for="email">Username<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="user_username" ErrorMessage="Plzz enter username"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_username" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Password<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="user_password" ErrorMessage="Plzz enter password"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_password" runat="server" TextMode="Password" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Confirm Password<span>*<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="user_password" ControlToValidate="user_confirm_password" ErrorMessage="Plzz enter confirm password"></asp:CompareValidator>
                </span></label>
                <asp:TextBox ID="user_confirm_password" runat="server" TextMode="Password" style="width:300px;"></asp:TextBox>
            </div>
            <% } %>
            <div class="half_width">
                <label for="email">Email<span>*<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="user_email" ErrorMessage="plzz enter valid mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </span></label>
                <asp:TextBox ID="user_email" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Gender<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="user_gender" ErrorMessage="Plzz specify gender"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_gender" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Date of Birth<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="user_dob" ErrorMessage="Plzz specify date of birth"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_dob" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Contact Number<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="user_mobile" ErrorMessage="Plzz enter contact number"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_mobile" runat="server" style="width:300px;" MaxLength="10"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 1<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="user_add1" ErrorMessage="Plzz enter address"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_add1" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 2<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="user_add2" ErrorMessage="Plzz enter address"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_add2" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">City<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="user_city" ErrorMessage="Plzz select city"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_city" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">State<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="user_state" ErrorMessage="plzz selecct state"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_state" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Country<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="user_country" ErrorMessage="Plzz select country"></asp:RequiredFieldValidator>
                </span></label>
                <asp:DropDownList ID="user_country" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div>
                <label for="email">Description<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="user_details" ErrorMessage="Plzz fill other details"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="user_details" runat="server" TextMode="MultiLine" style="width:300px; height:100px"></asp:TextBox>
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