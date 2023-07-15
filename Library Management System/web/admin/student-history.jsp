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
    String sid = request.getParameter("stdid");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | Student History</title>
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
                        <script>
                            sid = params.get['stdid'];
                        </script>
                        <h4 class="header-line">#<script>console.log(sid);</script> Book Issued History</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <script>console.log(sid);</script> Details
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Student ID</th>
                                                <th>Student Name</th>
                                                <th>Issued Book  </th>
                                                <th>Issued Date</th>
                                                <th>Returned Date</th>
                                                <th>Fine (if any)</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT 
                                                tblstudents.StudentId ,
                                                tblstudents.FullName,
                                                tblstudents.EmailId,
                                                tblstudents.MobileNumber,
                                                tblbooks.BookName,
                                                tblbooks.ISBNNumber,
                                                tblissuedbookdetails.IssuesDate,
                                                tblissuedbookdetails.ReturnDate,
                                                tblissuedbookdetails.BookId,
                                                tblissuedbookdetails.fine,
                                                tblissuedbookdetails.ReturnStatus,
                                                tblbooks.BookId as bid,
                                                tblbooks.bookImage 
                                                from  tblbooks
                                                LEFT JOIN tblstudents 
                                                on tblbooks.StudentId=tblstudents.StudentId 
                                                join tblissuedbookdetails
                                                on tblbooks.BookId=tblissuedbookdetails.BookId where tblstudents.StudentId='<%=sid%>'   
                                            </sql:query>
                                            <% int cnt = 1; %>
                                             <c:forEach var = "row" items = "${result.rows}">
                                                    <tr class="odd gradeX">
                                                    <td class="center"><%= cnt %></td>
                                                    <td class="center"><c:out value = "${row.StudentId}"/></td>
                                                    <td class="center"><c:out value = "${row.FullName}"/></td>
                                                    <td class="center"><c:out value = "${row.BookName}"/></td>
                                                    <td class="center"><c:out value = "${row.IssuesDate}"/></td>
                                                    <td class="center">
                                                        <c:if test="${row.ReturnDate==''}">
                                                            <c:out value="Not returned yet" />
                                                        </c:if>
                                                        <c:if test="${row.ReturnDate!=''}">
                                                            <c:out value="${row.ReturnDate}" />
                                                        </c:if>
                                                    </td>
                                                        <td class="center">
                                                        <c:if test="${row.ReturnDate==''}">
                                                            <c:out value="Not returned yet" />
                                                        </c:if>
                                                        <c:if test="${row.ReturnDate!=''}">
                                                            <c:out value="${row.fine}" />
                                                        </c:if>   
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
