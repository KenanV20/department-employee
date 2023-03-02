package com.example.tomcatproje;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Department {
    private String department_name;
    private int id;

    @Override
    public String toString() {
        return "Department{" +
                "department_name='" + department_name + '\'' +
                ", id=" + id +
                '}';
    }
    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {

        this.department_name = department_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}