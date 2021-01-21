<%-- 
    Document   : index
    Created on : 01-Dec-2020, 18:59:47
    Author     : emmanueledmund
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style2.css"

        <title></title>

    </head>
    <body>
        <div class="center">
            <h1>Staff Login</h1>
            
            <form action ="LoginStaff" method="post">
                <div class="txt_field">
                    <input type="text" name="username" required>
                    <span></span>
                    <label>Username</label>
                </div>            
                <div class="txt_field">
                    <input type="password" name="password" required>
                    <span></span>
                    <label>Password</label>
     
                </div>
                
                <input type="submit" value="Login">
                
                <div class="signup_link">
                    Not a member? <a href="staffReg.jsp">Signup</a>
                </div>

            </form>

        </div>

    </body>
</html>



