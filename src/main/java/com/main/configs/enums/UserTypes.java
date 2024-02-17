package com.main.configs.enums;

public enum UserTypes {
    ROLE_ADMIN("ADMIN"),
    ROLE_AGENT("AGENT"),
    ROLE_MANAGER("MANAGER"); // or customer support

    private String name;
    UserTypes(String name)
    {
        this.name= name;
    }
    public String getName() {
        return name;
    }
}
