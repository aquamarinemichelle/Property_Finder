package com.property.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "PROPERTIES")
@NamedQueries({
    @NamedQuery(name = "Property.findAll", query = "SELECT p FROM Property p"),
    @NamedQuery(name = "Property.findPublished", query = "SELECT p FROM Property p WHERE p.status = 'published'"),
    @NamedQuery(name = "Property.findByType", query = "SELECT p FROM Property p WHERE p.type = :type AND p.status = 'published'"),
    @NamedQuery(name = "Property.findByPriceRange", query = "SELECT p FROM Property p WHERE p.price BETWEEN :minPrice AND :maxPrice AND p.status = 'published'"),
    @NamedQuery(name = "Property.findByAreaRange", query = "SELECT p FROM Property p WHERE p.area BETWEEN :minArea AND :maxArea AND p.status = 'published'"),
    @NamedQuery(name = "Property.findByBedrooms", query = "SELECT p FROM Property p WHERE p.bedrooms >= :bedrooms AND p.status = 'published'"),
    @NamedQuery(name = "Property.findByBathrooms", query = "SELECT p FROM Property p WHERE p.bathrooms >= :bathrooms AND p.status = 'published'")
})
public class Property implements Serializable {
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "TITLE", nullable = false)
    private String title;
    
    @Column(name = "ADDRESS", nullable = false)
    private String address;
    
    @Column(name = "PRICE", nullable = false)
    private double price;
    
    @Column(name = "TYPE", nullable = false)
    private String type;
    
    @Column(name = "BEDROOMS", nullable = false)
    private int bedrooms;
    
    @Column(name = "BATHROOMS", nullable = false)
    private int bathrooms;
    
    @Column(name = "AREA", nullable = false)
    private int area;
    
    @Column(name = "DESCRIPTION", length = 2000)
    private String description;
    
    @Column(name = "IMAGE_URL", nullable = false)
    private String imageUrl;
    
    @Column(name = "STATUS", nullable = false)
    private String status;
    
    @Column(name = "CREATED_AT", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date createdAt;
    
    @Column(name = "UPDATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date updatedAt;
    
    // Constructors
    public Property() {
    }
    
    public Property(String title, String address, double price, String type, int bedrooms, int bathrooms, int area, String description, String imageUrl, String status) {
        this.title = title;
        this.address = address;
        this.price = price;
        this.type = type;
        this.bedrooms = bedrooms;
        this.bathrooms = bathrooms;
        this.area = area;
        this.description = description;
        this.imageUrl = imageUrl;
        this.status = status;
        this.createdAt = new java.util.Date();
        this.updatedAt = this.createdAt;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getBedrooms() {
        return bedrooms;
    }

    public void setBedrooms(int bedrooms) {
        this.bedrooms = bedrooms;
    }

    public int getBathrooms() {
        return bathrooms;
    }

    public void setBathrooms(int bathrooms) {
        this.bathrooms = bathrooms;
    }

    public int getArea() {
        return area;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public java.util.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt) {
        this.createdAt = createdAt;
    }

    public java.util.Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(java.util.Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Property)) {
            return false;
        }
        Property other = (Property) object;
        return (this.id != null || other.id == null) && (this.id == null || this.id.equals(other.id));
    }

    @Override
    public String toString() {
        return "com.property.model.Property[ id=" + id + " ]";
    }
}
