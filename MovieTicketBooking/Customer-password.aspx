<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer-password.aspx.cs" Inherits="Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body -->
      <% if (Request.QueryString["msg"] != "" && Request.QueryString["msg"] != null)
         { %>
      <div align="center" class="msg"><%=Request.QueryString["msg"]%></div>
      <%} %>
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Change Your Password</h2>
            <div>
                <label for="email">Old Password<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="old_password" ErrorMessage="plzz enter old password"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="old_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <label for="email">New Password<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="new_password" ErrorMessage="Plzz enter new password"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="new_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <label for="email">Confirm Password<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="confirm_password" ErrorMessage="plzz enter conform password"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="confirm_password" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="designation_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="changePassword" runat="server" Text="Change Password" 
                    onclick="changePassword_Click"/>
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>