/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author gerencia
 */
public class Customer {
    private int id;
    private Timestamp date;
    private String cuitCus;
    private String email;
    private String namesRepre;
    private String celular;
    private String password;
    
    public Customer(int id, Timestamp date, String cuitCus, String email, String namesRepre, String celular) {
        this.id = id;
        this.date = date;
        this.cuitCus = cuitCus;
        this.email = email;
        this.namesRepre = namesRepre;
        this.celular = celular;
    }
    
    public Customer(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Customer(String cuitCus, String email, String namesRepre, String celular) {
        this.cuitCus = cuitCus;
        this.email = email;
        this.namesRepre = namesRepre;
        this.celular = celular;
    }    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    public String getCuitCus() {
        return cuitCus;
    }

    public void setCuitCus(String cuitCus) {
        this.cuitCus = cuitCus;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNamesRepre() {
        return namesRepre;
    }

    public void setNamesRepre(String namesRepre) {
        this.namesRepre = namesRepre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
