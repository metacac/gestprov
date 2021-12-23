/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import config.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.sql.Timestamp;
import model.Customer;


/**
 *
 * @author gerencia
 */
public class CustomerDAO {
    Connection connec;
    PreparedStatement ps;
    ResultSet rs;
    
    
    public CustomerDAO() {
        DBConn conn = new DBConn();
        connec = conn.getConnection("","",""); //configurar usuario y clave segun el caso
    }
    
    public Customer getCustomerByEmail(String email) throws SQLException{
        Customer customer = null;
        
        ps = connec.prepareStatement("SELECT * FROM customer WHERE email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        while (rs.next()) {            
            customer = new Customer(rs.getLong("cuit"), email, rs.getString("namesRepre"), rs.getLong("celular"));
        }
        
        rs.close();
        ps.close();
        //connec.close();
        return customer;
    }
    
    public boolean validateStatusByEmail(String email) throws SQLException {
        Boolean respuesta = false;
        String sql = "SELECT statusCustomer FROM information "
                   + "LEFT JOIN customer "
                   + "ON  idCustomer = cuit "
                   + "WHERE email = ?"; 
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            respuesta = rs.getString("statusCustomer").equals("Activo");
            rs.close();
            ps.close();
            //connec.close();
            return respuesta;
        }
        rs.close();
        ps.close();
        //connec.close();
        return respuesta;
    }
    
    public boolean login(String email, String password) throws SQLException {
        String sql = "SELECT email, password FROM customer WHERE email=? AND password = ?";
        ps = connec.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
        
    public boolean duplicateCuit(long cuit) throws SQLException {
        String sql = "SELECT cuit FROM customer WHERE cuit = ?";
        ps = connec.prepareStatement(sql);
        ps.setLong(1, cuit);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public boolean validate(long cuit, String email) throws SQLException {
        String sql = "SELECT cuit, email FROM customer WHERE cuit = ? AND email = ?";
        ps = connec.prepareStatement(sql);
        ps.setLong(1, cuit);
        ps.setString(2,email);
        rs = ps.executeQuery();
        
         if (rs.next()){
            rs.close();
            ps.close();
            //connec.close();
            return true;
        }
        rs.close();
        ps.close();
        //connec.close();
        return false;
    }
    
    public Timestamp createCustomer(long cuit, String email, String namesRepre, long celular, String password) throws SQLException{
        Long datetime = System.currentTimeMillis();
        Timestamp dateCre = new Timestamp(datetime); 
        String sql = "INSERT INTO customer (cuit, email, namesRepre, celular, password) VALUES (?,?,?,?,?)";
        ps = connec.prepareStatement(sql, RETURN_GENERATED_KEYS);
        ps.setLong(1,cuit);
        ps.setString(2, email);
        ps.setString(3, namesRepre);
        ps.setLong(4,celular);
        ps.setString(5, password);
        ps.executeUpdate();
        
        rs = ps.getGeneratedKeys();
        while (rs.next()) {
            //dateCre = rs.getTimestamp(1);
        }
        rs.close();
        ps.close();
        //connec.close();
        return dateCre;
    }
    
    public String locked(long cuit) throws SQLException {
        String sql = "UPDATE information SET statusCustomer = 'Bloqueado'"
                   + "WHERE idCustomer = ?"; 
        ps = connec.prepareStatement(sql);
        ps.setLong(1, cuit);
        ps.executeUpdate();
        
        rs.close();
        ps.close();
        //connec.close();
        return "Usuario bloqueado";
    }
}