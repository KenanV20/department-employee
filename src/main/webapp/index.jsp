
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Javaproject.com</title>
    <style>
        body {

            height: 100vh;
            gap: 10px;
            width: 100%;
            background-image: url("https://www.investopedia.com/thmb/6wht1j1h_hJs0jlr31fKbXT0EJk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-932251156-44ba5ec903d547e695ec0489c9ab1624.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        .overlay{
            width: 100%;
            height: 100vh;
            background-color: rgba(0,0,0,50%);
            position: absolute;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        div {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 20%;
            border-radius: 5px;
        }

        .employee-link{
            display: flex;
            text-decoration: none;
            align-items: center;
            justify-content: center;
            height: 60px;
            color: white;
            background-color: #3E54AC;
            border-radius: 10px;
            border: 1px solid #000;
            margin-bottom: 8px;
            cursor: pointer;
            width: 100%;
            text-align: center;
            font-size: 16px;
            transition: all .3s;
            font-weight: 500;
        }
        .employee-link:hover{
            background-color: brown;
        }

        h1 {
            color: green;
            background-color: aliceblue;
            border-radius: 15px;
            padding: 5px 10px;
            box-shadow: 0px 5px 10px green;
            margin-bottom: 10px;
        }

        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <div class="overlay">
        <h1>Personal Bank</h1>
        <div>
            <a href="index3.html" class="employee-link">Employee</a>

            <a href="department_home.html"  class="employee-link">Department</a>
        </div>
    </div>
</body>

</html>
