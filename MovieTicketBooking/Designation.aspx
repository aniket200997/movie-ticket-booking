<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Designation.aspx.cs" Inherits="Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add Designation</h2>
            <div>
                <label for="email">Designation Title<span>*</span></label>
                <asp:TextBox ID="designation_title" runat="server" required></asp:TextBox>
            </div>
            <div>
                <label for="email">Description<span>*</span></label>
                <asp:TextBox ID="designation_description" runat="server" required TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="designation_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Designation" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>