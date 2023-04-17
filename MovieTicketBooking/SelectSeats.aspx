<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SelectSeats.aspx.cs" Inherits="SelectSeats" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <p>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="RowAlphabateImage" runat="server" Text='<%# Eval("RowAlphabate") %>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R1Image" runat="server" ImageUrl='<%# Eval("R1") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R1",Eval("RowAlphabate"))%>' />
                    </td>   
                    <td>
                        <asp:ImageButton ID="R2Image" runat="server" ImageUrl='<%# Eval("R2") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R2",Eval("RowAlphabate"))%>'  />
                    </td>
                    <td>
                        <asp:ImageButton ID="R3Image" runat="server" ImageUrl='<%# Eval("R3") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R3",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R4Image" runat="server" ImageUrl='<%# Eval("R4") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R4",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R5Image" runat="server" ImageUrl='<%# Eval("R5") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R5",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R6Image" runat="server" ImageUrl='<%# Eval("R6") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R6",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R7Image" runat="server" ImageUrl='<%# Eval("R7") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R7",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R8Image" runat="server" ImageUrl='<%# Eval("R8") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R8",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R9Image" runat="server" ImageUrl='<%# Eval("R9") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R9",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R10Image" runat="server" ImageUrl='<%# Eval("R10") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R10",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R11Image" runat="server" ImageUrl='<%# Eval("R11") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R11",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R12Image" runat="server" ImageUrl='<%# Eval("R12") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R12",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R13Image" runat="server" ImageUrl='<%# Eval("R13") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R13",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R14Image" runat="server" ImageUrl='<%# Eval("R14") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R14",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R15Image" runat="server" ImageUrl='<%# Eval("R15") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R15",Eval("RowAlphabate"))%>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
         
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
           
            <ItemTemplate>
                 <tr style="">
                    <td>
                        <asp:Label ID="RowAlphabateImage" runat="server" Text='<%# Eval("RowAlphabate") %>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R1Image" runat="server" ImageUrl='<%# Eval("R1") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R1",Eval("RowAlphabate"))%>' />
                    </td>   
                    <td>
                        <asp:ImageButton ID="R2Image" runat="server" ImageUrl='<%# Eval("R2") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R2",Eval("RowAlphabate"))%>'  />
                    </td>
                    <td>
                        <asp:ImageButton ID="R3Image" runat="server" ImageUrl='<%# Eval("R3") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R3",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R4Image" runat="server" ImageUrl='<%# Eval("R4") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R4",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R5Image" runat="server" ImageUrl='<%# Eval("R5") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R5",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R6Image" runat="server" ImageUrl='<%# Eval("R6") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R6",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R7Image" runat="server" ImageUrl='<%# Eval("R7") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R7",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R8Image" runat="server" ImageUrl='<%# Eval("R8") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R8",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R9Image" runat="server" ImageUrl='<%# Eval("R9") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R9",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R10Image" runat="server" ImageUrl='<%# Eval("R10") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R10",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R11Image" runat="server" ImageUrl='<%# Eval("R11") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R11",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R12Image" runat="server" ImageUrl='<%# Eval("R12") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R12",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R13Image" runat="server" ImageUrl='<%# Eval("R13") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R13",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R14Image" runat="server" ImageUrl='<%# Eval("R14") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R14",Eval("RowAlphabate"))%>' />
                    </td>
                    <td>
                        <asp:ImageButton ID="R15Image" runat="server" ImageUrl='<%# Eval("R15") %>' OnClick="checkbook"  AlternateText='<%# String.Format("{0}R15",Eval("RowAlphabate"))%>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" >
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">Row</th>
                                    <th runat="server">R1</th>
                                    <th runat="server">R2</th>
                                    <th runat="server">R3</th>
                                    <th runat="server">R4</th>
                                    <th runat="server">R5</th>
                                    <th runat="server">R6</th>
                                    <th runat="server">R7</th>
                                    <th runat="server">R8</th>
                                    <th runat="server">R9</th>
                                    <th runat="server">R10</th>
                                    <th runat="server">R11</th>
                                    <th runat="server">R12</th>
                                    <th runat="server">R13</th>
                                    <th runat="server">R14</th>
                                    <th runat="server">R15</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style=""></td>
                    </tr>
                </table>
            </LayoutTemplate>
         
        </asp:ListView>
        <asp:Label ID="l1" runat="server"></asp:Label>
        <br />
        <asp:Label ID="l2" runat="server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Movie_TicketConnectionString %>" SelectCommand="SELECT * FROM [SeatAllocation]"></asp:SqlDataSource>
    </p>

    <asp:Button ID="Button1" runat="server" Text="Confirm" PostBackUrl="~/ConfirmTicket.aspx" />

</asp:Content>

