package com.property.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-11T00:29:23")
@StaticMetamodel(Property.class)
public class Property_ { 

    public static volatile SingularAttribute<Property, Integer> area;
    public static volatile SingularAttribute<Property, String> address;
    public static volatile SingularAttribute<Property, String> description;
    public static volatile SingularAttribute<Property, String> title;
    public static volatile SingularAttribute<Property, String> type;
    public static volatile SingularAttribute<Property, Integer> bathrooms;
    public static volatile SingularAttribute<Property, Integer> bedrooms;
    public static volatile SingularAttribute<Property, Date> createdAt;
    public static volatile SingularAttribute<Property, Double> price;
    public static volatile SingularAttribute<Property, String> imageUrl;
    public static volatile SingularAttribute<Property, Long> id;
    public static volatile SingularAttribute<Property, String> status;
    public static volatile SingularAttribute<Property, Date> updatedAt;

}