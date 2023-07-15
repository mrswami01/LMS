<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<% User user = (User) session.getAttribute("logUser");%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System |  Issued Books</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- DATATABLE STYLE  -->
        <link href="js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="css/style_1.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>
    <body>
        <!------MENU SECTION START-->
        <jsp:include page="Includes/header.jsp"/>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Manage Issued Books</h4>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Advanced Tables -->
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Issued Books 
                                </div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" 
                                                               url = "jdbc:mysql://localhost:3600/lms"
                                                               user = "root"  password = "User@123"/>

                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT tblbooks.BookName,tblbooks.ISBNNumber,tblissuedbookdetails.IssuesDate,tblissuedbookdetails.ReturnDate,tblissuedbookdetails.BookId as rid,tblissuedbookdetails.fine 
                                                from  tblissuedbookdetails join tblstudents on tblstudents.StudentId=tblissuedbookdetails.StudentId 
                                                join tblbooks on tblbooks.BookId=tblissuedbookdetails.BookId where tblstudents.StudentId='<%= user.getSid()%>' order by tblissuedbookdetails.BookId desc

                                            </sql:query>
                                            <thead>
                                                <tr>
                                                    <th>Book Name</th>
                                                    <th>ISBN </th>
                                                    <th>Issued Date</th>
                                                    <th>Return Date</th>
                                                    <th>Fine</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var = "row" items = "${result.rows}">
                                                    <tr>
                                                    <td class="center"><c:out value = "${row.BookName}"/></td>
                                                    <td class="center"><c:out value = "${row.ISBNNumber}"/></td>
                                                    <td class="center"><c:out value = "${row.IssuesDate}"/></td>
                                                    <td class="center"><c:if test="${row.ReturnDate==''}">
                                                        <span style="color:red">
                                                            <c:out value = "Not Return Yet"/>
                                                        </span>                                       
                                                    </c:if>
                                                    <c:if test="${row.ReturnDate!=''}">
                                                    <c:out value = "${row.ReturnDate}"/>
                                                    </td>
                                                    </c:if>
                                                    <td class="center"><c:out value = "${row.Fine}"/></td>                                    
                                                    </tr>
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
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
        <jsp:include page="Includes/footer.jsp"/>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
        <!-- DATATABLE SCRIPTS  -->
        <script src="js/dataTables/jquery.dataTables.js"></script>
        <script src="js/dataTables/dataTables.bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="js/custom.js"></script>

    </body>
</html>

