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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | Manage Authors</title>
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
        <% String msg= request.getParameter("msg"); %>
        <script>
            queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const msg = urlParams.get('msg');
            const delmsg = urlParams.get('delmsg');
        if(msg === 'Author Updated'){
            alert ("Author Updated");
        }
        if(delmsg === 'Author Deleted'){
            alert ("Author Deleted");
        }
                if(msg === 'Added Author'){
            alert ("Added Author");
        }
        </script>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Manage Authors</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Authors Listing
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Author</th>
                                                <th>Creation Date</th>
                                                <th>Updation Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT * from  tblauthors
                                            </sql:query>
                                            <% int cnt = 1; %>
                                            <c:forEach var = "row" items = "${result.rows}">                                              
                                            <tr class="odd gradeX">
                                                <td class="center"><%= cnt %></td>
                                                    <td class="center"><c:out value = "${row.AuthorName}"/></td>
                                                    <td class="center"><c:out value = "${row.creationDate}"/></td>
                                                    <td class="center"><c:out value = "${row.UpdationDate}"/></td>
                                                <td class="center">
                                                    <a href="edit-author.jsp?athrid=${row.AuthId}"><button class="btn btn-primary"><i class="fa fa-edit "></i> Edit</button> 
                                                        <a href="DB_Changes/delete_author.jsp?authid=${row.AuthId}" onclick="return confirm('Are you sure you want to delete?');">  <button class="btn btn-danger"><i class="fa fa-pencil"></i> Delete</button>
                                                            </td>
                                                            </tr>
                                                            <% cnt=cnt+1; %>
                                                                   </c:forEach>                                      
                                                            </tbody>
                                                            </table>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <!--End Advanced Tables -->
                                                            </div>
                                                            </div>
                                                            </div>
                                                            </div>
                                                            <!-- CONTENT-WRAPPER SECTION END-->
                                                            <jsp:include page="includes/footer.jsp"/>
                                                                    <!-- FOOTER SECTION END-->
                                                                    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
                                                                    <!-- CORE JQUERY  -->
                                                                    <script src="assets/js/jquery-1.10.2.js"></script>
                                                                    <!-- BOOTSTRAP SCRIPTS  -->
                                                                    <script src="assets/js/bootstrap.js"></script>
                                                                    <!-- DATATABLE SCRIPTS  -->
                                                                    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
                                                                    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
                                                                    <!-- CUSTOM SCRIPTS  -->
                                                                    <script src="assets/js/custom.js"></script>
                                                                    </body>
                                                                    </html>
