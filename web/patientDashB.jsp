<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="jquery.datetimepicker.min.css">

        <script src="jquery.js"></script>
        <script src="jquery.datetimepicker.full.js"></script>



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

            .topbar li {
                float: right;
                list-style: none;
            }

            .topbar a {
                font-family: 'icomoon';
                display: block;             
                text-align: center;
                text-decoration: none;
                color: rgb(102,102,102);
                border-left: 1px solid rgb(235,235,235);
            }

            .topbar a:hover {
                background-color: rgb(247,247,247);
            }
        </style>

        <script type="text/javascript">
            function showAlert() {
                alert("Appointment Booked");
            }
        </script> 

    </head>
    <body>

        <h2>Patient Form</h2>
        <p>Click on the buttons inside the tabbed menu:</p>

        <div class="tab" class="main">
            <button class="tablinks" onclick="openCity(event, 'Book Appointment')">Book Appointment</button>
            <button class="tablinks" onclick="openCity(event, 'View Medical Bill')">View Medical Bill</button>
            <button class="tablinks" onclick="openCity(event, 'Pay medical Bill')">Pay medical Bill</button>
            <button class="tablinks" onclick="openCity(event, 'Cancel Appointment')">Cancel Appointment</button>

            <ul class="topbar clearfix">
                <li><a href="index.jsp">Logout</a></li>

            </ul>


        </div>

        <div id="Book Appointment" class="tabcontent">
            <h3>Book Appointment</h3>

            <form name="myForm" action="patientDashB.jsp"  method="POST">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required ><br><br>

                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required ><br><br>



                <label for="staff">Who do you want to see</label>
                <select id="doctornurse" name="staff" required>
                    <option selected value="">--Select--</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Nurse">Nurse</option>
                </select> <br><br>


                <label for="appointment_reason">Reason For Appointment</label>
                <textarea id="appointment_reason" name="appointment_reason" required ></textarea><br><br>


                <label for="datetime">Date and Time:</label>
                <input type="text" id="datetime" name="datetime" required ><br><br>

                <input type="submit" value="Book Appointment" name="Book Appointment" onclick="showAlert()" />

            </form>

            <%
                String a = request.getParameter("firstname");
                String b = request.getParameter("lastname");
                String c = request.getParameter("staff");
                String d = request.getParameter("appointment_reason");
                String e = request.getParameter("datetime");

                String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
                Connection conn = null;
                PreparedStatement stat = null;
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                if (a != null && b != null && c != null && d != null && e != null) {
                    conn = DriverManager.getConnection(dbUrl, "smartcare", "1234");

                    String data = "INSERT INTO APPOINTMENT (FIRSTNAME, LASTNAME, STAFF, APPOINTMENT_REASON, DATETIME) VALUES (?,?,?,?,?)";
                    stat = conn.prepareStatement(data);
                    stat.setString(1, a);
                    stat.setString(2, b);
                    stat.setString(3, c);
                    stat.setString(4, d);
                    stat.setString(5, e);
                    stat.executeUpdate();
                    response.sendRedirect("patientDashB.jsp");

                }


            %>

        </div>

        <div id="View Medical Bill" class="tabcontent">
            <h3>View Medical Bill</h3>

        </div>

        <div id="Pay medical Bill" class="tabcontent">
            <h3>Pay medical Bill</h3>

        </div>

        <div id="Cancel Appointment" class="tabcontent">
            <h3>Cancel Appointment</h3>
           <form name="myForm" action="searchAppointment.jsp"  method="POST">
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required ><br><br>

                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required ><br><br>
                
                <input type="submit" value="Search Appointment">
           </form>
            
            
            
        </div>

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

        <script>
            $("#datetime").datetimepicker({
                step: 30
            });


        </script>

        

</html>