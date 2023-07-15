<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="LMS.User"%>
<% User user = (User) session.getAttribute("logUser");%>
<sql:setDataSource var = "snapshot" driver = "com.mysql.cj.jdbc.Driver" url = "jdbc:mysql://localhost:3600/lms" 
                   user = "root"  password = "User@123"/><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           String bookname = request.getParameter("bookname");
           String catname = request.getParameter("category");
           String authname = request.getParameter("author");
           String isbn = request.getParameter("isbn");
           int price = Integer.parseInt(request.getParameter("bookprice"));
           String imgname = request.getParameter("bookpic");
        %> 
    <sql:update dataSource = "${snapshot}" var = "result">
        INSERT INTO  tblbooks(BookName,CatId,AuthId,ISBNNumber,BookPrice,bookImage) 
        VALUES('<%=bookname%>','<%=catname%>','<%=authname%>','<%=isbn%>','<%=price%>','<%=imgname%>')
    </sql:update> 
    <c:redirect url="../manage-books.jsp?msg=Added Book"/>    

</body>
</html>
