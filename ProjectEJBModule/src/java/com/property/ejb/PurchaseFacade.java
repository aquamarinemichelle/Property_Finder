/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.property.ejb;

import com.property.model.Purchase;
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
public class PurchaseFacade extends AbstractFacade<Purchase> implements PurchaseFacadeLocal {

    @PersistenceContext(unitName = "ProjectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PurchaseFacade() {
        super(Purchase.class);
    }

        public Purchase createPurchase(Purchase purchase) {
        em.persist(purchase);
        return purchase;
    }
    
    public Purchase updatePurchase(Purchase purchase) {
        return em.merge(purchase);
    }
    
    public void deletePurchase(Long id) {
        Purchase purchase = em.find(Purchase.class, id);
        if (purchase != null) {
            em.remove(purchase);
        }
    }
    
    public Purchase findById(Long id) {
        return em.find(Purchase.class, id);
    }
    
    public List<Purchase> findAll() {
        TypedQuery<Purchase> query = em.createNamedQuery("Purchase.findAll", Purchase.class);
        return query.getResultList();
    }
    
    public List<Purchase> findByUser(Long userId) {
        TypedQuery<Purchase> query = em.createNamedQuery("Purchase.findByUser", Purchase.class);
        query.setParameter("userId", userId);
        return query.getResultList();
    }
    
    public List<Purchase> findByProperty(Long propertyId) {
        TypedQuery<Purchase> query = em.createNamedQuery("Purchase.findByProperty", Purchase.class);
        query.setParameter("propertyId", propertyId);
        return query.getResultList();
    }
    
}
