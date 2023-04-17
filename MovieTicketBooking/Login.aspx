<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <% if (Request.QueryString["msg"] != "" && Request.QueryString["msg"] != null)
         { %>
      <div align="center" class="msg"><%=Request.QueryString["msg"]%></div>
      <%} %>
      <!-- main body --> 
      <div id="comments" style="width:50%; margin:auto">
      <h2>Login Form</h2>
          <div>
            <label for="name">Username <span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="users_username" ErrorMessage="Plzz enter username"></asp:RequiredFieldValidator>
              </span></label>
              <asp:TextBox ID="users_username" runat="server"></asp:TextBox>
          </div>
          <div>
            <label for="email">Password <span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="users_password" ErrorMessage="Plzz enter password"></asp:RequiredFieldValidator>
              </span></label>
              <asp:TextBox ID="users_password" runat="server" TextMode="Password"></asp:TextBox>
          </div>
          <div>
            <asp:Button ID="login_button" runat="server" Text="Login" 
                  onclick="login_button_Click"/>
            &nbsp;
            <input name="reset" type="reset" value="Cancel">
			
          </div>
		  <div style="display:none"><a href="forgot-password.jsp">Forgot Password</a></div>
        </div>
      <div class="clear"></div>
    </main>
  </div>
</div>
</asp:Content>