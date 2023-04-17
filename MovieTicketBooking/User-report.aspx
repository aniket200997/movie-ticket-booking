<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="User-report.aspx.cs" Inherits="User_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>User Report</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="ID" />
                <asp:BoundField DataField="user_name" HeaderText="First Name" />
                <asp:BoundField DataField="user_department_id" HeaderText="Department" />
                <asp:BoundField DataField="user_designation_id" HeaderText="Designation" />
                <asp:BoundField DataField="user_email" HeaderText="Email"/>
                <asp:BoundField DataField="user_mobile" HeaderText="Contact No."/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "User.aspx?user_id=" + Eval("user_id") %>'>Edit</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("user_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
     </div>
    </main>
  </div>
</div>
</asp:Content>

