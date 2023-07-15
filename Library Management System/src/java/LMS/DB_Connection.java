/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LMS;
import java.sql.*;
/**
 *
 * @author Mandy
 */
public class DB_Connection {
    private static Connection con = null;
    
    public static Connection getConnection(){
        try{
//            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vjti_atm","root","root");
            
        }catch(Exception e){
           throw new RuntimeException("Something went wrong");
            //e.printStackTrace();
        }
        return con;
    }
}
