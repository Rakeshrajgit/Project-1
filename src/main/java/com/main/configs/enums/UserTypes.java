package com.main.configs.enums;

public enum UserTypes {
    ROLE_USER("USER"),
    ROLE_ADMIN("ADMIN"),
    ROLE_AGENT("AGENT"); // or customer support

    private String name;
    UserTypes(String name)
    {
        this.name= name;
    }
    public String getName() {
        return name;
    }
}
