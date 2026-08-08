package com.internship.model;

public class Student {

    private String name;
    private String email;
    private String password;
    private String branch;
    private String college;

    public Student() {
    }

    public Student(String name, String email, String password,
                   String branch, String college) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.branch = branch;
        this.college = college;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }
}
