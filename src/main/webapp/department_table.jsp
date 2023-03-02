<%@ page import="java.util.List" %>
<%@ page import="com.example.tomcatproje.Employee" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.tomcatproje.Department" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <title>Title</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
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
      background-color: rgba(0, 0, 0, 50%);
      position: absolute;
    }

    .container {
      padding: 80px 440px;
      border-radius: 5px;


    }

    thead th,.tbody td{
      width: 33.3%;
      padding: 8px 0;
      text-align: center;
    }
    .menu-container{
      width: 520px;
      display: flex;
      justify-content: center;
      margin-top: 10px;
      gap: 10px;
    }
    .main-menu{
      width: 25%;
      text-decoration: none;
      border-radius: 6px;
      padding: 10px;
      background-color: blueviolet;
      color: #fff;
      text-align: center;
      transition: all .3s;
      border: 1px solid #000;
      margin-top: 10px;

    }
    .main-menu:hover{
      background-color: red;
    }

  </style>
</head>

<body>
<div class="overlay">
  <div class="container">

    <table cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td>
          <table cellspacing="0" cellpadding="1" border="1" width="500    " style="border-bottom: none;">
            <tr style="color:white;background-color:grey">
              <thead style="color: #fff;background-color: #3E54AC;">
              <th>ID</th>
              <th>Department</th>
              </thead>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td>
          <div style="width:520px; height:200px; overflow:auto;">
            <table style="background-color: #fff; " cellspacing="0" cellpadding="1" border="1"
                   width="500">
              <tbody class="tbody">
              <%

                List<Department> list= (List<Department>) request.getAttribute("department_list");
              %>
              <%
                System.out.println(list);
                for(Department d : list ){
              %>
              <tr>
                <td> <%= d.getId()%> </td>
                <td> <%= d.getDepartment_name()%> </td>
                <%  }%>

              </tr>
              </tbody>

            </table>
          </div>
        </td>
      </tr>
    </table>
    <div class="menu-container">
      <a href="index.jsp" class="main-menu">Main menu</a>
      <a href="department_home.html" class="main-menu">Department menu</a>
    </div>
  </div>
</div>

</body>

</html>