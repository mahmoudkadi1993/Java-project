<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
                           <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body><%String temp=request.getParameter("name");%>
        <form method="get">
        <table>
                <tr><td>NAME</td><td><input type="text" name='name' value="<%out.println(String.valueOf(temp));%>" required/></td></tr>
                <tr><td colspan="2"><button type="submit" name="search" value="ture" style="width:100%;"/>Search</td></tr>
        </table>
        </form>
            <form method="get" action="" >
        <TABLE border="1px"  class="table table-bordered table-dark">
            <thead>
                <td>ID</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Type</td>
                <td>Username</td>
            </thead>
        <% 
            String connectionUrl = "jdbc:derby://localhost:1527/";
            String dbName = "covid19";
            String userId = "bacel";
            String password = "bacel123";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            int count=0;
        
        try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
        
        String name="'"+temp+"%'";
        name=name.toLowerCase();
        String sql="SELECT * FROM users where lower(fname) like "+ name;
        out.println(sql);
        resultSet = statement.executeQuery(sql);
        
        while(resultSet.next()){
            count++;
        %>
            <tr bgcolor="#DEB887">
                <td><%=resultSet.getString("ID") %></td>
                <td><%=resultSet.getString("FNAME") %></td>
                <td><%=resultSet.getString("LNAME") %></td>
                <td><%=resultSet.getString("TYPE") %></td>
                <td><%=resultSet.getString("USERNAME") %></td>
                <td><input type="checkbox" name="ids" value="<%=resultSet.getString("ID")%>"/></td>
            </tr>
            

    <% 
    }

    } catch (Exception e) {
    e.printStackTrace();
    }
try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        statement=connection.createStatement();
    out.println(count);
    String val[] = request.getParameterValues("ids");
    if (val != null && val.length != 0) {
        for ( int i=0 ; i<val.length ; i++){
            out.println("ids");
            out.println(val[i]);
            String sql="delete FROM users where id="+ Integer.valueOf(val[i]);
            out.println(sql);
            PreparedStatement stmt=connection.prepareStatement(sql);
            stmt.executeUpdate() ;
    }
    }
} catch (Exception e) {
    e.printStackTrace();
    }

    %>
            </table>
            <input type="text" name='name' value="<%out.println(String.valueOf(temp));%>" hidden/>
            <button type="submit" name="delete" value="true"/>Delete
        </form>
    </body>
</html>
