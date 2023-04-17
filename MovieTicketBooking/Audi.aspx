<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Audi.aspx.cs" Inherits="Audi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add Audi</h2>
            <div>
                <label for="email">Audi Name<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="audi_title" ErrorMessage="Plzz specify audi name"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_title" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">No of Seats<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="audi_no_of_seats" ErrorMessage="Plzz speccify audi no of seats"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_no_of_seats" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Row Start<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="audi_row_start" ErrorMessage="Plzz speccify audi row start"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_row_start" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Row End<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="audi_row_end" ErrorMessage="Plzz specify audi row end"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_row_end" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Column Start<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="audi_column_start" ErrorMessage="plzz specify audi column start"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_column_start" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Column End<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="audi_column_end" ErrorMessage="Plzz specify audi column end"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_column_end" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="email">Name Of MultiPlex<span>*<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="audi_description" ErrorMessage="plzz fill audi details"></asp:RequiredFieldValidator>
                </span></label>
                <asp:TextBox ID="audi_description" runat="server" TextMode="SingleLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="audi_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Audi" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

