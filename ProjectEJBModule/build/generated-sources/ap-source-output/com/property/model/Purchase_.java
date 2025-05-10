package com.property.model;

import com.property.model.Property;
import com.property.model.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-11T00:29:23")
@StaticMetamodel(Purchase.class)
public class Purchase_ { 

    public static volatile SingularAttribute<Purchase, Date> purchaseDate;
    public static volatile SingularAttribute<Purchase, Double> totalPaid;
    public static volatile SingularAttribute<Purchase, Property> property;
    public static volatile SingularAttribute<Purchase, String> paymentMethod;
    public static volatile SingularAttribute<Purchase, Long> id;
    public static volatile SingularAttribute<Purchase, User> user;

}