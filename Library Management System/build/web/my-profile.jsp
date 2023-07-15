<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
<jsp:include page="Includes/config.jsp"/>
<% User user = (User) session.getAttribute("logUser");%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Online Library Management System | Student Signup</title>
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
        <script>
            queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const msg = urlParams.get('msg');
        if(msg === 'Details Updated'){
            alert ("Student Details Updated");
        }    
        </script>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">My Profile</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9 col-md-offset-1">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                My Profile
                            </div>
                            <div class="panel-body">
                                <form name="signup" method="post" action="MyProfile_Update.jsp">
                                    <sql:query dataSource = "${snapshot}" var = "result">
                                    SELECT StudentId,FullName,EmailId,MobileNumber,RegDate,UpdationDate,Status from  tblstudents  where StudentId= '<%= user.getSid()%>'
                                    </sql:query>
                                    
                                        <c:forEach var = "row" items = "${result.rows}">                                 
                                            <div class="form-group">
                                                <label>Student ID : </label>
                                                <c:out value = "${row.StudentId}"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Reg Date : </label>
                                                <c:out value = "${row.RegDate}"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Last Updation Date : </label>
                                                <c:out value = "${row.UpdationDate}"/>
                                            </div>
                                            <div class="form-group">
                                                <label>Profile Status : </label>
                                                <c:if test="${row.Status == 1}">
                                                <span style="color: green">Active</span>
                                                </c:if>
                                                <c:if test="${row.Status != 1} ">                                                
                                                <span style="color: red">Blocked</span>
                                                </c:if>
                                            </div>
                                            <div class="form-group">
                                                <label>Enter Full Name</label>
                                                <input class="form-control" type="text" name="fname" value="<c:out value = "${row.FullName}"/>" autocomplete="off" required />
                                            </div>
                                            <div class="form-group">
                                                <label>Mobile Number :</label>
                                                <input class="form-control" type="text" name="mobileno" maxlength="10" value="<c:out value = "${row.MobileNumber}"/>" autocomplete="off" required />
                                            </div>
                                            <div class="form-group">
                                                <label>Enter Email</label>
                                                <input class="form-control" type="email" name="email" id="emailid" value="<c:out value = "${row.EmailId}"/>"  autocomplete="off" required readonly />
                                            </div>
                                        </c:forEach>  
                                        <input type="submit" value="Update">
                                    </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
        <jsp:include page="Includes/footer.jsp"/>
        <script src="/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="/js/custom.js"></script>
    </body>
</html>
