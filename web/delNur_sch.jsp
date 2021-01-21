<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.Connection" %>
<%
    String n = request.getParameter("n");
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection net = DriverManager.getConnection("jdbc:derby://localhost:1527/SmartCareDB", "smartcare", "1234");
    Statement key = net.createStatement();
    key.executeUpdate("DELETE FROM APPOINTMENT where FIRSTNAME='" + n + "'");
    response.sendRedirect("adminDashB.jsp");
    
%>
