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
        connec = conn.getConnection("","",""); //configurar usuario y clave segun el caso
    }
    
    public Information getInformationByEmail(String email) throws SQLException{
        Information information = null;
        
        ps = connec.prepareStatement("SELECT * FROM customer "
                                    + "INNER JOIN information "
                                    + "ON  idCustomer = cuit "
                                    +"WHERE email = ?");
        ps.setString(1,email);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            long cuit = rs.getLong("cuit");
            String namesCust = rs.getString("namesCust");
            String companyName = rs.getString("companyName");
            Long phone = rs.getLong("phone");
            String direction = rs.getString("direction");
            String postalCode = rs.getString("postalCode");
            String city = rs.getString("city");
            String country = rs.getString("country");
            String statusCustomer = rs.getString("statusCustomer");
            String typeCust = rs.getString("typeCust");
            
            information = new Information(cuit, namesCust, companyName, phone, direction, postalCode, city, country, statusCustomer, typeCust);
        }
        rs.close();
        ps.close();
        //connec.close();
        return information;
    }
    
    public Invoices getInvoiceByCuit(long cuit) throws SQLException{
        Invoices invoice = null;
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE idFromInvoice = ?"
                                    +"LIMIT 0,15");
        ps.setLong(1,cuit);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            Long toInvoice = rs.getLong("toInvoice");
            Long operationNum = rs.getLong("operationNum");
            Long invoiceNum = rs.getLong("invoiceNum");
            Long payTotal = rs.getLong("payTotal");
            Timestamp dateIssue = rs.getTimestamp("dateIssue");
            Timestamp dateExpire = rs.getTimestamp("dateExpire");
            String statusInvoice = rs.getString("statusInvoice");
            
            invoice = new Invoices(cuit,toInvoice,operationNum,invoiceNum,payTotal,dateIssue,dateExpire,statusInvoice);
        }
        rs.close();
        ps.close();
        //connec.close();
        return invoice;    
    }
    
    public String updateCustomer(long cuit, long phone, String direction, String postalCode, String city, String country, String typeCust) throws SQLException{
        String resultado = "El regsitro ha sido creado";
        
        ps = connec.prepareStatement("UPDATE information SET phone = ?, direction = ?, postalCode = ?, city = ?, country = ?, typeCust = ? WHERE idCustomer = "+cuit+"");
        ps.setLong(1,phone);
        ps.setString(2, direction);
        ps.setString(3, postalCode);
        ps.setString(4,city);
        ps.setString(5, country);
        ps.setString(6, typeCust);
        ps.executeUpdate();
        
        rs.close();
        ps.close();
        //connec.close();
        return resultado;
    }
    
    public List<Invoices> getToInvoices(long cuit) throws SQLException {
        List<Invoices> toInvoicesDB = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE idFromInvoice = ?");
        ps.setLong(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            toInvoicesDB.add(new Invoices(cuit,rs.getLong("toInvoice"), rs.getLong("operationNum"), rs.getLong("invoiceNum"), rs.getLong("payTotal"), rs.getTimestamp("dateIssue"), rs.getTimestamp("dateExpire"), rs.getString("statusInvoice")));
        }
        rs.close();
        ps.close();
        //connec.close();
        return toInvoicesDB;
    }
    
    public List<Invoices> getFromInvoices(long cuit) throws SQLException {
        List<Invoices> fromInvoicesDB = new ArrayList<>();
        
        ps = connec.prepareStatement("SELECT * FROM invoices "
                                    +"WHERE toInvoice = ?");
        ps.setLong(1,cuit);
        rs = ps.executeQuery();
        
        while(rs.next()){
            fromInvoicesDB.add(new Invoices(rs.getLong("idFromInvoice"), rs.getLong("operationNum"), rs.getLong("invoiceNum"), rs.getLong("payTotal"), rs.getTimestamp("dateIssue"), rs.getTimestamp("dateExpire"), rs.getString("statusInvoice")));
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
}
