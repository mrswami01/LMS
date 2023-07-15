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
        <title>Online Library Management System | Add Book</title>
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

        <script type="text/javascript">
            function checkisbnAvailability() {
                $("#loaderIcon").show();
                jQuery.ajax({
                    url: "check_availability.php",
                    data: 'isbn=' + $("#isbn").val(),
                    type: "POST",
                    success: function (data) {
                        $("#isbn-availability-status").html(data);
                        $("#loaderIcon").hide();
                    },
                    error: function () {}
                });
            }
        </script>
        <script>
            queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const msg = urlParams.get('msg');
        if(msg === 'Added Book'){
            alert ("Added Book Sucessfully");
        }
        </script>
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
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Book Info
                            </div>
                            <div class="panel-body">
                                 <form role="form" method="post" action='DB_Changes/add_book.jsp'>

                                    <div class="col-md-6">   
                                        <div class="form-group">
                                            <label>Book Name<span style="color:red;">*</span></label>
                                            <input class="form-control" type="text" name="bookname" value= "Enter Bookname" autocomplete="off"  required />
                                        </div>
                                    </div>

                                    <div class="col-md-6">  
                                        <div class="form-group">
                                            <label> Category<span style="color:red;">*</span></label>
                                            <select class="form-control" name="category" required="required">
                                                <option value=""> Select Category</option>
                                                <% int status=1; 
                                                   int cnt= 1;
                                                %>
                                                <sql:query dataSource = "${snapshot}" var = "result">
                                                    SELECT * from  tblcategory where Status='<%=status%>'
                                                 </sql:query>
                                                 <c:forEach var="row" items="${result.rows}">
                                                     <option name="category" value="${row.CatId}"><c:out value="${row.CategoryName}"/></option>
                                                </c:forEach> 
                                            </select>
                                        </div></div>

                                    <div class="col-md-6">  
                                        <div class="form-group">
                                            <label> Author<span style="color:red;">*</span></label>
                                            <select class="form-control" name="author" required="required">
                                                <option value=""> Select Author</option>
                                                <sql:query dataSource = "${snapshot}" var = "result">
                                                    SELECT * from  tblauthors
                                                 </sql:query>
                                                 <c:forEach var="row" items="${result.rows}">
                                                     <option name="author" value="${row.AuthId}"><c:out value="${row.AuthorName}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div></div>

                                    <div class="col-md-6">  
                                        <div class="form-group">
                                            <label>ISBN Number<span style="color:red;">*</span></label>
                                            <input class="form-control" type="text" name="isbn" id="isbn" value= "Enter ISBN" required="required" autocomplete="off" onBlur="checkisbnAvailability()"  />
                                            <p class="help-block">An ISBN is an International Standard Book Number.ISBN Must be unique</p>
                                            <span id="isbn-availability-status" style="font-size:12px;"></span>
                                        </div></div>

                                    <div class="col-md-6">  
                                        <div class="form-group">
                                            <label>Price<span style="color:red;">*</span></label>
                                            <input class="form-control" type="text" name="bookprice" value= "Enter price in ₹" autocomplete="off"   required="required" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">  
                                        <div class="form-group">
                                            <label>Book Picture<span style="color:red;">*</span></label>
                                            <input class="form-control" type="file" name="bookpic" autocomplete="off"   required="required" />
                                        </div>
                                    </div>
                                    <button type="submit" name="add" id="add" class="btn btn-info">Submit </button>
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
