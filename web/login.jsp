<%-- 
    Document   : index
    Created on : 01-Dec-2020, 18:59:47
    Author     : emmanueledmund
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h1>Login here</h1>
            <form action ="Login" method="post">
                <table>
                    <tr> <td> Username: </td><td><input type="text" name="username"></td></tr>
                    <tr> <td> Password: </td><td><input type="password" name="password"></td></tr>
                    <tr> <td> Role: </td><td><input type="text" name="role"></td></tr>
                    <tr> <td><input type="submit" value="Login"></td></tr>
                    
                    <tr> <td> Not yet a Member? <a href="register.jsp">Register</a></td></tr>
                    
                 
                </table>                
            </form>
            
        </div>
        
    </body>
</html>
