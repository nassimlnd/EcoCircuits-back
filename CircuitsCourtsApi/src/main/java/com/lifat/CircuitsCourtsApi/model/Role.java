package com.lifat.CircuitsCourtsApi.model;


public enum Role {
    ADMIN(3),
    PRODUCTEUR(2),
    CLIENT(1);

    private int grade;
    Role(int grade) {
        this.grade = grade;
    }

    public int getGrade(){
        return this.grade;
    }
}
