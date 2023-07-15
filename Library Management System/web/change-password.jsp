
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="LMS.User"%>
<% User user = (User) session.getAttribute("logUser");%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Online Library Management System | </title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="css/style_1.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <style>
            .errorWrap {
                padding: 10px;
                margin: 0 0 20px 0;
                background: #fff;
                border-left: 4px solid #dd3d36;
                -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
                box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
            }
            .succWrap{
                padding: 10px;
                margin: 0 0 20px 0;
                background: #fff;
                border-left: 4px solid #5cb85c;
                -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
                box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
            }
        </style>
    </head>
    <% String msg = request.getParameter("msg");%> 
    <script type="text/javascript">
        function valid()
        {
            if (document.chngpwd.newpassword.value !== document.chngpwd.confirmpassword.value)
            {
                alert("New Password and Confirm Password Field do not match  !!");
                document.chngpwd.confirmpassword.focus();
                return false;
            }
            if(document.chngpwd.password.value !== document.chngpwd.pwd.value)
            {
                alert("Invalid password  !!");
                document.chngpwd.password.focus();
                return false;
            }
            return true;
        }
    </script>
    <body>
        <!------MENU SECTION START-->
       <jsp:include page="Includes/header.jsp"/>
        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">User Change Password</h4>
                    </div>
                </div>
              
                <!--LOGIN PANEL START-->           
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" >
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Change Password
                            </div>
                            <div class="panel-body">
                                <form role="form" method="post" action="changepwd.jsp" onSubmit="return valid();" name="chngpwd">

                                    <div class="form-group">
                                        <label>Current Password</label>
                                        <input class="form-control" type="password" name="password" autocomplete="off" required  />
                                         <input type="hidden" name="pwd" value="<%=user.getPassword()%>">
                                    </div>

                                    <div class="form-group">
                                        <label>Enter Password</label>
                                        <input class="form-control" type="password" name="newpassword" autocomplete="off" required  />
                                    </div>

                                    <div class="form-group">
                                        <label>Confirm Password </label>
                                        <input class="form-control"  type="password" name="confirmpassword" autocomplete="off" required  />
                                    </div>

                                    <button type="submit" name="change" class="btn btn-info">Change </button> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>  
                <!---LOGIN PABNEL END-->            
            </div>
        </div>
        <!-- CONTENT-WRAPPER SECTION END-->
             <jsp:include page="Includes/footer.jsp"/>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="/js/custom.js"></script>
    </body>
</html>
