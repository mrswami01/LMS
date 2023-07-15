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
        <%
                String bookname = request.getParameter("bookname");
                String authname = request.getParameter("category");
                int authId = Integer.parseInt(request.getParameter("authId"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                double price = Double.parseDouble(request.getParameter("price"));
                int bookId = Integer.parseInt(request.getParameter("bookId"));
        %>
        
<sql:update dataSource = "${snapshot}" var = "result">
            update  tblbooks set BookName='<%=bookname%>',CatId='<%=catId%>',AuthId='<%=authId%>',BookPrice='<%=price%>' where BookId='<%=bookId%>'
        </sql:update> 
         <c:redirect url="../manage-books.jsp?msg=Book Updated"/> 
          
    </body>
</html>
