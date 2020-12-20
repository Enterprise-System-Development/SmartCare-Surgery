/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

//import database.UserDao;
import java.sql.*;
import java.util.logging.*;
import java.sql.Connection;
import bean.UserBean;

/**
 *
 * @author emmanueledmund
 */
public class UserDao {
    private String dbUrl = "jdbc:derby://localhost:1527/SmartCareDB";
    private String dbUname = "smartcare"; 
    private String dbPassword = "1234";
    //private String dbRole = "rootpassword";
    private String dbDriver = "org.apache.derby.jdbc.ClientDriver";
    //private Connection con;
    //private Statement statement;
    
    
    
    
    
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
    
    
    public boolean validate(UserBean loginBean){
       // loadDriver(dbDriver);
        Connection con = getConnection();
        Statement statement = null;
        
        boolean status = false;
        
        String sql = "SELECT * FROM USERS WHERE username = '"+loginBean.getUsername()+"' AND password = '"+loginBean.getPassword()+"' AND role = '"+loginBean.getRole()+"'";
        
    
        
        try {
            statement = con.createStatement();
            
            
        ResultSet rs = statement.executeQuery(sql);
        status = rs.next();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
           
        return status;
        
   
    }
    
    
    public String insert(UserBean registerBean){
        //loadDriver(dbDriver);
        Connection con = getConnection();
        //Statement statement = null;
        String result = "data entered successfully";
        
        
        //String sql = "INSERT INTO USERS + (username, password, role)" + "VALUES ("+registerBean.getUsername()+"," +registerBean.getPassword()+ "," +registerBean.getRole() + ")";
        String sql = "INSERT INTO USERS (USERNAME, PASSWORD, ROLE, FULLNAME, ADDRESS, POSTCODE, DOB) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, registerBean.getUsername());
            ps.setString(2, registerBean.getPassword());
            ps.setString(3, registerBean.getRole());
            ps.setString(4, registerBean.getFullName());
            ps.setString(5, registerBean.getAddress());
            ps.setString(6, registerBean.getPostCode());
            ps.setString(7, registerBean.getDOB());         
            ps.executeUpdate();
                    
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
            
            result = "data not entered";
        }
             
        return result;
        
   
    }
    
    
}
    