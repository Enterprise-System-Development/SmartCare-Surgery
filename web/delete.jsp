<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.Connection" %>
<%
    String u = request.getParameter("u");
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SmartCareDB", "smartcare", "1234");
    Statement stat = conn.createStatement();
    stat.executeUpdate("DELETE FROM PATIENT where USERNAME='" + u + "'");
    response.sendRedirect("adminDashB.jsp");
    
%>

