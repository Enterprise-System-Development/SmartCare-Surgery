<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {font-family: Arial;}

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
        </style>
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

        <h2>Admins Form</h2>
        <p>Click on the buttons inside the tabbed menu:</p>

        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'All Patient')">All Patients</button>

        </div>


        <h3>Add New Patient Details</h3>
        <form action="" method="POST">
            <div class="form-group">
                <label>UserName: </label>
                <input type="text" class="form-control" name="username" placeholder="username" required /> <br><br> 
            </div>
            <div class="form-group">
                <label>Password: </label>
                <input type="password" class="form-control" name="password" placeholder="Password"required /> <br><br>
            </div>
            <div class="form-group">
                <label>Full Name: </label>
                <input type="text" class="form-control" name="fullname" placeholder="fullname" required /> <br><br>
            </div>
            <div class="form-group">
                <label>Patient Type: </label>
                <input type="radio" class="form-control" name="patient_type" value="NHS Patient" required >NHS Patient 
                <input type="radio" class="form-control" name="patient_type" value="Private Patient" required >Private Patient<br><br> 
            </div>
            <div class="form-group">
                <label>Address: </label>
                <textarea class="form-control" name="address" placeholder="address" required ></textarea> <br><br>
            </div>
            <div class="form-group">
                <label>PostCode: </label>
                <input type="text" class="form-control" name="postcode" placeholder="postcode" required /> <br><br>
            </div>
            <div class="form-group">
                <label>Date Of Birth: </label>
                <input type="text" class="form-control" id="datepicker" name="DOB" placeholder="dd/mm/yy" required /> <br><br>
            </div>
            <button type="submit" class="btn tn-primary">Submit</button>
            <a href="adminDashB.jsp" class="btn btn-default">Back</a>

        </form>

        <%
            String a = request.getParameter("username");
            String b = request.getParameter("password");
            String c = request.getParameter("fullname");
            String d = request.getParameter("patient_type");
            String e = request.getParameter("address");
            String f = request.getParameter("postcode");
            String g = request.getParameter("DOB");

            String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
            Connection conn = null;
            PreparedStatement stat = null;
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            if (a != null && b != null && c != null && d != null && e != null && f != null && g != null) {
                conn = DriverManager.getConnection(dbUrl, "smartcare", "1234");

                String data = "INSERT INTO PATIENT (USERNAME, PASSWORD, FULLNAME, PATIENT_TYPE, ADDRESS, POSTCODE, DOB) VALUES (?,?,?,?,?,?,?)";
                stat = conn.prepareStatement(data);
                stat.setString(1, a);
                stat.setString(2, b);
                stat.setString(3, c);
                stat.setString(4, d);
                stat.setString(5, e);
                stat.setString(6, f);
                stat.setString(7, g);
                stat.executeUpdate();
                response.sendRedirect("adminDashB.jsp");

            }


        %>




        <script>
            function openCity(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
        </script>
    </body>
</html>