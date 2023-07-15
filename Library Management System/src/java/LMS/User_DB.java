/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LMS;

import java.sql.*;

public class User_DB {

    Connection con;

    public User_DB(Connection con) {
        this.con = con;
    }

    //for register user 
    public boolean saveUser(User user) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into tblstudents(StudentId,FullName,MobileNumber,EmailId,Password,Status) values(?,?,?,?,?,?)";
            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getSid());
            pt.setString(2, user.getFname());
            pt.setString(3, user.getEmail());
            pt.setString(4, user.getMobileno());
            pt.setString(5, user.getPassword());
            pt.setInt(6, user.getStatus());

            pt.executeUpdate();
            set = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }
    public User logUser(String email, String password) {
        User user = null;
        try {
            String query = "select * from tblstudents where EmailId =? and Password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setSid(rs.getString("StudentId"));
                user.setFname(rs.getString("FullName"));
                user.setMobileno(rs.getString("MobileNumber"));
                user.setEmail(rs.getString("EmailId"));
                user.setPassword("Password");
                user.setStatus(rs.getInt("Status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public User logadmUser(String email, String password) {
        User user = null;
        try {
            String query = "select * from admin where UserName =? and Password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setStatus(rs.getInt("id"));
                user.setFname(rs.getString("FullName"));
                user.setEmail(rs.getString("AdminEmail"));
                user.setSid(rs.getString("UserName"));
                user.setPassword(rs.getString("Password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    boolean UpdateUser(User userModel) {
        boolean set = false;
        try {
            //Insert register data to database
            PreparedStatement update = con.prepareStatement("UPDATE tblstudents SET FullName = ?, MobileNumber = ? WHERE StudentId = ?");
            //PreparedStatement pt = this.con.prepareStatement(query);
            update.setString(1, userModel.getFname());
            update.setString(2, userModel.getMobileno());
            update.setString(3, userModel.getSid());
            update.executeUpdate();
            set = true;
        } catch (Exception e) {
            System.out.println("Errorrrr");
            e.printStackTrace();
        }
        return set;
    }
    
}
