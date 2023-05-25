package com.lifat.CircuitsCourtsApi.payload.response;

public class RoleResponse {

    private Long id;

    private String name;

    public RoleResponse(Long id, String name) {
        this.id = id;
        this.name = name;
    }

    public RoleResponse() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

}
