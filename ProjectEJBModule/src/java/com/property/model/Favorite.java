package com.property.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "FAVORITES")
@NamedQueries({
    @NamedQuery(name = "Favorite.findAll", query = "SELECT f FROM Favorite f"),
    @NamedQuery(name = "Favorite.findByUser", query = "SELECT f FROM Favorite f WHERE f.user.id = :userId"),
    @NamedQuery(name = "Favorite.findByUserAndProperty", query = "SELECT f FROM Favorite f WHERE f.user.id = :userId AND f.property.id = :propertyId")
})
public class Favorite implements Serializable {
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
    
    @Column(name = "ADDED_AT", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date addedAt;
    
    // Constructors
    public Favorite() {
    }
    
    public Favorite(User user, Property property) {
        this.user = user;
        this.property = property;
        this.addedAt = new java.util.Date();
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

    public java.util.Date getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(java.util.Date addedAt) {
        this.addedAt = addedAt;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Favorite)) {
            return false;
        }
        Favorite other = (Favorite) object;
        return (this.id != null || other.id == null) && (this.id == null || this.id.equals(other.id));
    }

    @Override
    public String toString() {
        return "com.property.model.Favorite[ id=" + id + " ]";
    }
}
