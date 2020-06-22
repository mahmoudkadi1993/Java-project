<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>COVID-19 Statistics Service</title>
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
        <%
        String ut=null;
        ut=(String)session.getAttribute("type");
        if(ut==null){
            out.println("<script>"
                    + "document.getElementById('in').removeAttribute('hidden');"
                    + "document.getElementById('up').removeAttribute('hidden');"
                    + "document.getElementById('out').setAttribute('hidden',true);"
                    + "document.getElementById('add').setAttribute('hidden',true);"
                    + "</script>");
        }
        else if(ut.equals("admin")){
            out.println("<script>"
                    + "document.getElementById('in').setAttribute('hidden',true);"
                    + "document.getElementById('up').setAttribute('hidden',true);"
                    + "document.getElementById('out').removeAttribute('hidden');"
                    + "document.getElementById('admin').removeAttribute('hidden');"
                    + "</script>");
        }
        else{
            out.println("<script>"
                    + "document.getElementById('in').setAttribute('hidden',true);"
                    + "document.getElementById('up').setAttribute('hidden',true);"
                    + "document.getElementById('out').removeAttribute('hidden');"
                    + "</script>");
        }
    %>

    <table  class="table table-bordered table-dark">
            <tr>
                <th scope="col">location</th>
              <th scope="col">Number of Cases</th>
            </tr>
            <%
                Connection connection;
                Statement statement;
                String connectionUrl = "jdbc:derby://localhost:1527/";
                String dbName = "covid19";
                String dbuserId = "bacel";
                String dbpassword = "bacel123";
                Statement st=null;
                ResultSet rsl=null , rsc=null;
                connection = DriverManager.getConnection(connectionUrl+dbName, dbuserId, dbpassword);
                st=connection.createStatement();
                String status="'positive'";
                String sqla="select distinct address from cases where status="+status;
                try{
                rsl=st.executeQuery(sqla);
                while(rsl.next()){
                    String location = rsl.getString("address");
                    String sqlc="select count(*) as count from cases where status="+status+" and address='" + location + "'";
                    st=connection.createStatement();
                    rsc=st.executeQuery(sqlc);
                    while(rsc.next()) {
                    
            %>
            <tr>
                <td><%=location%></td>
                <td><%=rsc.getInt("count")%></td>
            </tr>
            <%}}}
            catch(SQLException ex){out.println(ex.toString());}%>
        </table>
    </body>
</html>
