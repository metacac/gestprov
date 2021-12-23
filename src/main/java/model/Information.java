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
    private long idCustomer;
    private String namesCust;
    private String companyName;
    private long phone;
    private String direction;
    private String postalCode;
    private String city;
    private String country;
    private String statusCustomer;
    private String typeCust;

    public Information(long idCustomer, String namesCust, String companyName, long phone, String direction, String postalCode, String city, String country, String statusCustomer, String typeCust) {
        this.idCustomer = idCustomer;
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

    public long getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(long idCustomer) {
        this.idCustomer = idCustomer;
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

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
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
