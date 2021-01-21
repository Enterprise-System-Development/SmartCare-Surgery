<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
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
        <script type="text/javascript">
            function showAlert() {
                alert("Staff Added");
            }

        </script>
        
        <script type="text/javascript">
            function showSchedule() {
                alert("Schedule Succesfully Removed");
            }
        </script> 
        
        <script type="text/javascript">
            function deleteUser() {
                alert("User Removed");
            }
        </script> 
        
    </head>
    <body>

        <h2>Admin Form</h2>
        <p>Click on the buttons inside the tabbed menu:</p>


        <div class="tab" class="main">
            <button class="tablinks" onclick="openCity(event, 'All Patient')">All Patients</button>
            <button class="tablinks" onclick="openCity(event, 'Add Staff')">Add Staff</button>

            <button class="tablinks" onclick="openCity(event, 'Doctors Schedule')">Doctors Schedule</button>
            <button class="tablinks" onclick="openCity(event, 'Nurses Schedule')">Nurses Schedule</button>
            <button class="tablinks" onclick="openCity(event, 'Calculate Turnover')">Calculate Turnover</button>
            <button class="tablinks" onclick="openCity(event, 'Change Price')">Change Price</button>


            <ul class="topbar clearfix">
                <li><a href="index.jsp">Logout</a></li>

            </ul>


        </div>



        <div id="All Patient" class="tabcontent">
            <div class="row">
                <div class="col-md-4">
                    <h3>List of All Patients</h3>
                </div>
                <div  class="col-md-4">                  
                    <form action="" method="GET">
                        <input type="text" class="form-control" name="q" placeholder="Search here....."/>
                    </form>
                </div>
                <p></p>
                <div  class="col-md-4">                  
                    <a href="addNew.jsp" class="btn btn-primary">Add New Patient</a>
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
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%  String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
                        Connection conn = null;
                        Statement stat = null;
                        ResultSet res = null;
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        conn = DriverManager.getConnection(dbUrl, "smartcare", "1234");
                        stat = conn.createStatement();
                        String query = request.getParameter("q");
                        String data;
                        if (query != null) {
                            data = "SELECT * FROM PATIENT WHERE USERNAME LIKE '%" + query + "%' OR FULLNAME LIKE'%" + query + "%' OR PATIENT_TYPE LIKE '%" + query + "%' OR ADDRESS LIKE '%" + query + "%' OR POSTCODE LIKE '%" + query + "%' OR DOB LIKE '%" + query + "%'";
                        } else {
                            data = "SELECT * FROM PATIENT order by USERNAME desc";
                        }
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
                        <td class="text-center">
                            <a href='edit.jsp?u=<%=res.getString("username")%>' class="btn btn-warning">Edit</a>
                            <a href='delete.jsp?u=<%=res.getString("username")%>' class="btn btn-danger" onclick="deleteUser()" >delete</a>
                        </td>   
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>

        </div>

        <div id="Add Staff" class="tabcontent">
            <h3>Add a new staff</h3>

            <%
                String a = request.getParameter("username");
                String b = request.getParameter("password");
                String c = request.getParameter("fullname");
                String d = request.getParameter("email");
                String e = request.getParameter("staff");

                String d_bUrl = "jdbc:derby://localhost:1527/SmartCareDB";
                Connection cc = null;
                PreparedStatement st = null;
                Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                if (a != null && b != null && c != null && d != null && e != null) {
                    cc = DriverManager.getConnection(d_bUrl, "smartcare", "1234");

                    String dbs = "INSERT INTO EMPLOYEE (USERNAME, PASSWORD, FULLNAME, EMAIL, STAFF) VALUES (?,?,?,?,?)";
                    st = conn.prepareStatement(dbs);
                    st.setString(1, a);
                    st.setString(2, b);
                    st.setString(3, c);
                    st.setString(4, d);
                    st.setString(5, e);

                    st.executeUpdate();
                    response.sendRedirect("adminDashB.jsp");

                }
            %>

            <form name="myForm" action="adminDashB.jsp" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required ><br><br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required ><br><br>
                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" required ><br><br>
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required ><br><br>
                <label for="staff">Staff</label>
                <select id="doctornurse" name="staff" required>
                    <option selected value="">--Select--</option>
                    <option value="Doctor">Doctor</option>
                    <option value="Nurse">Nurse</option>
                </select> <br><br>

                <input type="reset" value="Clear" name="clear" /> 
                <input type="submit" value="Add" name="add" onclick="showAlert()" />
            </form>

        </div>


        <div    id="Doctors Schedule" class="tabcontent">

            <div class="row">
                <div class="col-md-4">
                    <h3>List of Doctors Appointment Schedule</h3>
                </div>


            </div>  
            <p></p>
            <table class="table table-bordered table-striped table-hover " border="1"> 
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Staff</th>
                        <th>Reason for Appointment</th>
                        <th>Date and time</th>
                        <th class="text-center">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        String host = "jdbc:derby://localhost:1527/SmartCareDB";
                        Connection connection = null;
                        Statement set = null;
                        ResultSet r = null;
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        connection = DriverManager.getConnection(host, "smartcare", "1234");
                        set = connection.createStatement();
                        
                        String sql = "SELECT * FROM APPOINTMENT WHERE STAFF='Doctor'";

                        r = set.executeQuery(sql);
                        while (r.next()) {
                    %>
                    <tr>
                        <td><%=r.getString("firstname")%></td>
                        <td><%=r.getString("lastname")%></td>
                        <td><%=r.getString("staff")%></td>
                        <td><%=r.getString("appointment_reason")%></td>
                        <td><%=r.getString("datetime")%></td>
                        <td class="text-center">
                            
                            <a href='delDoc_sch.jsp?b=<%=r.getString("firstname")%>' class="btn btn-danger" onclick="showSchedule()" >Remove Schedule</a>
                        </td> 
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>
        </div>


        <div id="Nurses Schedule" class="tabcontent">

            <div class="row">
                <div class="col-md-4">
                    <h3>List of Nurses Appointment Schedule</h3>
                </div>


            </div>  
            <p></p>
            <table class="table table-bordered table-striped table-hover " border="1"> 
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Staff</th>
                        <th>Reason for Appointment</th>
                        <th>Date and time</th>
                        <th class="text-center">Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        String url = "jdbc:derby://localhost:1527/SmartCareDB";
                        Connection pro = null;
                        Statement s = null;
                        ResultSet t = null;
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        pro = DriverManager.getConnection(url, "smartcare", "1234");
                        s = pro.createStatement();

                        String sq = "SELECT * FROM APPOINTMENT WHERE STAFF='Nurse'";

                        t = s.executeQuery(sq);
                        while (t.next()) {
                    %>
                    <tr>
                        <td><%=t.getString("firstname")%></td>
                        <td><%=t.getString("lastname")%></td>
                        <td><%=t.getString("staff")%></td>
                        <td><%=t.getString("appointment_reason")%></td>
                        <td><%=t.getString("datetime")%></td>
                        <td class="text-center">
                            
                            <a href='delNur_sch.jsp?n=<%=t.getString("firstname")%>' class="btn btn-danger" onclick="showSchedule()" >Remove Schedule</a>
                        </td> 
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
                for (i
                        = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";

                evt.currentTarget.className += " active";
            }
        </script>

    </body>
</html>