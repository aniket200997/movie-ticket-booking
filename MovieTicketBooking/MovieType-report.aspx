<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MovieType-report.aspx.cs" Inherits="MovieType_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Movie Type Listing</h2>
            <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="type_id" HeaderText="ID" />
                    <asp:BoundField DataField="type_name" HeaderText="Name" />
                    <asp:BoundField DataField="type_description" HeaderText="Description"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "MovieType.aspx?type_id=" + Eval("type_id") %>'>Edit</asp:HyperLink>| 
                            <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("type_id") %>'>Delete</asp:LinkButton> 
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </main>
  </div>
</div>
</asp:Content>