<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% User user = (User) session.getAttribute("logadmUser");
    if(user==null){
        response.sendRedirect("/index.jsp");
    }
%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
<%
    String athrid = request.getParameter("athrid");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | Edit Author</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap_1.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="assets/css/font-awesome_1.css" rel="stylesheet" />
        <!-- DATATABLE STYLE  -->
        <link href="assets/js/dataTables/dataTables.bootstrap_1.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style_1.css" rel="stylesheet" />

        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    </head>
    <body>
        <!------MENU SECTION START-->
        <jsp:include page="includes/header.jsp"/>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Add Author</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Author Info
                            </div>
                            <div class="panel-body">
                                <form role="form" method="post"action="DB_Changes/edit_author.jsp">
                                    <div class="form-group">
                                        <label>Author Name</label>
                                        <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT * from  tblauthors where AuthId=<%=athrid%>
                                            </sql:query>
                                            <% int cnt = 1; %>
                                            <c:forEach var = "row" items = "${result.rows}">  
                                        <input class="form-control" type="text" name="author" value="<c:out value = "${row.AuthorName}"/>" required />
                                        <input type="hidden" name="authid" value="<%=athrid%>" />
                                        <% cnt=cnt+1; %>
                                        </c:forEach>
                                        </div>
                                        <button type="submit" name="update" class="btn btn-info">Update </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
        <?php include('includes/footer.php');?>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
