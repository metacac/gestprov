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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Information;
import model.Invoices;

/**
 *
 * @author gerencia
 */
public class AccountDAO {
    Connection connec;
    PreparedStatement ps;
    ResultSet rs;
    long datetime = System.currentTimeMillis();
    Timestamp timestampToday = new Timestamp(datetime);
    
    
    public AccountDAO() {
        DBConn conn = new DBConn();
        connec = conn.getConnection("xxxxxx", "xxxx", "xxxx"); //configurar usuario y clave segun el caso
    }
    
    public Information getInformationByEmail(String email) throws SQLException{
        Information information = null;
        
        ps = connec.prepareStatement("SELECT * FROM customer "
                                    + "INNER JOIN information "
                                    + "ON  cuitInf = cuitCus "
                                    +"WHERE email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int idCustomer = rs.getInt("idCustomer");
            String cuit = rs.getString("cuitCus");
            String namesCust = rs.getString("namesCust");
            String companyName = rs.getString("companyName");
            String phone = rs.getString("phone");
            String direction = rs.getString("direction");
            String postalCode = rs.getString("postalCode");
            String city = rs.getString("city");
            String country = rs.getString("country");
            String statusCustomer = rs.getString("statusCustomer");
            String typeCust = rs.getString("typeCust");
            
            information = new Information(idCustomer, cuit, namesCust, companyName, phone, direction, postalCode, city, country, statusCustomer, typeCust);
        }
        rs.close();
        ps.close();
        //connec.close();
        return information;
    }
    
    public Invoices getInvoiceByOperationNum(String operationNum) throws SQLException{
        Invoices invoice = null;
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE operationNum = ?");
        ps.setString(1,operationNum);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int idInvoice = rs.getInt("idInvoice");
            String fromInvoice = rs.getString("fromInvoice");
            String toInvoice = rs.getString("toInvoice");
            String invoiceNum = rs.getString("invoiceNum");
            Long payTotal = rs.getLong("payTotal");
            Timestamp dateIssue = rs.getTimestamp("dateIssue");
            Timestamp dateExpire = rs.getTimestamp("dateExpire");
            String statusInvoice = rs.getString("statusInvoice");
            
            invoice = new Invoices(idInvoice,fromInvoice,toInvoice,operationNum,invoiceNum,payTotal,dateIssue,dateExpire,statusInvoice);
        }
        rs.close();
        ps.close();
        //connec.close();
        return invoice;    
    }
    
    public boolean updateCustomer(String cuit, String phone, String direction, String postalCode, String city, String country, String typeCust) throws SQLException{
        boolean result = true;
        
        ps = connec.prepareStatement("UPDATE information SET phone = ?, direction = ?, postalCode = ?, city = ?, country = ?, typeCust = ? WHERE cuitInf = ?");
        ps.setString(1,phone);
        ps.setString(2, direction);
        ps.setString(3, postalCode);
        ps.setString(4,city);
        ps.setString(5, country);
        ps.setString(6, typeCust);
        ps.setString(7, cuit);
        ps.executeUpdate();
        
        rs.close();
        ps.close();
        //connec.close();
        return result;
    }
    
    public List<Invoices> getToInvoices(String cuit) throws SQLException {
        List<Invoices> toInvoicesDB = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE fromInvoice = ?");
        ps.setString(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            toInvoicesDB.add(new Invoices(rs.getInt("idInvoice"), rs.getString("toInvoice"), rs.getString("operationNum"), rs.getString("invoiceNum"), rs.getLong("payTotal"), rs.getTimestamp("dateExpire"), rs.getString("statusInvoice")));
        }
        rs.close();
        ps.close();
        //connec.close();
        return toInvoicesDB;
    }
    
    public List<Invoices> getFromInvoices(String cuit) throws SQLException {
        List<Invoices> fromInvoicesDB = new ArrayList<>();
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE toInvoice = ?");
        ps.setString(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            fromInvoicesDB.add(new Invoices(rs.getInt("idInvoice"), rs.getString("fromInvoice"), rs.getString("operationNum"), rs.getString("invoiceNum"), rs.getLong("payTotal"), rs.getTimestamp("dateExpire"), rs.getString("statusInvoice")));
        }
        rs.close();
        ps.close();
        //connec.close();
        return fromInvoicesDB;
    }
    
    public String statusCal (Timestamp dateExpire) {
        if (!dateExpire.after(timestampToday)){
            String statusCal = "Vencida";
            return statusCal;
        } else {
            String statusCal = "Vigente";
            return statusCal;
        }
    }
    
    public boolean delInvoices(String invoiceNum) throws SQLException {
        boolean result = true;
        
        ps = connec.prepareStatement("DELETE FROM invoices "
                                    +"WHERE invoiceNum = ?");
        ps.setString(1,invoiceNum);
        ps.executeUpdate();
        
        rs.close();
        ps.close();
        //connec.close();
        return result;
    }
}
