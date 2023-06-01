package com.lifat.CircuitsCourtsApi.payload.response;

import com.lifat.CircuitsCourtsApi.model.Role;

import java.util.ArrayList;

public class UserResponse {

    private Long id;

    private String username;

    private String email;

    private ArrayList<RoleResponse> roles;

    public UserResponse(Long id, String username, String email, ArrayList<RoleResponse> roles) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.roles = roles;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<RoleResponse> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<RoleResponse> roles) {
        this.roles = roles;
    }
}
