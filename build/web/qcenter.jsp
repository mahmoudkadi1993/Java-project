<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quarantine Centers</title>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
       <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css">
        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="MAIN.css"/>
        <link rel="script" href="login.js"/>
        <link rel="script" href="signup.js"/>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAQSIsLoSKjSeI8er10xAaVcOlQfWJdl6o"></script>    </head>
    <body>
        <div class="topnav">
          <a href="index.jsp">HOME</a>
          <a href="cases.jsp">Positive Cases Distribution</a>
          <a href="hcenter.jsp">Health Centers</a>
          <a class="active" href="">Quarantine Centers</a>
          <a href="about.jsp">About</a>
          <a style="float:right;" href="admin.html" id="admin" hidden>Admin</a>
          <a style="float:right;" href="signin.html" id="in" hidden>Login</a>
          <a style="float:right;" href="signup.html" id="up" hidden>Sign UP</a>
          <a style="float:right;" href="logout.jsp" id="out">LOG OUT</a>
        </div>
      
        <div>
        
        </div>
        <%
        String ut=null;
        ut=(String)session.getAttribute("type");
        if(ut==null){
            out.println("<script>"
                    + "document.getElementById('in').removeAttribute('hidden');"
                    + "document.getElementById('up').removeAttribute('hidden');"
                    + "document.getElementById('out').setAttribute('hidden',true);"
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
        <TABLE border="1px" id="tn" class="table table-bordered table-dark">
            <thead>
                <td>ID</td>
                <td>Quarantine Center Name</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Number of Patients</td>
                <td>Edit</td>
      
            </thead>
        <%
            ResultSet resultSet = null;
        try{ 
        Connection connection;
        Statement statement;
        String connectionUrl = "jdbc:derby://localhost:1527/";
        String dbName = "covid19";
        String dbuserId = "bacel";
        String dbpassword = "bacel123";
        connection = DriverManager.getConnection(connectionUrl+dbName, dbuserId, dbpassword);
        statement=connection.createStatement();
        String sql="SELECT * FROM QUARANTINECENTER";
       
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
        %>
            <tr onclick="changeMAP(this)">
                <td><%=resultSet.getString("id") %></td>
                <td><%=resultSet.getString("name") %></td>
                <td><%=resultSet.getString("address") %></td>
                <td><%=resultSet.getString("phone") %></td>
                <td><%=resultSet.getString("patients") %></td>
                <td>     <form method="post" action="qe.jsp">
                        <input type="number" name="id" value="<%=resultSet.getString("id") %>" hidden/>
                <input type="text" name="req" value="out" hidden/>
                <button type="submit">Edit</button>
            </form></td>
               
            </tr>

    <% 
    }

    } catch (SQLException ex) {

             out.println(ex.toString());
    }
    %>
    
        </table>
          <div style="width:100%;height:400px" id="map"></div>
    <script>
          function changeMAP(element){
              
            var i=element.rowIndex;
            alert(i);
            var longitude=0;
            longitude=longitude+document.getElementById('tn').rows[i].cells[5].innerHTML;
            var latitude=0;
            latitude=latitude+document.getElementById('tn').rows[i].cells[6].innerHTML;
        var map;
        var mapOptions = {zoom: 8, center:{lat:Number(longitude), lng:Number(latitude)}};
        map = new google.maps.Map(document.getElementById('map'),mapOptions);

        var marker = new google.maps.Marker({position:  {lat:Number(longitude), lng:Number(latitude)},map: map});

        var infowindow = new google.maps.InfoWindow({content: '<p> Marker Location:' + marker.getPosition() + '</p>' });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
        });
      }
      function mapini(){
          var map;
        var mapOptions = {zoom: 8, center: {lat: 35.540056, lng: 35.794037}};
        map = new google.maps.Map(document.getElementById('map'),mapOptions);

        var marker = new google.maps.Marker({position:  {lat:35.540056, lng:35.794037},map: map});

        var infowindow = new google.maps.InfoWindow({content: '<p> Marker Location:' + marker.getPosition() + '</p>' });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
        });
      }
        google.maps.event.adddomListener(window,'load', mapini());

             
    </script>
    </body>
</html>
