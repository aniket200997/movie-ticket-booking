<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Audi-report.aspx.cs" Inherits="Audi_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Audi Listing</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="audi_id" HeaderText="ID" />
                <asp:BoundField DataField="audi_title" HeaderText="Name" />
                <asp:BoundField DataField="audi_no_of_seats" HeaderText="No Of Seats"/>
                <asp:BoundField DataField="audi_row_start" HeaderText="Row Start"/>
                <asp:BoundField DataField="audi_row_end" HeaderText="Row End"/>
                <asp:BoundField DataField="audi_column_start" HeaderText="Column Start"/>
                <asp:BoundField DataField="audi_column_end" HeaderText="Column End"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "Audi.aspx?audi_id=" + Eval("audi_id") %>'>Edit</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("audi_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>

