/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.property.ejb;

import com.property.model.Property;
import com.property.model.Purchase;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author aquam
 */
@Stateless
public class PropertyFacade extends AbstractFacade<Property> implements PropertyFacadeLocal {

    @PersistenceContext(unitName = "ProjectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PropertyFacade() {
        super(Property.class);
    }
public Property createProperty(Property property) {
        em.persist(property);
        return property;
    }
    
    public Property updateProperty(Property property) {
        property.setUpdatedAt(new java.util.Date());
        return em.merge(property);
    }
    
    public void deleteProperty(Long id) {
        Property property = em.find(Property.class, id);
        if (property != null) {
            em.remove(property);
        }
    }
    
    public Property findById(Long id) {
        return em.find(Property.class, id);
    }
    
    public List<Property> findAll() {
        TypedQuery<Property> query = em.createNamedQuery("Property.findAll", Property.class);
        return query.getResultList();
    }
    
    public List<Property> findPublished() {
        TypedQuery<Property> query = em.createNamedQuery("Property.findPublished", Property.class);
        return query.getResultList();
    }
    
    public List<Property> findByType(String type) {
        TypedQuery<Property> query = em.createNamedQuery("Property.findByType", Property.class);
        query.setParameter("type", type);
        return query.getResultList();
    }
    
    public List<Property> findByPriceRange(double minPrice, double maxPrice) {
        TypedQuery<Property> query = em.createNamedQuery("Property.findByPriceRange", Property.class);
        query.setParameter("minPrice", minPrice);
        query.setParameter("maxPrice", maxPrice);
        return query.getResultList();
    }
    
    public List<Property> findByAreaRange(int minArea, int maxArea) {
        TypedQuery<Property> query = em.createNamedQuery("Property.findByAreaRange", Property.class);
        query.setParameter("minArea", minArea);
        query.setParameter("maxArea", maxArea);
        return query.getResultList();
    }
    
    public List<Property> findByBedrooms(int bedrooms) {
        TypedQuery<Property> query = em.createNamedQuery("Property.findByBedrooms", Property.class);
        query.setParameter("bedrooms", bedrooms);
        return query.getResultList();
    }
    
    public List<Property> findByBathrooms(int bathrooms) {
        TypedQuery<Property> query = em.createNamedQuery("Property.findByBathrooms", Property.class);
        query.setParameter("bathrooms", bathrooms);
        return query.getResultList();
    }
    
    public List<Property> findFiltered(String type, Double minPrice, Double maxPrice, Integer minArea, Integer maxArea, Integer bedrooms, Integer bathrooms) {
        StringBuilder queryBuilder = new StringBuilder("SELECT p FROM Property p WHERE p.status = 'published'");
        
        if (type != null && !type.isEmpty()) {
            queryBuilder.append(" AND p.type = :type");
        }
        
        if (minPrice != null) {
            queryBuilder.append(" AND p.price >= :minPrice");
        }
        
        if (maxPrice != null) {
            queryBuilder.append(" AND p.price <= :maxPrice");
        }
        
        if (minArea != null) {
            queryBuilder.append(" AND p.area >= :minArea");
        }
        
        if (maxArea != null) {
            queryBuilder.append(" AND p.area <= :maxArea");
        }
        
        if (bedrooms != null) {
            queryBuilder.append(" AND p.bedrooms >= :bedrooms");
        }
        
        if (bathrooms != null) {
            queryBuilder.append(" AND p.bathrooms >= :bathrooms");
        }
        
        TypedQuery<Property> query = em.createQuery(queryBuilder.toString(), Property.class);
        
        if (type != null && !type.isEmpty()) {
            query.setParameter("type", type);
        }
        
        if (minPrice != null) {
            query.setParameter("minPrice", minPrice);
        }
        
        if (maxPrice != null) {
            query.setParameter("maxPrice", maxPrice);
        }
        
        if (minArea != null) {
            query.setParameter("minArea", minArea);
        }
        
        if (maxArea != null) {
            query.setParameter("maxArea", maxArea);
        }
        
        if (bedrooms != null) {
            query.setParameter("bedrooms", bedrooms);
        }
        
        if (bathrooms != null) {
            query.setParameter("bathrooms", bathrooms);
        }
        
        return query.getResultList();
    }
    
}
