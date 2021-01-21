<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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

        <script type="text/javascript">
            function showAlert() {
                alert("Appointnment Canceled");
            }
        </script> 

</head>
<body>
    
    <h2>Patient Form</h2>
    <p>Click on the buttons inside the tabbed menu:</p>

    <div class="tab">
        <button class="tablinks" onclick="openCity(event, 'All Patient')">Cancel Appointment</button>

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

                String z = request.getParameter("firstname");
                String x = request.getParameter("lastname");
                String sq = "SELECT * FROM APPOINTMENT WHERE FIRSTNAME='" + z + "' AND LASTNAME='" + x + "'";

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

                    <a href='cancelAppointment.jsp?a=<%=t.getString("firstname")%>' class="btn btn-danger" onclick="showAlert()" >cancel</a>
                </td>
            </tr>
            <%
                }
            %>

        </tbody>
    </table>

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
