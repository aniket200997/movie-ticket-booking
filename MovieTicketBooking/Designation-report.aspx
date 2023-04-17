<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Designation-report.aspx.cs" Inherits="Designation_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Designation Listing</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="designation_id" HeaderText="ID" />
                <asp:BoundField DataField="designation_title" HeaderText="Name" />
                <asp:BoundField DataField="designation_description" HeaderText="Description"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "Designation.aspx?designation_id=" + Eval("designation_id") %>'>Edit</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("designation_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>

