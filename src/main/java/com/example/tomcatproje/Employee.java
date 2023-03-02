package com.example.tomcatproje;

public class Employee {
    private String name;
    private String surname;
    private String department;
    public String getDepartment() {
        return department;
    }
    public String setDepartment(String department) {
        this.department = department;
        return department;
    }

    public String getName() {
        return name;
    }

    public String setName(String name) {
        this.name = name;
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String setSurname(String surname) {
        this.surname = surname;
        return surname;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", department='" + department + '\'' +
                '}';
    }
}
