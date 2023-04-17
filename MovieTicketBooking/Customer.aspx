<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
  jQuery(function() {
      jQuery("#ctl00_MainContent_customer_dob").datepicker({
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
      <h2>Register User</h2>
            <div class="half_width">
                <label for="email">Name<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="customer_name" ErrorMessage="Plzz enter name"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_name" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Username<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="customer_username" ErrorMessage="Plzz enter username"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_username" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Password<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="customer_password" ErrorMessage="Plzz enter password"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_password" runat="server" TextMode="Password" style="width:300px;" MaxLength="8"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Confirm Password<span>*<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="customer_password" ControlToValidate="customer_confirm_password" ErrorMessage="Password not match"></asp:CompareValidator>
                </span></label>
                <asp:TextBox ID="customer_confirm_password" runat="server" TextMode="Password" style="width:300px;" MaxLength="8"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Email<span>*<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="customer_email" ErrorMessage="Plzz enter valid mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </span></label>
                <asp:TextBox ID="customer_email" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Gender<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="customer_gender" ErrorMessage="Plzz specify gender"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_gender" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Date of Birth<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="customer_dob" ErrorMessage="Plzz Specify date of birth"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_dob" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Contact Number<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="customer_mobile" ErrorMessage="plzz provide contact no"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_mobile" runat="server" style="width:300px;" MaxLength="10"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 1<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="customer_add1" ErrorMessage="Specify address"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_add1" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">Address 2<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="customer_add2" ErrorMessage="Specify address"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_add2" runat="server" style="width:300px;"></asp:TextBox>
            </div>
            <div class="half_width">
                <label for="email">City<span>*</span></label><asp:DropDownList ID="customer_city" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">State<span>*</span></label><asp:DropDownList ID="customer_state" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Country<span>*</span></label><asp:DropDownList ID="customer_country" runat="server" CssClass="select-box" style="width:300px;"></asp:DropDownList>
            </div>
            <div class="half_width">
                <label for="email">Upload Photo<span>*</span></label>
                <asp:FileUpload ID="customer_resume" runat="server" />
            </div>
            <div>
                <label for="email">Description<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="customer_details" ErrorMessage="Specify other details"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="customer_details" runat="server" TextMode="MultiLine" style="width:300px; height:100px"></asp:TextBox>
            </div>
            <% if (Convert.ToInt32(Session["login"]) != 1)
                { %>
            <div>
                <asp:Button ID="Button1" runat="server" Text="Save Customer" onclick="save_data_Click" Height="46px" Width="197px" />
                <asp:TextBox ID="upload_file" runat="server" Visible="False"></asp:TextBox>
                <asp:TextBox ID="customer_id" runat="server" Visible="False"></asp:TextBox>
            </div>
          <% } %>
        </div>
    </main>
  </div>
</div>
</asp:Content>