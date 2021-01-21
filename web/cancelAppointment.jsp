<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.Connection" %>

<%
    String a = request.getParameter("a");
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection end = DriverManager.getConnection("jdbc:derby://localhost:1527/SmartCareDB", "smartcare", "1234");
    Statement tet = end.createStatement();
    tet.executeUpdate("DELETE FROM APPOINTMENT where FIRSTNAME='" + a + "'");
    response.sendRedirect("patientDashB.jsp");
    
%>
