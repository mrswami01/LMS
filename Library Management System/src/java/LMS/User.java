/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LMS;

/**
 *
 * @author Mandy
 */
public class User {
    String sid;
    String fname;
    String email;
    String mobileno;
    String password;
    int status;
    
    public User() {
    }

    public User(String sid, String fname, String email,String mobileno, String password, int status) {
        this.sid = sid;
        this.fname = fname;
        this.email = email;
        this.mobileno = mobileno;
        this.password = password;
        this.status = 1;
    }
    public void updtUser(String fname, String mobileno, String sid){       
        this.fname = fname;
        this.mobileno = mobileno;
        this.sid = sid;
    }
    
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    User(String fname, String mobileno, String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String name) {
        this.fname = fname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getMobileno() {
        return mobileno;
    }

    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
