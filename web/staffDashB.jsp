<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.*" %>
<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
    </head>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
    <body onLoad="displayResult()">

        <h2>Staff Form</h2>
        <p>Click on the buttons inside the tabbed menu:</p>


        <div class="tab" class="main">
            <button class="tablinks" onclick="openCity(event, 'Add Patient')">Add Patient</button>
            <button class="tablinks" onclick="openCity(event, 'View Private Patient')">View Private Patient</button>
            <button class="tablinks" onclick="openCity(event, 'View NHS Patient')">View NHS Patient</button>
            <button class="tablinks" onclick="openCity(event, 'Issue prescription')">Issue prescription</button>
            <button class="tablinks" onclick="openCity(event, 'Refer Patient')">Refer Patient</button>

            <ul class="topbar clearfix">
                <li><a href="index.jsp">Logout</a></li>

            </ul>


        </div>


        <div id="Add Patient" class="tabcontent">
            <h3>Add a new Patient</h3>

            <%!
                public class Patient {

                    String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
                    String dbUname = "smartcare";
                    String dbPassword = "1234";

                    Connection connection = null;
                    PreparedStatement addPatient = null;
                    ResultSet resultSet = null;

                    public Patient() {

                        try {

                            connection = DriverManager.getConnection(dbUrl, dbUname, dbPassword);

                            addPatient = connection.prepareStatement(
                                    "INSERT INTO PATIENT (USERNAME, PASSWORD, FULLNAME, PATIENT_TYPE, ADDRESS, POSTCODE, DOB)"
                                    + " VALUES (?, ?, ?, ?, ?, ?, ?) ");

                        } catch (SQLException ex) {
                            ex.printStackTrace();

                        }

                    }

                    public int setPatient(String username, String password, String fullname, String patient_type, String address, String postcode, String DOB) {

                        int result = 0;
                        try {
                            addPatient.setString(1, username);
                            addPatient.setString(2, password);
                            addPatient.setString(3, fullname);
                            addPatient.setString(4, patient_type);
                            addPatient.setString(5, address);
                            addPatient.setString(6, postcode);
                            addPatient.setString(7, DOB);
                            result = addPatient.executeUpdate();

                        } catch (SQLException ex) {
                            ex.printStackTrace();

                        }

                        return result;

                    }
                }

            %>

            <%
                int result = 0;

                if (request.getParameter("add") != null) {
                    String userName = new String();
                    String password = new String();
                    String fullName = new String();
                    String patient_type = new String();
                    String address = new String();
                    String postcode = new String();
                    String DOB = new String();

                    if (request.getParameter("username") != null) {
                        userName = request.getParameter("username");

                    }

                    if (request.getParameter("password") != null) {
                        password = request.getParameter("password");

                    }

                    if (request.getParameter("fullname") != null) {
                        fullName = request.getParameter("fullname");

                    }

                    if (request.getParameter("patient_type") != null) {
                        patient_type = request.getParameter("patient_type");

                    }

                    if (request.getParameter("address") != null) {
                        address = request.getParameter("address");

                    }

                    if (request.getParameter("postcode") != null) {
                        postcode = request.getParameter("postcode");

                    }

                    if (request.getParameter("DOB") != null) {
                        DOB = request.getParameter("DOB");

                    }

                    Patient patient = new Patient();
                    result = patient.setPatient(userName, password, fullName, patient_type, address, postcode, DOB);
                }
            %>

            <form name="myForm" action="staffDashB.jsp" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required ><br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required ><br><br>
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required ><br><br>

                <label for="patient_type">Patient Type</label>
                <select id="type" name="patient_type" required >
                    <option selected value="">--Select--</option>
                    <option value="NHS Patient">NHS Patient</option>
                    <option value="Private Patient">Private Patient</option>
                </select><br><br>

                <label for="address">Address</label>
                <textarea id="adress" name="address" required ></textarea><br><br>
                <label for="postcode">PostCode</label>
                <input type="text" id="postcode" name="postcode" required ><br><br>
                <label for="DOB">Date Of Birth</label>
                <input type="text" id="datepicker" name="DOB" placeholder="dd/mm/yy" required ><br><br>
                <input type="hidden" name="hidden" value="<%= result%>" />
                <input type="reset" value="Clear" name="clear" /> 
                <input type="submit" value="Add" name="add" />
            </form>
            <script language="javascript">
                function displayResult()
                {
                    if (document.myForm.hidden.value == 1) {
                        alert("Patient Added!");
                    }
                }

            </script>
        </div>


        <div id="View Private Patient" class="tabcontent">
            <div class="row">
                <div class="col-md-4">
                    <h3>List of All Private Patients</h3>
                </div>


            </div>  
            <p></p>
            <table class="table table-bordered table-striped table-hover " border="1"> 
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th>Patient type</th>
                        <th>Address</th>
                        <th>PostCode</th>
                        <th>Date Of Birth</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
                        Connection conn = null;
                        Statement stat = null;
                        ResultSet res = null;
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        conn = DriverManager.getConnection(dbUrl, "smartcare", "1234");
                        stat = conn.createStatement();

                        String data = "SELECT * FROM PATIENT WHERE PATIENT_TYPE='Private Patient'";

                        res = stat.executeQuery(data);
                        while (res.next()) {
                    %>
                    <tr>
                        <td><%=res.getString("username")%></td>
                        <td><%=res.getString("password")%></td>
                        <td><%=res.getString("fullname")%></td>
                        <td><%=res.getString("patient_type")%></td>
                        <td><%=res.getString("address")%></td>
                        <td><%=res.getString("postcode")%></td>
                        <td><%=res.getString("DOB")%></td>

                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>

        </div>


        <div id="View NHS Patient" class="tabcontent">
            <div class="row">
                <div class="col-md-4">
                    <h3>List of All NHS Patients</h3>
                </div>


            </div>  
            <p></p>
            <table class="table table-bordered table-striped table-hover " border="1"> 
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th>Patient type</th>
                        <th>Address</th>
                        <th>PostCode</th>
                        <th>Date Of Birth</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String host = "jdbc:derby://localhost:1527/SmartCareDB";
                        Connection connection = null;
                        Statement stats = null;
                        ResultSet r = null;
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        connection = DriverManager.getConnection(host, "smartcare", "1234");
                        stat = connection.createStatement();

                        String sql = "SELECT * FROM PATIENT WHERE PATIENT_TYPE='NHS Patient'";

                        r = stat.executeQuery(sql);
                        while (r.next()) {
                    %>
                    <tr>
                        <td><%=r.getString("username")%></td>
                        <td><%=r.getString("password")%></td>
                        <td><%=r.getString("fullname")%></td>
                        <td><%=r.getString("patient_type")%></td>
                        <td><%=r.getString("address")%></td>
                        <td><%=r.getString("postcode")%></td>
                        <td><%=r.getString("DOB")%></td>

                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>

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

    </body>
</html>