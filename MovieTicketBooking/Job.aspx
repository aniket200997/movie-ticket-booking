<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Job.aspx.cs" Inherits="Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<script>
  jQuery(function() {
      jQuery("#MainContent_job_post_date").datepicker({
          changeMonth: true,
          changeYear: true,
          yearRange: "+0:+1",
          dateFormat: 'd MM,yy'
      });
  });
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Add Job</h2>
            <div>
                <label for="email">Job Title<span>*</span></label>
                    <asp:TextBox ID="job_title" runat="server" required></asp:TextBox>
            </div>
            <div>
                <label for="email">Select Company<span>*</span></label>
                <asp:DropDownList ID="job_company_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Select Job Type<span>*</span></label>
                <asp:DropDownList ID="job_jt_id" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Select Job City<span>*</span></label>
                <asp:DropDownList ID="job_city" runat="server" CssClass="select-box" style="width:300px;" required></asp:DropDownList>
            </div>
            <div>
                <label for="email">Post Date<span>*</span></label>
                    <asp:TextBox ID="job_post_date" runat="server" required></asp:TextBox>
            </div>
            <div>
                <label for="email">Job Skills<span>*</span></label>
                    <asp:TextBox ID="job_skills" runat="server" required></asp:TextBox>
            </div>
            <div>
                <label for="email">Job Description<span>*</span></label>
                <asp:TextBox ID="job_description" runat="server" required TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="job_id" runat="server" Visible="False"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Save Job" onclick="save_data_Click" />
            </div>
        </div>
    </main>
  </div>
</div>
</asp:Content>

