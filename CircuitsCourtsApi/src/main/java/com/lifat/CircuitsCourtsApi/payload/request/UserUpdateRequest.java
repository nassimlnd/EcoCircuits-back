package com.lifat.CircuitsCourtsApi.payload.request;

import lombok.Data;

import java.util.Set;

@Data
public class UserUpdateRequest {

    private String username;

    private String email;

    private String password;

    private Set<String> roles;

}
