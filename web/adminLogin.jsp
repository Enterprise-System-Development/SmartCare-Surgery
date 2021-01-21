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
        <link rel="stylesheet" href="style2.css">
         
        <script type="text/javascript">
            function showAlert() {
                alert("Login Successfull");
            }

        </script>

    </head>
    <body>
        <div class="center">
            <h1>Admin Login</h1>

            <form action ="LoginAdmin" method="post">
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

                <input type="submit" value="Login" onclick="showAlert()">
            </form>

        </div>

    </body>
</html>
