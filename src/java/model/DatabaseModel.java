/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;

public class DatabaseModel {
    private final Connection con;
    private Statement s;
    private ResultSet rs;
    private PreparedStatement ps;
    
    public DatabaseModel(String url, String driver, String user, String pass)
            throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, pass);
    }
    public void close() throws SQLException {
        if(rs != null) rs.close();
        if(s != null) s.close();
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
    public ResultSet getMenu() throws SQLException {
        s = con.createStatement();
        rs = s.executeQuery("SELECT * FROM MENU ORDER BY TYPE");
        return rs;
    }
    public ResultSet login(String user, String pass) throws SQLException {
        //not yet encrypted (no lesson yet)
        ps = con.prepareStatement("SELECT * FROM users WHERE username = ?",
                ResultSet.TYPE_SCROLL_SENSITIVE, 
                ResultSet.CONCUR_UPDATABLE);
        ps.setString(1, user);
        rs = ps.executeQuery();
        
        // check for username       check for password
        if (rs.next() && rs.getString("password").equals(pass)) {
            // return user info if login successful
            return rs;
        }   // return null otherwise
        else return null;
    }
    public boolean checkuser(String user) throws SQLException {
        ps = con.prepareStatement("SELECT * FROM users WHERE username = ?");
        ps.setString(1, user);
        rs = ps.executeQuery();
        return rs.next(); // returns true if existing username found
    }
    
    public void signup(String user, String pass, String firstName, String lastName) throws SQLException {
        ps = con.prepareStatement("INSERT INTO users(username,password,fname,lname) VALUES (?,?,?,?)");
        ps.setString(1, user);
        ps.setString(2, pass);
        ps.setString(3, firstName);
        ps.setString(4, lastName);
        ps.executeUpdate();
    }
    
    public void updateUser(String user, String firstName, String lastName) throws SQLException {
        ps = con.prepareStatement("UPDATE users SET fname = ?, lname = ? WHERE username = ?");
        ps.setString(1, firstName);
        ps.setString(2, lastName);
        ps.setString(3, user);
        ps.executeUpdate();
    }
    
}
