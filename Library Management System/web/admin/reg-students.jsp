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
        <title>Online Library Management System | Manage Reg Students</title>
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
                        <h4 class="header-line">Manage Registered Students</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Reg Students
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Student ID</th>
                                                <th>Student Name</th>
                                                <th>Email id </th>
                                                <th>Mobile Number</th>
                                                <th>Reg Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT * from tblstudents
                                            </sql:query>
                                            <% int cnt = 1; %>
                                            <c:forEach var = "row" items = "${result.rows}">                                     
                                                <tr class="odd gradeX">
                                                    <td class="center"><%= cnt %></td>
                                                    <td class="center"><c:out value = "${row.StudentId}"/></td>
                                                    <td class="center"><c:out value = "${row.FullName}"/></td>
                                                    <td class="center"><c:out value = "${row.EmailId}"/></td>
                                                    <td class="center"><c:out value = "${row.MobileNumber}"/></td>
                                                    <td class="center"><c:out value = "${row.RegDate}"/></td>
                                                    <td class="center">
                                                        <c:if test="${row.Status == 1}">
                                                            <span style="color: green">Active</span>
                                                        </c:if>
                                                        <c:if test="${row.Status == 0}">
                                                            <span style="color: red">Blocked</span>
                                                        </c:if>
                                                    </td>
                                                    <td class="center">
                                                        <c:if test="${row.Status == 1}">
                                                            <a href="DB_Changes/blockuser.jsp?inid=${row.StudentId}" onclick="return confirm('Are you sure you want to block this student?');" >  <button class="btn btn-danger"> Inactivate</button>
                                                            </c:if>
                                                            <c:if test="${row.Status == 0}">   
                                                                <a href="DB_Changes/activateuser.jsp?id=${row.StudentId}" onclick="return confirm('Are you sure you want to active this student?');"><button class="btn btn-primary"> Activate</button> 
                                                                </c:if> 
                                                                <a href="student-history.jsp?stdid=${row.StudentId}"><button class="btn btn-success"> Details</button> 
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
