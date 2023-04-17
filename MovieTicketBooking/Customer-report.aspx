<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Customer-report.aspx.cs" Inherits="Customer_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Customer Report</h2>
        <asp:GridView ID="DataReportListing" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="customer_id" HeaderText="ID" />
                <asp:BoundField DataField="customer_name" HeaderText="Name" />
                <asp:BoundField DataField="city_name" HeaderText="City" />
                <asp:BoundField DataField="customer_dob" HeaderText="Date of Birth" />
                <asp:BoundField DataField="customer_email" HeaderText="Email"/>
                <asp:BoundField DataField="customer_mobile" HeaderText="Contact No."/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# "Customer.aspx?customer_id=" + Eval("customer_id") %>'>View Details</asp:HyperLink>| 
                        <asp:LinkButton ID="deleteData" onclick="deleteData_Click" runat="server" CommandArgument='<%# Eval("customer_id") %>'>Delete</asp:LinkButton> 
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
     </div>
    </main>
  </div>
</div>
</asp:Content>

