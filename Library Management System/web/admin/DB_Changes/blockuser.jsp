<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<% User user = (User) session.getAttribute("logUser");%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String inid = request.getParameter("inid"); %>
        <sql:update dataSource = "${snapshot}" var = "result">
        update tblstudents set Status='0'  WHERE StudentId= '<%=inid%>'     
        </sql:update> 
        <c:redirect url="../reg-students.jsp?"/>
    </body>
</html>
