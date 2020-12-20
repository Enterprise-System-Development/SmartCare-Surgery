<%-- 
    Document   : loginsuccess
    Created on : 02-Dec-2020, 17:15:02
    Author     : emmanueledmund
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="patientStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div align ="center">
        <h1>Smart care surgery system</h1>
        </div>

  <div class="admin-panel clearfix">
  <div class="slidebar">
    <div class="logo">
      <a href=""></a>
    </div>
    <ul>
      <li><a href="#dashboard" id="targeted">dashboard</a></li>
      <li><a href="#Book Appointment">Book Appointment</a></li>
      <li><a href="#View Medical Bill">View Medical Bill</a></li>
      <li><a href="#Pay Medical Bill">Pay Medical Bill</a></li>
      <li><a href="#Cancel Appointment">Cancel Appointment</a></li>
    </ul>
  </div>
  <div class="main">
    <ul class="topbar clearfix">
      <li><a href="#">Home</a></li>
      <li><a href="index.html">Logout</a></li>
      
    </ul>
    <div class="mainContent clearfix">
      <div id="dashboard">
        <h2 class="header"><span class="icon"></span>Dashboard</h2>
        <div class="monitor">
          <h4>Right Now</h4>
          <div class="clearfix">
            <ul class="content">
              <li>content</li>
              <li class="posts"><span class="count">179</span><a href="">posts</a></li>
              <li class="pages"><span class="count">13</span><a href="">pages</a></li>
              <li class="categories"><span class="count">21</span><a href="">categories</a></li>
              <li class="tags"><span class="count">305</span><a href="">tags</a></li>
            </ul>
            <ul class="discussions">
              <li>discussions</li>
              <li class="comments"><span class="count">353</span><a href="">comments</a></li>
              <li class="approved"><span class="count">319</span><a href="">approved</a></li>
              <li class="pending"><span class="count">0</span><a href="">pending</a></li>
              <li class="spam"><span class="count">34</span><a href="">spam</a></li>
            </ul>
          </div>
          <p>Theme <a href="">Twenty Eleven</a> with <a href="">3 widgets</a></p>
        </div>
        <div class="quick-press">
          <h4>Quick Press</h4>
          <form action="" method="post">
            <input type="text" name="title" placeholder="Title" />
            <input type="text" name="content" placeholder="Content" />
            <input type="text" name="tags" placeholder="Tags" />
            <button type="button" class="save">l</button>
            <button type="button" class="delet">m</button>
            <button type="submit" class="submit" name="submit">Publish</button>
          </form>
        </div>
      </div>
      <div id="Book Appointment">
        <h2 class="header">Book Appointment</h2>
      </div>
      <div id="View Medical Bill">
        <h2 class="header">View Medical Bill</h2>
      </div>
      <div id="Pay Medical Bill">
        <h2 class="header">Pay Medical Bill</h2>
      </div>
      <div id="Cancel Appointment">
        <h2 class="header">Cancel Appointment</h2>
      </div>
    </div>
    <ul class="statusbar">
      <li><a href=""></a></li>
      <li><a href=""></a></li>
      <li class="profiles-setting"><a href="">s</a></li>
      <li class="logout"><a href="">k</a></li>
    </ul>
  </div>
</div>
    </body>
</html>
