<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<% User user = (User) session.getAttribute("logUser");%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                                    Listed Books 
                                </div>
                                <div class="panel-body">                                    
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Book Name</th>
                                                    <th>Category</th>
                                                    <th>Author</th>
                                                    <th>ISBN</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <sql:query dataSource = "${snapshot}" var = "result">
                                                    SELECT 
                                                    tblbooks.BookName,
                                                    tblcategory.CategoryName,
                                                    tblauthors.AuthorName,
                                                    tblbooks.ISBNNumber,
                                                    tblbooks.BookPrice,
                                                    tblbooks.BookId,
                                                    tblbooks.bookImage,
                                                    tblbooks.isIssued 
                                                    from  tblbooks 
                                                    LEFT JOIN tblcategory 
                                                    on tblbooks.CatId=tblcategory.CatId
                                                    LEFT JOIN tblauthors 
                                                    on tblbooks.Authid=tblauthors.AuthId
                                                </sql:query>
                                                <% int cnt = 1; %>
                                                <c:forEach var = "row" items = "${result.rows}">                                    
                                                    <tr class="odd gradeX">
                                                        <td class="center"><%= cnt %></td>
                                                        <td class="center" width="300">
                                                            <img src="./img/bookimg/<c:out value = "${row.bookImage}"/>" width="100">
                                                                <br /><b><c:out value = "${row.BookName}"/></b></td>
                                                        <td class="center"><c:out value = "${row.CategoryName}"/></td>
                                                        <td class="center"><c:out value = "${row.AuthorName}"/></td>
                                                        <td class="center"><c:out value = "${row.ISBNNumber}"/></td>
                                                        <td class="center"><c:out value = "${row.BookPrice}"/></td>
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
        </div>      
    </body>
    <!-- CONTENT-WRAPPER SECTION END-->
    <footer>
        <jsp:include page="Includes/footer.jsp"/>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="js/custom.js"></script>
    </footer>
</html>