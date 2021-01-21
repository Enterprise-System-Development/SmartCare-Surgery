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
        <link rel="stylesheet" href="style2.css"
        
        <title>Doctor Registration Page</title>
    </head>
    <body>
        <div align="center"> 
            <h1>Register</h1>
            <form action ="RegisterStaff" method="post">
                <table>
                    <tr> <td> Username: </td><td><input type="text" name="username" required></td></tr>
                    <tr> <td> Password: </td><td><input type="password" name="password" required></td></tr>
                    <tr> <td> Full Name: </td><td><input type="text" name="fullName" required></td></tr>
                    <tr> <td> Email: </td><td><input type="text" name="email" required></td></tr>
                   
                    <tr> <td> Staff: </td>
                        <td>
                            <select id="type" name="staff" required>
                                <option selected value="">--Select--</option>
                                <option value="Doctor">Doctor</option>
                                <option value="Nurse">Nurse</option>
                            </select>
                        </td>
                    </tr>
                    
                     <tr> <td></td><td><input type="submit" value="Register"></td></tr>
                            
                </table>                
            </form>
            
            
        </div>
        
    </body>
</html>
