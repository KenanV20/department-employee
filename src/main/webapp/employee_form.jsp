<%@ page import="com.example.tomcatproje.Department" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Roboto', sans-serif;

        }

        body {

            height: 100vh;
            gap: 10px;
            width: 100%;
            background-image: url("https://www.investopedia.com/thmb/6wht1j1h_hJs0jlr31fKbXT0EJk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-932251156-44ba5ec903d547e695ec0489c9ab1624.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .overlay {
            width: 100%;
            height: 100vh;
            background-color: rgba(0, 0, 0, 60%);
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .form-top {
            display: flex;
            gap: 50px;
            margin-bottom: 30px;
        }
        input.top-input{
            height: 40px;
            width: 300px;
            border-radius: 8px;
            border: none;
            outline: none;
            padding: 10px;
            font-size: 18px;
        }

        .department {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;

        }

        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        label{
            color: #fff;
            font-size: 18px;
            font-weight: 600;
            color: #fff;
            margin-right: 4px;
        }
        select{
            width: 100px;
            font-size: 16px;
            padding: 4px;
            border-radius: 8px;
            border: none;
            outline: none;
        }
        .menu-container{
            width: 520px;
            display: flex;
            justify-content: center;
            margin-top: 10px;
            gap: 10px;
            margin: auto;
        }
        .main-menu{
            width: 40%;
            text-decoration: none;
            border-radius: 6px;
            padding: 10px;
            background-color: blueviolet;
            color: #fff;
            text-align: center;
            transition: all .3s;
            border: 1px solid #000;
            margin-top: 10px;
            font-size: 16px;
            cursor: pointer;

        }
        .main-menu:hover{
            background-color: red;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="overlay">
        <form action="employees" method="post">

            <div class="form-top">
                <div>
                    <label for="name">Name:</label>
                    <input class="top-input" type="text" name="name" id="name" />
                </div>

                <div>
                    <label for="surname">Surname:</label>
                    <input class="top-input" type="text" name="surname" id="surname" />
                </div>
            </div>


            <div class="department">
                <label>Department:</label>
                <%
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

                %>

                <select>
                    <%
                        System.out.println(list);
                        for(Department d : list ){
                    %>
                    <option value= "<%=d.getId()%>" name="department"><%=d.getDepartment_name()%></option>
                    <%}%>
                </select>
            </div>


            <div class="menu-container">
                <input class="main-menu" type="submit" value="Add employee" />
                <a href="index.jsp" class="main-menu">Main menu</a>
                <a href="index3.html" class="main-menu">Employee menu</a>
            </div>

        </form>
    </div>
</div>
</body>

</html>