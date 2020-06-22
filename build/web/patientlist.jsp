<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacient List</title>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="MAIN.css"/>
    </head>
    <body>
        <div class="topnav">
          <a href="index.jsp">HOME</a>
          <a class="active" href="cases.jsp">Positive Cases Distribution</a>
          <a href="hcenter.jsp">Health Centers</a>
          <a href="qcenter.jsp">Quarantine Centers</a>
          <a href="about.jsp">About</a><a style="float:right;" href="admin.html" id="admin" hidden>Admin</a>
          <a style="float:right;" href="signin.html" id="in" hidden>Login</a>
          <a style="float:right;" href="signup.html" id="up" hidden>Sign UP</a>
          <a style="float:right;" href="logout.jsp" id="out">LOG OUT</a>
          <a style="float:right;" href="caserequest.jsp" id="add">add possible case</a>
        </div>
        <TABLE border="1px" class="table table-bordered table-dark">
            <thead>class="table table-bordered table-
                <td>ID</td>
                <td>NAME</td>
                <td>ID Number</td>
                <td>National Number</td>
                <td>Phone Number</td>
                <td>Mobile Number</td>
                <td>Email</td>
                <td>Address</td>
                <td>Status</td>
                <td>Health Center</td>
                <td>Quarantine Center</td>
                     <td>$</td>
            </thead>
        <%
            String connectionUrl = "jdbc:derby://localhost:1527/";
            String dbName = "covid19";
            String userId = "bacel";
            String password = "bacel123";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
        try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
        String sql="SELECT * FROM CASES";
       
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
            <tr >
                <td><%=resultSet.getString("ID") %></td>
                <td><%=resultSet.getString("NAME") %></td>
                <td><%=resultSet.getString("IDNUM") %></td>
                <td><%=resultSet.getString("NATIONALNUM") %></td>
                <td><%=resultSet.getString("PHONE") %></td>
                <td><%=resultSet.getString("MOBILE") %></td>
                <td><%=resultSet.getString("EMAIL") %></td>
                <td><%=resultSet.getString("ADDRESS") %></td>
                <td><%=resultSet.getString("STATUS") %></td>
                <td><%=resultSet.getString("HCID") %></td>
                <td><%=resultSet.getString("QCID") %></td>
                <td><a href="editpatient.jsp?id=<%=resultSet.getString("ID") %>">Edit</a></td>
            </tr>

    <% 
    }

    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
        </table>
    </body>
</html>