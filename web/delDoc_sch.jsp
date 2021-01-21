<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.Connection" %>
<%
    String b = request.getParameter("b");
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection bet = DriverManager.getConnection("jdbc:derby://localhost:1527/SmartCareDB", "smartcare", "1234");
    Statement state = bet.createStatement();
    state.executeUpdate("DELETE FROM APPOINTMENT where FIRSTNAME='" + b + "'");
    response.sendRedirect("adminDashB.jsp");
    
%>
