<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="wrapper" style="margin-top:-18px">
  <div id="slider">
    <div id="slide-wrapper" class="rounded clear"> 
      <!-- ################################################################################################ -->
      <figure id="slide-1"><a class="view" href="#"><img src="My/Jolly%20LLB%202.jpg" alt=""></a>
      </figure>
      <figure id="slide-2"><a class="view" href="#"><img src="My/Ghayal-Once-Again.jpg" alt=""></a>
      </figure>
      <figure id="slide-3"><a class="view" href="#"><img src="My/Welcome%20bacl1.jpg" alt=""></a>
      </figure>
      <figure id="slide-4"><a class="view" href="#"><img src="My/Force2.jpg" alt=""></a>
      </figure>
      <figure id="slide-5"><a class="view" href="#"><img src="My/Guru.jpg" alt=""></a>
      </figure>
      <!-- ################################################################################################ -->
      <ul id="slide-tabs">
        <li><a href="#slide-1">Manage Movieses</a></li>
        <li><a href="#slide-2">Manage Users</a></li>
        <li><a href="#slide-3">Manage Bookings</a></li>
        <li><a href="#slide-4">Manage Shows</a></li>
        <li><a href="#slide-5">Manage Customers</a></li>
      </ul>
      <!-- ################################################################################################ --> 
    </div>
  </div>
</div>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30"> 
        <!-- Left Column -->
        <div class="one_quarter first"> 
          <!-- ################################################################################################ -->
          <ul class="nospace">
            <li class="btmspace-15"><a href="#"><em class="heading">MOVIE MANAGEMENT</em> 
		<img class="borderedbox" src="My/WelcomeBack.jpg" alt=""></a></li>
            <li class="btmspace-15"><a href="#"><em class="heading">BOOKING MANAGEMENT</em> 
		<img class="borderedbox" src="My/Jolly%20LLB%202.jpg" alt=""></a></li>
            <li class="btmspace-15"><a href="#"><em class="heading">CUSTOMER MANAGEMENT</em> 
		<img class="borderedbox" src="My/Ghayal-Once-Again.jpg" alt=""></a></li>
            <li><a href="#"><em class="heading">SHOWS MANAGEMENT</em> 
		<img class="borderedbox" src="My/Guru.jpg" alt=""></a></li>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Left Column --> 
        <!-- Middle Column -->
        <div class="one_half" style="width:70%"> 
          <!-- ################################################################################################ -->
          <h2>ONLINE MOVIE TICKET BOOKING SYSTEM</h2>
          <ul class="nospace listing">
            <li class="clear">
              <div class="imgl borderedbox"><img src="images/demo/main2.jpg" alt=""></div>
              <p class="nospace btmspace-15"><a href="#">Movie Management System</a></p>
              <p>Today people are accustomed to accessing meaningful information from a huge array of sources. The reality is that workplace learning happens continuously in lots of different ways.</p>
            </li>
            <li class="clear">
              <div class="imgl borderedbox"><img src="images/demo/main1.jpg" alt=""></div>
              <p class="nospace btmspace-15"><a href="#">Booking Management System</a></p>
              <p>The Employee Management System runs online, which allows you to access any information from anywhere in the world at any given time, as long as you have Internet access. Manage your employees from anywhere.</p>
            </li>
            <li class="clear">
              <div class="imgl borderedbox"><img src="images/demo/main3.jpg" alt=""></div>
              <p class="nospace btmspace-15"><a href="#">Customers Management System</a></p>
              <p>Many UW employees have multiple records in this database, either because they hold more than one job title or because their salary is paid out of multiple funding sources.</p>
            </li>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Middle Column --> 
      </div>
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>
</asp:Content>

