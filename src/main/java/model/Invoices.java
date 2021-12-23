/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import database.AccountDAO;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

/**
 *
 * @author gerencia
 */
public class Invoices {
    private long idFromInvoice;
    private long toInvoice;
    private long operationNum;
    private long invoiceNum;
    private long payTotal;
    private Timestamp dateIssue;
    private Timestamp dateExpire;
    private String statusInvoice;
    private List<Invoices> custToInvoices;
    private List<Invoices> custFromInvoices;
    private String statusCal;

    public Invoices(long idFromInvoice, long toInvoice, long operationNum, long invoiceNum, long payTotal, Timestamp dateIssue, Timestamp dateExpire, String statusInvoice, String statusCal) {
        this.idFromInvoice = idFromInvoice;
        this.toInvoice = toInvoice;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateIssue = dateIssue;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
        this.statusCal = statusCal;
        
        AccountDAO AccountDB = new AccountDAO();
        try {
            this.custToInvoices = AccountDB.getToInvoices(idFromInvoice);
        } catch(SQLException e){
        }
        
        try {
            this.custFromInvoices = AccountDB.getFromInvoices(toInvoice);
        } catch(SQLException e){
        }
    }
    
    public Invoices(long idFromInvoice, long toInvoice, long operationNum, long invoiceNum, long payTotal, Timestamp dateIssue, Timestamp dateExpire, String statusInvoice) {
        this.idFromInvoice = idFromInvoice;
        this.toInvoice = toInvoice;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateIssue = dateIssue;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
    }

    public Invoices(long toInvoice, long operationNum, long invoiceNum, long payTotal, Timestamp dateIssue, Timestamp dateExpire, String statusInvoice) {
        this.toInvoice = toInvoice;
        this.operationNum = operationNum;
        this.invoiceNum = invoiceNum;
        this.payTotal = payTotal;
        this.dateIssue = dateIssue;
        this.dateExpire = dateExpire;
        this.statusInvoice = statusInvoice;
    }

    public long getIdFromInvoice() {
        return idFromInvoice;
    }

    public void setIdFromInvoice(long idFromInvoice) {
        this.idFromInvoice = idFromInvoice;
    }

    public long getToInvoice() {
        return toInvoice;
    }

    public void setToInvoice(long toInvoice) {
        this.toInvoice = toInvoice;
    }

    public long getOperationNum() {
        return operationNum;
    }

    public void setOperationNum(long operationNum) {
        this.operationNum = operationNum;
    }

    public long getInvoiceNum() {
        return invoiceNum;
    }

    public void setInvoiceNum(long invoiceNum) {
        this.invoiceNum = invoiceNum;
    }

    public long getPayTotal() {
        return payTotal;
    }

    public void setPayTotal(long payTotal) {
        this.payTotal = payTotal;
    }

    public Timestamp getDateIssue() {
        return dateIssue;
    }

    public void setDateIssue(Timestamp dateIssue) {
        this.dateIssue = dateIssue;
    }

    public Timestamp getDateExpire() {
        return dateExpire;
    }

    public void setDateExpire(Timestamp dateExpire) {
        this.dateExpire = dateExpire;
    }

    public String getStatusInvoice() {
        return statusInvoice;
    }

    public void setStatusInvoice(String statusInvoice) {
        this.statusInvoice = statusInvoice;
    }

    public String getStatusCal() {
        return statusCal;
    }

    public void setStatusCal(String statusCal) {
        this.statusCal = statusCal;
    }
    
}
