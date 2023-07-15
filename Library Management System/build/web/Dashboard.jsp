<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("index.jsp");
    }
%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | User Dash Board</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="css/style_1.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <!------MENU SECTION START-->
    <jsp:include page="Includes/header.jsp"/>
    <!-- MENU SECTION END-->    
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">User DASHBOARD</h4>
                </div>
            </div>
            <div class="row">
                <a href="listed-books.jsp">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-book fa-5x"></i>
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT COUNT(BookId) AS count FROM tblbooks
                            </sql:query>
                            <c:forEach var="row" items="${result.rows}">
                                <h3>${row.count}</h3>
                            </c:forEach>

                            Books Listed
                        </div></div></a>
                <div class="col-md-4 col-sm-4 col-xs-6">
                    <div class="alert alert-warning back-widget-set text-center">
                        <i class="fa fa-recycle fa-5x"></i>
                        <% int rsts=0; %>
                        <sql:query dataSource = "${snapshot}" var = "result">
                            SELECT  count(BookId)AS count from tblissuedbookdetails where StudentID='<%= user.getSid()%>' and (ReturnStatus= '<%= rsts %>' || ReturnStatus is null || ReturnStatus='')
                        </sql:query>
                        <c:forEach var="row" items="${result.rows}">
                            <h3>${row.count}</h3>                               
                        </c:forEach>
                        Books Not Returned Yet
                    </div>
                </div>
                <a href="issued-books.jsp">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                        <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-book fa-5x"></i>
                            <sql:query dataSource = "${snapshot}" var = "result">
                                SELECT count(StudentId)AS count from tblissuedbookdetails where StudentID ='<%= user.getSid()%>'
                            </sql:query>
                            <c:forEach var="row" items="${result.rows}">
                                <h3>${row.count}</h3>
                            </c:forEach>
                            Issued Books
                        </div></div></a>
            </div>    
        </div>
    </div>
    <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <jsp:include page="Includes/footer.jsp"/>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="/js/custom.js"></script>
    </footer>
</html>