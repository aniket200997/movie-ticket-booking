<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Language.aspx.cs" Inherits="Language" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add Language</h2>
            <div>
                <label for="email">Language Title<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="language_name" ErrorMessage="Plzz specify movie language title"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="language_name" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Description<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="language_description" ErrorMessage="plzz fill other details "></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="language_description" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="language_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Language" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

