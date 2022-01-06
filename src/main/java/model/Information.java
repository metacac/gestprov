/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author gerencia
 */
public class Information {
    private int idCustomer;
    private String cuitInf;
    private String namesCust;
    private String companyName;
    private String phone;
    private String direction;
    private String postalCode;
    private String city;
    private String country;
    private String statusCustomer;
    private String typeCust;

    public Information(int idCustomer, String cuitInf, String namesCust, String companyName, String phone, String direction, String postalCode, String city, String country, String statusCustomer, String typeCust) {
        this.idCustomer = idCustomer;
        this.cuitInf = cuitInf;
        this.namesCust = namesCust;
        this.companyName = companyName;
        this.phone = phone;
        this.direction = direction;
        this.postalCode = postalCode;
        this.city = city;
        this.country = country;
        this.statusCustomer = statusCustomer;
        this.typeCust = typeCust;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getCuitInf() {
        return cuitInf;
    }

    public void setCuitInf(String cuitInf) {
        this.cuitInf = cuitInf;
    }

    public String getNamesCust() {
        return namesCust;
    }

    public void setNamesCust(String namesCust) {
        this.namesCust = namesCust;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStatusCustomer() {
        return statusCustomer;
    }

    public void setStatusCustomer(String statusCustomer) {
        this.statusCustomer = statusCustomer;
    }

    public String getTypeCust() {
        return typeCust;
    }

    public void setTypeCust(String typeCust) {
        this.typeCust = typeCust;
    }
    
    

}
