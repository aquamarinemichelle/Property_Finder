/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.property.ejb;

import com.property.model.Favorite;
import com.property.model.Property;
import com.property.model.User;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author aquam
 */
@Local
public interface FavoriteFacadeLocal {

    void create(Favorite favorite);

    void edit(Favorite favorite);

    void remove(Favorite favorite);

    Favorite find(Object id);

    List<Favorite> findAll();

    List<Favorite> findRange(int[] range);

    int count();
    
    Favorite findFavoriteByUserAndProperty(User user, Property property);
    List<Favorite> getFavoritesByUser(User user);
    void deleteFavorite(Long id);
    void deleteFavoriteByUserAndProperty(User user, Property property);
    Favorite findFavoriteById(Long id);
    Favorite createFavorite(Favorite favorite);
}
