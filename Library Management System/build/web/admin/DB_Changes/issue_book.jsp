<%@ page import = "java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat,java.time.format.DateTimeFormatter,java.time.LocalDateTime,java.util.Date,java.util.Calendar"%>
<%@ page import = "jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String isdate = dtf.format(now);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            cal.setTime(sdf.parse(isdate)); 
            cal.add(Calendar.DAY_OF_MONTH, 15);
            String rdate = sdf.format(cal.getTime());  
            int bookid = Integer.parseInt(request.getParameter("bookid"));
            String sid = request.getParameter("studentid");
            int rs = 0;
        %>

        <sql:update dataSource = "${snapshot}" var = "result">
            INSERT INTO tblissuedbookdetails(BookId,StudentID,IssuesDate,ReturnDate,ReturnStatus) 
            VALUES('<%=bookid%>','<%=sid%>','<%=isdate%>','<%=rdate%>','<%=rs%>')
        </sql:update> 
            <sql:update dataSource = "${snapshot}" var = "result">
            update  tblbooks set StudentID='<%=sid%>' where BookId='<%=bookid%>'
        </sql:update> 
        <c:redirect url="../manage-issued-books.jsp?msg=Book Issued"/>    
        
    </body>
</html>
