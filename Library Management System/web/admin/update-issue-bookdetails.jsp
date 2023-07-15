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
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | Issued Book Details</title>
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
        <script>
            // function for get student name
            function getstudent() {
                $("#loaderIcon").show();
                jQuery.ajax({
                    url: "get_student.php",
                    data: 'studentid=' + $("#studentid").val(),
                    type: "POST",
                    success: function (data) {
                        $("#get_student_name").html(data);
                        $("#loaderIcon").hide();
                    },
                    error: function () {}
                });
            }
            //function for book details
            function getbook() {
                $("#loaderIcon").show();
                jQuery.ajax({
                    url: "get_book.php",
                    data: 'bookid=' + $("#bookid").val(),
                    type: "POST",
                    success: function (data) {
                        $("#get_book_name").html(data);
                        $("#loaderIcon").hide();
                    },
                    error: function () {}
                });
            }
        </script> 
        <style type="text/css">
            .others{
                color:red;
            }

        </style>
    </head>
    <body>
        <!------MENU SECTION START-->
        <jsp:include page="includes/header.jsp"/>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Issued Book Details</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10 col-sm-6 col-xs-12 col-md-offset-1">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Issued Book Details
                            </div>
                            <%
                            String rid = request.getParameter("rid");
                            %>
                            <sql:query dataSource = "${snapshot}" var = "result">
                                        SELECT tblstudents.StudentId,tblstudents.EmailId,tblstudents.FullName,tblstudents.MobileNumber,tblbooks.BookName,tblbooks.ISBNNumber,tblbooks.bookImage,tblissuedbookdetails.IssuesDate,tblissuedbookdetails.ReturnDate,tblissuedbookdetails.BookId 
                                        as rid,tblissuedbookdetails.fine 
                                        from  tblissuedbookdetails join tblstudents on tblstudents.StudentId=tblissuedbookdetails.StudentId 
                                        join tblbooks on tblbooks.BookId=tblissuedbookdetails.BookId where tblissuedbookdetails.BookId='<%=rid%>'
                                    </sql:query>
                            <div class="panel-body">
                                <form role="form" method="post" >
                                    <% int cnt = 1; %>
                                    <c:forEach var = "row" items = "${result.rows}">                                      
                                        <input type="hidden" name="bookid" value="${row.BookId}">
                                            <h4>Student Details</h4>
                                            <hr />
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Student ID :</label>
                                                    <c:out value="${row.StudentId}"/>
                                                </div></div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Student Name :</label>
                                                    <c:out value="${row.FullName}"/>
                                                </div></div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Student Email Id :</label>
                                                    <c:out value="${row.EmailId}"/>
                                                </div></div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Student Contact No :</label>
                                                    <c:out value="${row.MobileNumber}"/>
                                                </div></div>
                                                
                                            <h4>Book Details</h4>
                                            <hr />
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Book Image :</label>
                                                    <img src="bookimg/${row.bookImage}" width="120">
                                                </div></div>
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Book Name :</label>
                                                    <c:out value="${row.BookName}"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>ISBN :</label>
                                                    <c:out value="${row.ISBNNumber}"/>
                                                </div>
                                            </div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Book Issued Date :</label>
                                                    <c:out value="${row.IssuesDate}"/>
                                                </div></div>

                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Book Returned Date :</label>
                                                    <c:if test="${row.ReturnDate == ''}">
                                                        <c:out value="Not Return Yet"/>
                                                    </c:if> 
                                                    <c:if test="${row.ReturnDate != ''}">
                                                        <c:out value="${row.ReturnDate}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="col-md-12"> 
                                                <div class="form-group">
                                                    <label>Fine:</label>
                                                    <c:if test="${row.fine == ''}">
                                                         <input class="form-control" type="text" name="fine" id="fine"  required />
                                                    </c:if>
                                                    <c:if test="${row.fine != ''}">
                                                        <c:out value="${row.fine}"/>
                                                    </c:if>
                                                </div>
                                            </div>
                                                <c:if test="${row.fine == ''}">
                                                    <button type="submit" name="return" id="submit" class="btn btn-info">Return Book </button>
                                                 </c:if>
                                            </div>
                                        </c:forEach>
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
