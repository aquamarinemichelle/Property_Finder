package com.property.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2025-05-11T00:29:23")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> lastName;
    public static volatile SingularAttribute<User, Date> createdAt;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, String> phone;
    public static volatile SingularAttribute<User, Long> id;
    public static volatile SingularAttribute<User, String> email;

}