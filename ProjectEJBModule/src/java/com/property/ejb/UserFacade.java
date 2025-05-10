package com.property.ejb;

import com.property.model.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author aquam
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "ProjectEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
        public User createUser(User user) {
        em.persist(user);
        return user;
    }
    
    public User updateUser(User user) {
        return em.merge(user);
    }
    
    public void deleteUser(Long id) {
        User user = em.find(User.class, id);
        if (user != null) {
            em.remove(user);
        }
    }
    
    public User findById(Long id) {
        return em.find(User.class, id);
    }
    
    public List<User> findAll() {
        TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
        return query.getResultList();
    }
    
    public User findByEmail(String email) {
        TypedQuery<User> query = em.createNamedQuery("User.findByEmail", User.class);
        query.setParameter("email", email);
        try {
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    
    public User authenticate(String email, String password) {
        TypedQuery<User> query = em.createNamedQuery("User.findByEmailAndPassword", User.class);
        query.setParameter("email", email);
        query.setParameter("password", password);
        try {
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    
    public List<User> findCustomers() {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.role = 'customer'", User.class);
        return query.getResultList();
    }

     
    public void registerUser(String name, String email, String password) {
        User user = new User(name, email, password);
        em.persist(user);
    }
}
