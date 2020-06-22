<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Patient</title>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

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
=
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
        
        String sid=request.getParameter("id");
        int id=Integer.valueOf(sid);
        
        if(sid!=null){
            
            String name=request.getParameter("name");
            if(name==null){
                String sql="SELECT * FROM CASES where id="+id;
                resultSet = statement.executeQuery(sql);
                
            }else{
                int idnum=Integer.valueOf(request.getParameter("idnum"));
                int nationalnum=Integer.valueOf(request.getParameter("nationalnum"));
                int phone=Integer.valueOf(request.getParameter("phone"));
                int mobile=Integer.valueOf(request.getParameter("mobile"));
                String email=request.getParameter("email");
                String address=request.getParameter("address");
                String status=request.getParameter("status");
                int hcid=Integer.valueOf(request.getParameter("hcid"));
                int qcid=Integer.valueOf(request.getParameter("qcid"));
                PreparedStatement psmnt=connection.prepareStatement("update cases set "+'"'+"name"+'"'+"=?, idnum=?, nationalnum=? ,phone=?, mobile=?, email=?, address=?, status=?, hcid=?, qcid=?  where ID=" + id );
                psmnt.setString(1,name);
                psmnt.setInt(2,idnum);
                psmnt.setInt(3,nationalnum);
                psmnt.setInt(4,phone);
                psmnt.setInt(5,mobile);
                psmnt.setString(6,email);
                psmnt.setString(7,address);
                psmnt.setString(8,status);
                psmnt.setInt(9,hcid);
                psmnt.setInt(10,qcid);
                int i = psmnt.executeUpdate();
                out.println(name+i);
                
                String sql="SELECT * FROM CASES where id="+id;
                resultSet = statement.executeQuery(sql);
                out.println("<script>alert('Updated Successfully');</script>");
            }
                while(resultSet.next()){
        %>
        <form method="get" action="">
        <TABLE border="1px"  class="table table-bordered table-dark" style="">
            <tr>
            <tr>   <td hidden>ID</td>   <td hidden><input type="number" name="id" value="<%=resultSet.getInt("ID") %>"/></td></tr>
            <tr> <td>NAME</td>    <td ><input type="text" name="name" value="<%=resultSet.getString("NAME") %>"/></td></tr>   
               <tr><td >ID Number</td><td><input type="number" name="idnum" value="<%=resultSet.getInt("IDNUM") %>"/></td> </tr>  
               <tr>   <td>National Number</td>  <td><input type="number" name="nationalnum" value="<%=resultSet.getInt("NATIONALNUM") %>"/></td></tr>
              <tr><td>Phone Number</td> <td><input type="number" name="phone" value="<%=resultSet.getInt("PHONE") %>"/></td></tr>   
              <tr> <td>Mobile Number</td> <td><input type="number" name="mobile" value="<%=resultSet.getInt("MOBILE") %>"/></td></tr>   
               <tr>  <td>Email</td>   <td><input type="text" name="email" value="<%=resultSet.getString("EMAIL") %>"/></td> </tr>
               <tr> <td>Address</td>
                <td><input type="text" name="address" value="<%=resultSet.getString("ADDRESS") %>"/></td></tr>  
              <tr>   <td>Status</td><td><select  style="width: 200px;"  name='status' class="custom-select d-block">
            <option value="<%=resultSet.getString("Status") %>">Choose The status...</option>
                                                <option value="positive">Positive</option>
                                                <option value="negative">Negative</option>
                                                <option value="quarantine">Quarantine</option>
                                                <option value="dead">Dead</option>
                                            </select></td></tr> 
              <tr>   <td>Health Center</td>  <td><input type="number" name="hcid" value="<%=resultSet.getInt("HCID") %>"/></td></tr> 
              <tr> <td>Quarantine Center</td> 
                <td><input type="number" name="qcid" value="<%=resultSet.getInt("QCID") %>"/></td></tr>  
            </tr>
     
          

    <% 
    }}

    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
        </table><button type="submit">Edit</button>
    </body>
</html>