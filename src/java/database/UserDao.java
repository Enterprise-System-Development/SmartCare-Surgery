/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.*;
import java.util.logging.*;
import java.sql.Connection;
import bean.UserBean;

public class UserDao {
    
     private String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
    private String dbUname = "smartcare"; 
    private String dbPassword = "1234";
    private String dbDriver = "org.apache.derby.jdbc.ClientDriver";
    
    
    public Connection getConnection() 
    {
        Connection con = null;
        
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
            
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
        
    }
    
    ///////////////////////////// validate patients login ///////////////////////////
    public boolean validatePatient(UserBean patient){
       // loadDriver(dbDriver);
        Connection con = getConnection();
        Statement statement = null;
        
        boolean status = false;
        
        String sql = "SELECT * FROM PATIENT WHERE username = '"+patient.getUsername()+"' AND password = '"+patient.getPassword()+"'";
        
    
        
        try {
            statement = con.createStatement();
            
            
        ResultSet rs = statement.executeQuery(sql);
        status = rs.next();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        return status;
        
   
    }
    
    
    ///////////////////////////// validate doctors login ///////////////////////////
    public boolean validateStaff(UserBean staff){
       // loadDriver(dbDriver);
        Connection con = getConnection();
        Statement statement = null;
        
        boolean status = false;
        
        String sql = "SELECT * FROM EMPLOYEE WHERE username = '"+staff.getUsername()+"' AND password = '"+staff.getPassword()+"'";
        
    
        
        try {
            statement = con.createStatement();
            
            
        ResultSet rs = statement.executeQuery(sql);
        status = rs.next();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        return status;
        
   
    }
    
     ///////////////////////////// validate admin login ///////////////////////////
    public boolean validateAdmin(UserBean admin){
       // loadDriver(dbDriver);
        Connection con = getConnection();
        Statement statement = null;
        
        boolean status = false;
        
        String sql = "SELECT * FROM ADMIN WHERE username = '"+admin.getUsername()+"' AND password = '"+admin.getPassword()+"'";
        
    
        
        try {
            statement = con.createStatement();
            
            
        ResultSet rs = statement.executeQuery(sql);
        status = rs.next();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        return status;
        
   
    }
    
    //////////////////////////// Add/Register patient /////////////////////////////////////
    public String addPatient(UserBean patient){
        //loadDriver(dbDriver);
        Connection con = getConnection();
        //Statement statement = null;
        String result = "data entered successfully";
        
        
        //String sql = "INSERT INTO USERS + (username, password, role)" + "VALUES ("+registerBean.getUsername()+"," +registerBean.getPassword()+ "," +registerBean.getRole() + ")";
        String sql = "INSERT INTO PATIENT (USERNAME, PASSWORD, FULLNAME, PATIENT_TYPE, ADDRESS, POSTCODE, DOB) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, patient.getUsername());
            ps.setString(2, patient.getPassword());
            ps.setString(3, patient.getFullName());
            ps.setString(4, patient.getPatient_type());
            ps.setString(5, patient.getAddress());
            ps.setString(6, patient.getPostCode());
            ps.setString(7, patient.getDOB());         
            ps.executeUpdate();
                    
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            
            result = "data not entered";
        }
             
        return result;
        
   
    }
    
    ///////////////////////////////// Add/Register Doctor ////////////////////////////////////////////
    public String addStaff(UserBean emp){
        //loadDriver(dbDriver);
        Connection con = getConnection();
        //Statement statement = null;
        String result = "data entered successfully";
        
        
        //String sql = "INSERT INTO USERS + (username, password, role)" + "VALUES ("+registerBean.getUsername()+"," +registerBean.getPassword()+ "," +registerBean.getRole() + ")";
        String sql = "INSERT INTO EMPLOYEE (USERNAME, PASSWORD, FULLNAME, EMAIL, STAFF) VALUES (?, ?, ?, ?, ?)";
        
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emp.getUsername());
            ps.setString(2, emp.getPassword());
            ps.setString(3, emp.getFullName());
            ps.setString(4, emp.getEmail());  
            ps.setString(5, emp.getStaff());  
            ps.executeUpdate();
                    
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            
            result = "data not entered";
        }
             
        return result;
        
   
    }
    
}
