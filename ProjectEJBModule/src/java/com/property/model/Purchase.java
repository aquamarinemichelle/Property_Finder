package com.property.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "PURCHASES")
@NamedQueries({
    @NamedQuery(name = "Purchase.findAll", query = "SELECT p FROM Purchase p"),
    @NamedQuery(name = "Purchase.findByUser", query = "SELECT p FROM Purchase p WHERE p.user.id = :userId"),
    @NamedQuery(name = "Purchase.findByProperty", query = "SELECT p FROM Purchase p WHERE p.property.id = :propertyId")
})
public class Purchase implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "USER_ID", nullable = false)
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "PROPERTY_ID", nullable = false)
    private Property property;
    
    @Column(name = "PURCHASE_DATE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date purchaseDate;
    
    @Column(name = "PAYMENT_METHOD", nullable = false)
    private String paymentMethod;
    
    @Column(name = "TOTAL_PAID", nullable = false)
    private double totalPaid;
    
    // Constructors
    public Purchase() {
    }
    
    public Purchase(User user, Property property, String paymentMethod, double totalPaid) {
        this.user = user;
        this.property = property;
        this.paymentMethod = paymentMethod;
        this.totalPaid = totalPaid;
        this.purchaseDate = new java.util.Date();
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }

    public java.util.Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(java.util.Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalPaid() {
        return totalPaid;
    }

    public void setTotalPaid(double totalPaid) {
        this.totalPaid = totalPaid;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Purchase)) {
            return false;
        }
        Purchase other = (Purchase) object;
        return (this.id != null || other.id == null) && (this.id == null || this.id.equals(other.id));
    }

    @Override
    public String toString() {
        return "com.property.model.Purchase[ id=" + id + " ]";
    }
}
