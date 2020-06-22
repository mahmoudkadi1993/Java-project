<%-- 
    Document   : qe
    Created on : May 29, 2020, 1:10:27 AM
    Author     : Bacel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Quarantine Center</title>
                <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="post" action="">
        <TABLE border="1px" class="table table-bordered table-dark">
            <thead>
                <td>Quarantine Center Name</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Number of Patients</td>
                <td>Longitude</td>
                <td>Latitude</td>
            </thead>
        <%
            String connectionUrl = "jdbc:derby://localhost:1527/";
            String dbName = "covid19";
            String dbuserId = "bacel";
            String dbpassword = "bacel123";
            Connection connection = null;
            ResultSet resultSet = null;
            Statement statement=null;
         try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, dbuserId, dbpassword);
        statement=connection.createStatement();
        String req=request.getParameter("req");
        if(req.equals("out")){
        String sql="SELECT * FROM QUARANTINECENTER where id="+request.getParameter("id");
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
            <tr>
                <input type="text" name="id" value="<%=resultSet.getString("id") %>" hidden/>
                <td><input type="text" name="name" value="<%=resultSet.getString("name") %>"/></td>
                <td><input type="text" name="address" value="<%=resultSet.getString("address") %>"/></td>
                <td><input type="number" name="phone" value="<%=resultSet.getString("phone") %>"/></td>
                <td><input type="number" name="patients" value="<%=resultSet.getString("patients") %>"/></td>
                <td><input type="text" name="longitude" value="<%=resultSet.getString("longitude") %>"/></td>
                <td><input type="text" name="latitude" value="<%=resultSet.getString("latitude") %>"/></td>
            </tr>

    <% 
       }} else{
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            int phone = Integer.parseInt(request.getParameter("phone"));
            int patients=Integer.parseInt(request.getParameter("patients"));
            String longitude=request.getParameter("longitude");
            String latitude=request.getParameter("latitude");
            PreparedStatement psmnt=connection.prepareStatement("update quarantinecenter set "+'"'+"name"+'"'+"=?, address=? ,phone=?, patients=?, longitude=?, latitude=?  where ID=" + request.getParameter("id") );
            psmnt.setString(1,name);
            psmnt.setString(2,address);
            psmnt.setInt(3,phone);
            psmnt.setInt(4,patients);
            psmnt.setString(5, longitude);
            psmnt.setString(6, latitude);
            int i = psmnt.executeUpdate();
            out.println("edit process has been done successfully...");
}

    } catch (SQLException ex) {

             out.println(ex.toString());
    }
    %>
        </table>
        <input type="text" name="req" value="edit" hidden/>
        <input type="submit"value="Edit"/>
        </form>
    </body>
</html>
