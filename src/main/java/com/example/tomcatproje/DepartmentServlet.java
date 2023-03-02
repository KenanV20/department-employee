package com.example.tomcatproje;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/department")
public class DepartmentServlet extends HttpServlet {
    static PreparedStatement preparedStatement = null;
    static Statement statement = null;
    static ResultSet resultSet = null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("department");

        try {
            add(name);
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Department> list = new ArrayList<>();

        String query = "select * from departments";
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
            preparedStatement = con.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            System.out.println("con");
            while (resultSet.next()) {
                Department d = new Department();

                d.setId(resultSet.getInt(1));
                d.setDepartment_name(resultSet.getString(2));

                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("department_list", list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("department_table.jsp");
        dispatcher.forward(req, resp);
    }

    public static void add(String name) throws Exception {
        try {
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
            System.out.println(4);
            String query = "insert into departments values (default,?)";

            preparedStatement = con.prepareStatement(query);

            preparedStatement.setString(1, name);
            preparedStatement.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
