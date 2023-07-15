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
        <title>Online Library Management System | Manage Issued Books</title>
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
        <script>
            queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const msg = urlParams.get('msg');
        if(msg === 'Book Issued'){
            alert ("Book Issued");
        }   
        </script>
        <!------MENU SECTION START-->
        <jsp:include page="includes/header.jsp"/>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Manage Issued Books</h4>
                    </div>
                    <div class="row">
                        <?php if($_SESSION['error']!="")
                        {?>
                        <div class="col-md-6">
                            <div class="alert alert-danger" >
                                <strong>Error :</strong> 
                                <?php echo htmlentities($_SESSION['error']);?>
                                <?php echo htmlentities($_SESSION['error']="");?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if($_SESSION['msg']!="")
                        {?>
                        <div class="col-md-6">
                            <div class="alert alert-success" >
                                <strong>Success :</strong> 
                                <?php echo htmlentities($_SESSION['msg']);?>
                                <?php echo htmlentities($_SESSION['msg']="");?>
                            </div>
                        </div>
                    </div>
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
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Student Name</th>
                                                <th>Book Name</th>
                                                <th>ISBN </th>
                                                <th>Issued Date</th>
                                                <th>Return Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT tblstudents.FullName,tblbooks.BookName,tblbooks.ISBNNumber,tblissuedbookdetails.IssuesDate,tblissuedbookdetails.ReturnDate,tblissuedbookdetails.BookId 
                                                as rid,tblissuedbookdetails.fine 
                                                from  tblissuedbookdetails join tblstudents on tblstudents.StudentId=tblissuedbookdetails.StudentId 
                                                join tblbooks on tblbooks.BookId=tblissuedbookdetails.BookId where tblissuedbookdetails.ReturnStatus='0' order by tblstudents.FullName

                                            </sql:query>
                                            <% int cnt = 1; %>
                                            <c:forEach var = "row" items = "${result.rows}">                             
                                                <tr class="odd gradeX">
                                                    <td class="center"><%= cnt %></td>
                                                    <td class="center"><c:out value = "${row.FullName}"/></td>
                                                    <td class="center"><c:out value = "${row.BookName}"/></td>
                                                    <td class="center"><c:out value = "${row.ISBNNumber}"/></td>
                                                    <td class="center"><c:out value = "${row.IssuesDate}"/></td>
                                                    <td class="center"><c:if test="${row.ReturnStatus==0}">
                                                            <span style="color:red">
                                                                <c:out value = "Not Return Yet"/>
                                                            </span>                                       
                                                        </c:if>
                                                        <c:if test="${row.ReturnDate!=''}">
                                                            <c:out value = "${row.ReturnDate}"/>
                                                        </td>
                                                    </c:if>
                                                    <td class="center">
                                                        <a href="update-issue-bookdetails.jsp?rid=${row.BookId}"><button class="btn btn-primary"><i class="fa fa-edit "></i> Edit</button> 
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
