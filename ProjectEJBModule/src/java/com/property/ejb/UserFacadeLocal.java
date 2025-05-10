/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.property.ejb;

import com.property.model.User;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author aquam
 */
@Local
public interface UserFacadeLocal {

    void create(User user);

    void edit(User user);

    void remove(User user);

    User find(Object id);

    List<User> findAll();

    List<User> findRange(int[] range);

    int count();
    
    void registerUser(String name, String email, String password);
    
}
