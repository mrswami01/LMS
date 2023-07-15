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
        <title>Online Library Management System | Edit Book</title>
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
                        <h4 class="header-line">Add Book</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md12 col-sm-12 col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Book Info
                            </div>
                            <% String bookid = request.getParameter("bookid"); 
                               String authrid = request.getParameter("authid");
                               String authrname = request.getParameter("authname");
                            %>
                            <div class="panel-body">
                                <form role="form" method="post" action="DB_Changes/edit_book.jsp">
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
                                        on tblbooks.Authid=tblauthors.AuthId where tblbooks.BookId='<%=bookid%>'                                           
                                    </sql:query>
                                    <% int cnt = 1; %>
                                    <c:forEach var = "row" items = "${result.rows}">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Book Image</label>
                                                <img src="bookimg/${row.bookImage}" width="100">
                                                    <a href="change-bookimg.jsp?bookid=${row.bookImage}">Change Book Image</a>
                                            </div></div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Book Name<span style="color:red;">*</span></label>
                                                <input class="form-control" type="text" name="bookname" value="${row.BookName}" required />
                                            </div></div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> Category<span style="color:red;">*</span></label>
                                                <select class="form-control" name="catId" required="required">
                                                    <option name="category" value="${row.CatId}"> <c:out value="${row.CategoryName}"/></option>
                                                    <% int status=1; %>
                                                    <sql:query dataSource = "${snapshot}" var = "result1">
                                                        SELECT * from  tblcategory where Status=<%=status%>
                                                    </sql:query>
                                                    <c:forEach var = "row1" items = "${result1.rows}"> 
                                                    <option name="category" value="${row1.CatId}"><c:out value="${row1.CategoryName}"/></option>
                                                    </c:forEach> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label> Author<span style="color:red;">*</span></label>
                                                <select class="form-control" name="authId" required="required">
                                                    <option name="author" value="${row.AuthId}"><c:out value="${row.AuthorName}"/></option>
                                                    <sql:query dataSource = "${snapshot}" var = "result2">
                                                        SELECT * from  tblauthors 
                                                    </sql:query>
                                                    <c:forEach var = "row2" items = "${result2.rows}"> 
                                                    <option name="author" value="${row2.AuthId}"><c:out value="${row2.AuthorName}"/></option>
                                                    </c:forEach> 
                                                </select>
                                            </div></div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>ISBN Number<span style="color:red;">*</span></label>
                                                <input class="form-control" type="text" name="isbn" value="<c:out value="${row.ISBNNumber}"/>"  readonly />
                                                <p class="help-block">An ISBN is an International Standard Book Number.ISBN Must be unique</p>
                                            </div></div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Price<span style="color:red;">*</span></label>
                                                <input class="form-control" type="text" name="price" value="<c:out value="${row.BookPrice}"/>"  required="required" />
                                                <input type="hidden" name="bookId" value="${row.BookId}" />
                                            </div></div>
                                            <% cnt=cnt+1; %>
                                            </c:forEach>
                                        <div class="col-md-12"> <button type="submit" name="update" class="btn btn-info">Update </button></div>
                                    </form>
                                </div>
                            </div>
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
