<%@ page import = "java.io.*,java.util.*,java.sql.*,java.time.format.DateTimeFormatter,java.time.LocalDateTime,java.util.Date"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now(); 
            String crdate = dtf.format(now);
            String update = dtf.format(now);
            String authname = request.getParameter("author");
        %>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/>
        <sql:update dataSource = "${snapshot}" var = "result">
            INSERT INTO tblauthors(AuthorName,creationDate,UpdationDate) 
        VALUES('<%=authname%>','<%=crdate%>','<%=update%>')
        </sql:update>
        <c:redirect url="../manage-authors.jsp?msg=Added Author"/>
    </body>
</html>
