<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %> 
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
        
        <script type="text/javascript">
            function updateUser() {
                alert("User succesfully updated");
            }
        </script> 
        
    </head>
    <body>

        <h2>Admins Form</h2>
        <p>Click on the buttons inside the tabbed menu:</p>

        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'All Patient')">All Patients</button>
        </div>


        <h3>Add New Patient Details</h3>
        <%

            Connection conn = null;
            String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
            Statement stat = null;
            ResultSet res = null;
            PreparedStatement stmt = null;
            Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
            conn = DriverManager.getConnection(dbUrl, "smartcare", "1234");

        %>


        <form action="" method="POST">
            <%  stat = conn.createStatement();
                String u = request.getParameter("u");
                String data = "SELECT * FROM PATIENT where USERNAME='" + u + "'";
                res = stat.executeQuery(data);
                while (res.next()) {

            %>
            <div class="form-group">
                <label>UserName</label>
                <input type="text" class="form-control" name="username" value='<%=res.getString("username")%>'/> <br><br> 
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" value='<%=res.getString("password")%>'/> <br><br> 
            </div>
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" class="form-control" name="fullname" value='<%=res.getString("fullname")%>'/> <br><br> 
            </div>
            <div class="form-group">
                <label>Patient Type</label>
                <input type="radio" class="form-control" name="patient_type" value='<%=res.getString("patient_type")%>'/> NHS Patient
                <input type="radio" class="form-control" name="patient_type" value='<%=res.getString("patient_type")%>'/> Private Patient <br><br>
            </div>
            <div class="form-group">
                <label>Address</label>
                <textarea class="form-control" name="address"><%=res.getString("address")%></textarea> <br><br> 
            </div>
            <div class="form-group">
                <label>PostCode</label>
                <input type="text" class="form-control" name="postcode" value='<%=res.getString("postcode")%>'/> <br><br> 
            </div>
            <div class="form-group">
                <label>Date Of Birth</label>
                <input type="text" class="form-control" name="DOB" value='<%=res.getString("DOB")%>'/> <br><br> 
            </div>
            <%
                }
            %>
            <button type="submit" class="btn tn-primary" onclick="updateUser()" >Update </button>
            <a href="adminDashB.jsp" class="btn btn-default">Back</a>

        </form>




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
<%  String a = request.getParameter("username");
    String b = request.getParameter("password");
    String c = request.getParameter("fullname");
    String d = request.getParameter("patient_type");
    String e = request.getParameter("address");
    String f = request.getParameter("postcode");
    String g = request.getParameter("DOB");
    if (a != null && b != null && c != null && d != null && e != null && f != null && g != null) {

        String query = "UPDATE PATIENT SET USERNAME=?, PASSWORD=?, FULLNAME=?, PATIENT_TYPE=?, ADDRESS=?, POSTCODE=?, DOB=? WHERE USERNAME='" + u + "'";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, a);
        stmt.setString(2, b);
        stmt.setString(3, c);
        stmt.setString(4, d);
        stmt.setString(5, e);
        stmt.setString(6, f);
        stmt.setString(7, g);
        stmt.executeUpdate();
        response.sendRedirect("adminDashB.jsp");

    }


%>