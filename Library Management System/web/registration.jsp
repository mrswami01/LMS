<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="Register">
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="img/user-group-icon.png">
                <h1>
                    Register Account</h1>
                <form action="RegisterServlet" method="post">
                    <p>Student ID</p>
                    <input type="text" placeholder="sid" name="sid" required>
                    <p>Full Name</p>
                    <input type="text" placeholder="fname" name="fname" required>
                    <p>Mobile Number</p>
                    <input type="text" placeholder="mobileno" name="mobileno" required>
                    <p>Email</p>
                    <input type="text" placeholder="User email" name="email" required>    
                    <p>Password</p>
                    <input type="password" placeholder="Password" name="password" required>
                    
                    <input type="submit" value="Register">
                    <a href="StudentLogin.jsp">Already have Account?</a>
                </form>
            </div>
        </div>
    </body>
</html>