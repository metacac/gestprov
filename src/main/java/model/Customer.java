/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author gerencia
 */
public class Customer {
    
    private long cuit;
    private String email;
    private String namesAll;
    private long celular;
    private String password;
    
    public Customer(long cuit, String email, String namesAll,  long celular, String password) {
        this.cuit = cuit;
        this.email = email;
        this.namesAll = namesAll;
        this.celular = celular;
        this.password = password;
    }
    
    public Customer(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public long getCuit() {
        return cuit;
    }

    public void setCuit(long cuit) {
        this.cuit = cuit;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNamesAll() {
        return namesAll;
    }

    public void setNamesAll(String namesAll) {
        this.namesAll = namesAll;
    }

    public long getCelular() {
        return celular;
    }

    public void setCelular(long celular) {
        this.celular = celular;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
