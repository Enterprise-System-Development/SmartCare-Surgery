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
            <h1>Register</h1>
            <form action ="Register" method="post">
                <table>
                    <tr> <td> Username: </td><td><input type="text" name="username"></td></tr>
                    <tr> <td> Password: </td><td><input type="password" name="password"></td></tr>
                    <tr> <td> Role: </td><td><input type="text" name="role"></td></tr>
                    <tr> <td> Full Name: </td><td><input type="text" name="fullName"></td></tr>
                    <tr> <td> Address: </td><td><input type="text" name="address"></td></tr>
                    <tr> <td> Post Code: </td><td><input type="text" name="postCode"></td></tr>
                    <tr> <td> Date of Birth: </td><td><input type="text" name="DOB"></td></tr>                    
                    <tr> <td></td><td><input type="submit" value="Register"></td></tr>
                 
                </table>                
            </form>
            
            
        </div>
        
    </body>
</html>
