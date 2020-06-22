<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Quarantine Center</title>
                <style type="text/css">
          #map{ width:350px; height:350px; }
        </style>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	body{
		color: #fff;
		background: #3598dc;
		font-family: 'Roboto', sans-serif;
	}
    .form-control{
		height: 41px;
		background: #f2f2f2;
		box-shadow: none !important;
		border: none;
	}
	.form-control:focus{
		background: #e2e2e2;
	}
    .form-control, .btn{        
        border-radius: 3px;
    }
	.signup-form{
		width: 390px;
		margin: 30px auto;
	}
	.signup-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form h2 {
		color: #333;
		font-weight: bold;
        margin-top: 0;
    }
    .signup-form hr {
        margin: 0 -30px 20px;
    }    
	.signup-form .form-group{
		margin-bottom: 20px;
	}
	.signup-form input[type="checkbox"]{
		margin-top: 3px;
	}
	.signup-form .row div:first-child{
		padding-right: 10px;
	}
	.signup-form .row div:last-child{
		padding-left: 10px;
	}
    .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;
		background: #3598dc;
		border: none;
		min-width: 140px;
    }
	.signup-form .btn:hover, .signup-form .btn:focus{
		background: #2389cd !important;
        outline: none;
	}
    .signup-form a{
		color: #fff;
		text-decoration: underline;
	}
	.signup-form a:hover{
		text-decoration: none;
	}
	.signup-form form a{
		color: #3598dc;
		text-decoration: none;
	}	
	.signup-form form a:hover{
		text-decoration: underline;
	}
    .signup-form .hint-text {
		padding-bottom: 15px;
		text-align: center;
    }
</style>
    </head>
    <body>
               
              <div class="signup-form ">
   <form method="post" action="">
		<h2>Add Quarantine Center</h2>
		<p>Please fill in this form!</p>
		<hr>
        <div class="form-group">
			<div class="form-group">
 
				<input type="text" class="form-control" name="name" placeholder="Name" required="required">
			
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="address" placeholder="Address" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="phone" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="patients" placeholder="patients" required="required">
        </div>   
                	
                                       <div class="row">
                                           <div class="col-xs-6">	 <input type="text" id="lat" class="form-control" name="longitude" placeholder="longitude" required="required"></div>
				<div class="col-xs-6">     <input type="text" id="lng"  class="form-control" name="latitude" placeholder="latitude" required="required"></div>
			</div>  
            <br/>
           <div class="form-group">
               <div id="map"></div>
        </div>   
		<div class="form-group">
            <button type="submit" name="addsubmit" class="btn btn-primary btn-lg">Save</button>
        </div>
                
    </form>
	<div class="hint-text"></div>
</div>
        <%
            String ut= (String)session.getAttribute("type");
            out.println(ut);
            if(ut==null){
                out.println("<script>alert('please login first'); document.location.href='index.jsp';</script>");
            }
            else{
                if(ut.equals("admin")){
            %>
     
  
        <%
            String connectionUrl = "jdbc:derby://localhost:1527/";
            String dbName = "covid19";
            String userId = "bacel";
            String password = "bacel123";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;
            String name = request.getParameter("name");
                if(name!=null){
                    int phone = Integer.valueOf(request.getParameter("phone")) ;
                    String address= request.getParameter("address") ;
                    int patients = Integer.valueOf(request.getParameter("patients")) ;
                    String longitude=request.getParameter("longitude");
                    String latitude=request.getParameter("latitude");
                        try{ 
                            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                            statement = connection.createStatement();
                            String sql = "insert into quarantinecenter(";
                            sql = sql + '"'+"name"+'"';
                            sql = sql +",address,phone,patients,longitude,latitude) values(?,?,?,?,?,?)";
                            PreparedStatement stmt = connection.prepareStatement(sql);
                            stmt.setString(1,name);
                            stmt.setString(2,address);
                            stmt.setInt(3,phone);
                            stmt.setInt(4,patients);
                            stmt.setString(5, longitude);
                            stmt.setString(6, latitude);
                            int i=stmt.executeUpdate();  
                            out.println(i + " records inserted");
                           
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                }
                }
            else{ out.println("<script>alert('YOU Are NOT Allowed To Access this Page');document.location.href='index.jsp';</script>");}}
        %>
           <script>
             
//Set up some of our variables.
var map; //Will contain map object.
var marker = false; ////Has the user plotted their location marker? 
        
//Function called to initialize / create the map.
//This is called when the page has loaded.
function initMap() {
 
    //The center location of our map.
    var centerOfMap = new google.maps.LatLng(34.8021, 38.9968);
 
    //Map options.
    var options = {
      center: centerOfMap, //Set center.
      zoom: 7 //The zoom value.
    };
 
    //Create the map object.
    map = new google.maps.Map(document.getElementById('map'), options);
 
    //Listen for any clicks on the map.
    google.maps.event.addListener(map, 'click', function(event) {                
        //Get the location that the user clicked.
        var clickedLocation = event.latLng;
        //If the marker hasn't been added.
        if(marker === false){
            //Create the marker.
            marker = new google.maps.Marker({
                position: clickedLocation,
                map: map,
                draggable: true //make it draggable
            });
            //Listen for drag events!
            google.maps.event.addListener(marker, 'dragend', function(event){
                markerLocation();
            });
        } else{
            //Marker has already been added, so just change its location.
            marker.setPosition(clickedLocation);
        }
        //Get the marker's location.
        markerLocation();
    });
}
        
//This function will get the marker's current location and then add the lat/long
//values to our textfields so that we can save the location.
function markerLocation(){
    //Get location.
    var currentLocation = marker.getPosition();
    //Add lat and lng values to a field that we can save.
    document.getElementById('lat').value = currentLocation.lat(); //latitude
    document.getElementById('lng').value = currentLocation.lng(); //longitude
}
        
        
//Load the map when the page has finished loading.
google.maps.event.addDomListener(window, 'load', initMap);
        </script>
    </body>
</html>
