<%-- 
    Document   : Home
    Created on : 3 Dec, 2022, 6:21:38 PM
    Author     : Mandy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="Login">
            <div class="container">
                <div class="box">
                    <img class="avatar" src="img/user.png">
                    <h1>Admin Login</h1>
                    <form action="AdminLogin" method="post">
                        <p>Username</p>
                        <input type="text" placeholder="Username" name="uname" required>
                        <p>Password</p>
                        <input type="password" placeholder="Password" name="pwd" required>
                        <input type="submit" value="Login">
                        <a href="#">Forget Password?</a><br>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>
