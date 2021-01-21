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
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

        <title>Patient Registration Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>



    </head>
    <body>
        <div align="center" class="mid">
            <h1>Register</h1> 
            <form action ="RegisterPatient" method="post"> 
            <table>
                <tr> <td> Username: </td><td><input type="text" name="username" required> </td></tr>
                    <tr> <td> Password: </td><td><input type="password" name="password" required> </td></tr>
                    <tr> <td> Full Name: </td><td><input type="text" name="fullname" required> </td></tr>
                    <tr> <td> Patient Type: </td>
                        <td>
                            <select id="type" name="patient_type" required>
                                <option selected value="">--Select--</option>
                                <option value="NHS Patient">NHS Patient</option>
                                <option value="Private Patient">Private Patient</option>
                            </select>
                        </td>
                    </tr>
                    <tr> <td> Address: </td><td><textarea <input type="text" name="address" required></textarea></td></tr>
                    <tr> <td> Post Code: </td><td><input type="text" name="postcode" placeholder="postcode"></td></tr>
                    <tr> <td> Date of Birth: </td>
                        <td><input type="text" id="datepicker" name="DOB" placeholder="dd/mm/yy" required>

                        </td>
                    </tr> 

                    <tr> <td></td><td><input type="submit" value="Register"></td></tr>

                </table>
            </form>


            </form>


        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var datePicker = document.getElementById("DOB");
                M.Datepicker.init(datePicker);
            });
        </script>


    </body>
</html>


<!--<tr> <td> Date of Birth: </td>
                        <td><label for="start"></label>

                            <input  type="date" id="start" name="date"
                                    value="dd-mm-yy"
                                    min="01-01-1901" max="31-12-2099">

                        </td>
                    </tr> -->
<!--                <table>
                    <tr> <td> Username: </td><td><input type="text" name="username" required></td></tr>
                    <tr> <td> Password: </td><td><input type="password" name="password" required></td></tr>
                    <tr> <td> Full Name: </td><td><input type="text" name="fullname" required></td></tr>
                    <tr> <td> Patient Type: </td>
                        <td>
                            <select id="type" name="patient_type" required>
                                <option selected value="">--Select--</option>
                                <option value="NHS Patient">NHS Patient</option>
                                <option value="Private Patient">Private Patient</option>
                            </select>
                        </td>
                    </tr>
                    <tr> <td> Address: </td><td><input type="text" name="address" required></td></tr>
                    <tr> <td> Post Code: </td><td><input type="text" name="postcode" ></td></tr>
                    <tr> <td> Date of Birth: </td>
                        <td><input type="text" id="datepicker" name="DOB" value="dd/mm/yy" required>

                        </td>
                    </tr> 

                    <tr> <td></td><td><input type="submit" value="Register"></td></tr>

                </table>                -->


<!--<h1>Register</h1> 
            <form action ="Register" method="post">
                <p>Username:</p>
                <input type="text" name="username" placeholder="Username">
                <p>Password:</p>
                <input type="password" name="password" placeholder="Password"> 
                <p>Full Name</p>
                <input type="text" name="fullname" placeholder="Full Name">
                <p>Patient Type</p>
                <select id="type" name="patient_type" required>
                    <option selected value="">--Select--</option>
                    <option value="NHS Patient">NHS Patient</option>
                    <option value="Private Patient">Private Patient</option>
                </select>
                <p>Address</p>
                <textarea type="text" name="address" placeholder="Address"> </textarea>
                <p>PostCode</p>
                <input type="text" name="postcode" placeholder="PostCode">
                <p>Date of Birth</p>
                <input type="text" name="DOB" id="datepicker" value="dd/mm/yy">
                <button type="submit"> Register</button>
                -->