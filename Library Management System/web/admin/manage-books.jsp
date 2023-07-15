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

<% /*   
 <c:if test="onclick != '' ">
<sql:update dataSource = "${snapshot}" var = "result">
delete from tblbooks  WHERE id='11'
</sql:update>
</c:if>   
    
class DB_Connection {
    private Connection con;
    int bookid = Integer.ParseInt(request.getParameter("id"));
    public void main(String[] args){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3600/lms","root","User@123");
            Statement stmt = con.createStatement();   
            String query = "delete from tblbooks  WHERE BookId= '+bookid'";
            stmt.execute(query);
        }catch(Exception e){
           throw new RuntimeException("Something went wrong");
            //e.printStackTrace();
        }
    }
}
*/
%>


<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | Manage Books</title>
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
        <!------MENU SECTION START-->
        <jsp:include page="includes/header.jsp"/>
        <!-- MENU SECTION END--><script>
            queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const msg = urlParams.get('msg');
        if(msg === 'Book Updated'){
            alert ("Book Updated ");
        }   
        if(msg === 'Added Book'){
            alert ("Added Book ");
        } 
        </script>
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Manage Books</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Books Listing
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Book Name</th>
                                                <th>Category</th>
                                                <th>Author</th>
                                                <th>ISBN</th>
                                                <th>Price</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <sql:query dataSource = "${snapshot}" var = "result">
                                                SELECT 
                                                tblbooks.BookName,
                                                tblcategory.CategoryName,
                                                tblauthors.AuthorName,
                                                tblauthors.AuthId,
                                                tblbooks.ISBNNumber,
                                                tblbooks.BookPrice,
                                                tblbooks.BookId,
                                                tblbooks.bookImage,
                                                tblbooks.isIssued 
                                                from  tblbooks 
                                                LEFT JOIN tblcategory 
                                                on tblbooks.CatId=tblcategory.CatId
                                                LEFT JOIN tblauthors 
                                                on tblbooks.Authid=tblauthors.AuthId                                            
                                            </sql:query>
                                            <% int cnt = 1; %>
                                            <c:forEach var = "row" items = "${result.rows}">                                    
                                                <tr class="odd gradeX">
                                                    <td class="center"><%= cnt %></td>
                                                    <td class="center" width="300">
                                                        <img src="./bookimg/<c:out value = "${row.bookImage}"/>" width="100">
                                                            <br /><b><c:out value = "${row.BookName}"/></b></td>
                                                    <td class="center"><c:out value = "${row.CategoryName}"/></td>
                                                    <td class="center"><c:out value = "${row.AuthorName}"/></td>
                                                    <td class="center"><c:out value = "${row.ISBNNumber}"/></td>
                                                    <td class="center"><c:out value = "${row.BookPrice}"/></td>
                                                    <td class="center">
                                                        <a href="edit-book.jsp?bookid=${row.BookId}authid=${row.AuthId}authname=${row.AuthorName}"><button class="btn btn-primary"><i class="fa fa-edit "></i> Edit</button> 
                                                            <a href="DB_Changes/Delete_Book.jsp?bookid=<c:out value = "${row.bookId}"/>" onclick="return confirm('Are you sure you want to delete?');"/>  
                                                            <button type ="button" class="btn btn-danger" /><i class="fa fa-pencil"></i> Delete</button>                                                               
                                                    </td>
                                                </tr>
                                                <% cnt=cnt+1; %>
                                            </c:forEach>
                                            <c:if test="return != ''}">  
                                            </c:if>
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
