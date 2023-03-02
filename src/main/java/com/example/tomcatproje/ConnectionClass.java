//package com.example.tomcatproje;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//
//public class ConnectionClass {
//    static Connection con = null;
//
//    public static void conn() {
//
//
//        try {
//            Class.forName("org.postgresql.Driver");
//            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "12345");
//            System.out.println("dvd");
//
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//        }
//    }
//
//    public static void main(String[] args) {
//
//        conn();
//    }
//
//}
