package com.example.tomcatproje;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(value = "/employees")
public class EmployeeServlet extends HttpServlet {
    static PreparedStatement preparedStatement = null;
    static Statement statement = null;
    static ResultSet resultSet = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Employee> list = new ArrayList<>();

        String query = "select * from employees";
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
            preparedStatement = con.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            System.out.println("con");
            while (resultSet.next()) {
                Employee e = new Employee();

                e.setName(resultSet.getString(1));
                e.setSurname(resultSet.getString(2));
                e.setDepartment(resultSet.getString(3));


                list.add(e);
            }
            System.out.println(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("employee_List", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("index11.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
       String dp = req.getParameter("department");

        try {
            add(name, surname, dp);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public static void add(String name, String surname, String dp) throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");

            String query = "insert into employees(name,surname,department) values (?,?,?)";

            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, surname);
            preparedStatement.setString(3, dp);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void getDepartment() {
        List<Department> list = new ArrayList<>();

        String query = "select * from departments";
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
            PreparedStatement preparedStatement = con.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Department d = new Department();

                d.setId(resultSet.getInt(1));
                d.setDepartment_name(resultSet.getString(2));


                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    }




