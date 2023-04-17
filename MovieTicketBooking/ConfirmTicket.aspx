<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ConfirmTicket.aspx.cs" Inherits="ConfirmTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 428px;
        }
        .auto-style3 {
            width: 866px;
        }
        .auto-style4 {
            width: 428px;
            height: 54px;
        }
        .auto-style5 {
            width: 866px;
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <center style="height: 356px; width: 793px">
 <table>
        <tr>
            <td class="auto-style1">Movie Name</td>
            <td class="auto-style3"><asp:Label ID="MovieName" runat="server"></asp:Label><br />
                <asp:Image runat="server" I ID="MovieImage" Width="100" Height="100"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Date</td>
            <td class="auto-style3"><asp:Label ID="MovieDate" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Multiplex</td>
            <td class="auto-style3"><asp:Label ID="Multiplex" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Audi</td>
            <td class="auto-style3"><asp:Label ID="Audi" runat="server"></asp:Label></td>
        </tr>
      <tr>
            <td class="auto-style1">Show Timings</td>
            <td class="auto-style3"><asp:Label ID="ShowTimings" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Number of seat</td>
            <td class="auto-style3"><asp:Label ID="Numberofseat" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Show Id</td>
            <td class="auto-style3"><asp:Label ID="Showid" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Amount paybale</td>
            <td class="auto-style3"><asp:Label ID="Amountpaybale" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style1">Seat Number</td>
            <td class="auto-style3"><asp:Label ID="Seatnumber" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style4">
           <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click"></asp:Button>
            </td>  
            <td class="auto-style5">
            <asp:Button ID="Payment" runat="server" Text="Payment" OnClick="Payment_Click"></asp:Button>
             </td>
        </tr>
    </table>
</center>
</asp:Content>

