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
import javax.ejb.Local;

/**
 *
 * @author aquam
 */
@Local
public interface PropertyFacadeLocal {

    void create(Property property);

    void edit(Property property);

    void remove(Property property);

    Property find(Object id);

    List<Property> findAll();

    List<Property> findRange(int[] range);

    int count();
    
    
}
