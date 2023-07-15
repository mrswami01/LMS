<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
<%@page import="LMS.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%     
                User user = (User) session.getAttribute("logadmUser");
                String u_name = user.getSid();
                String newpwd = request.getParameter("newpassword");
                String pwd = user.getPassword();
                
        %>
        <sql:update dataSource = "${snapshot}" var = "result">
            UPDATE admin SET Password='<%=newpwd%>' where UserName= '<%=u_name%>'
        </sql:update> 
         <c:redirect url="../change-password.jsp?msg=Your Password was succesfully changed"/> 
    </body>
</html>
