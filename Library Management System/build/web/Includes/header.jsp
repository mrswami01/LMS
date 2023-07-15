<%@page import="LMS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("index.jsp");
    }
%>
<div class="navbar navbar-inverse set-radius-zero" >
    <div class="container">
        <div class="topbar">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                </button>
                <a class="navbar-brand" >
                    <img width="75px" height="85px"src="img/VJTI_Logo.png" style="z-index: 1"  />
                </a>
            </div>
            <div class="toggle-dark">
                <button id="theme-toggle" class="mode_switch" onclick="myFunction()">Switch to dark mode</button>
            </div>
            <div class="right-div">
                <a href="index.jsp" class="btn btn-danger pull-right">LOG ME OUT</a>
            </div>
        </div>
    </div>
</div>
<!-- LOGO HEADER END-->
<%if(user!=null){
%>  
<section class="menu-section">
    <div class="container">
        <div class="row ">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">
                        <li><a href="Dashboard.jsp" class="menu-top-active">DASHBOARD</a></li>
                        <li><a href="issued-books.jsp">Issued Books</a></li>
                        <li>
                            <a href="my-profile.jsp" class="dropdown-toggle" id="ddlmenuItem" data-toggle="dropdown"> Account <i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu" role="menu" aria-labelledby="ddlmenuItem">
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="my-profile.jsp">My Profile</a></li>
                                <li role="presentation"><a role="menuitem" tabindex="-1" href="change-password.jsp">Change Password</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
<% } %>
<% if(user==null) { %>
<section class="menu-section">
    <div class="container">
        <div class="row ">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">                                               
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="index.jsp#StudentLogin">User Login</a></li>
                        <li><a href="registration.jsp">Registration</a></li>                   
                        <li><a href="AdminLogin.jsp">Admin Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<% } %>
<script>
    function myFunction() {
        var element = document.body;
        element.classList.toggle("dark");
    }
</script>
</body>