<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="MailPack.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Patient</title>

        <title>COVID-19 Statistics Service</title>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="MAIN.css"/>
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
        <%
            String ut= (String)session.getAttribute("type");
    
            if(ut==null){
                out.println("<script>alert('please login first'); document.location.href='index.jsp';</script>");
            }
            else{
                if(ut.equals("admin")){
            %>
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
            <div class="signup-form ">
<form method="post" action="">
		<h2>Add Patient</h2>
		<p>Please fill in this form!</p>
		<hr>
        <div class="form-group">
			<div class="form-group">
 
				<input type="text" class="form-control" name="name" placeholder="NAME" required="required">
			
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="idnum" placeholder="ID Number" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="nationalnum" placeholder="National Number" required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="Phone Number" required="required">
        </div>   
            <div class="form-group">
            <input type="text" class="form-control" name="mobile" placeholder="Mobile Number" required="required">
        </div>
            	<div class="form-group">
            <input type="text" class="form-control" name="email" placeholder="Email" required="required">
        </div>   
            	<div class="form-group">
            <input type="text" class="form-control" name="address" placeholder="Address" required="required">
        </div>   
                	<div class="form-group">
       <select name='status' class="custom-select d-block w-100">
            <option value="">Choose The status...</option>
                                                <option value="positive">Positive</option>
                                                <option value="negative">Negative</option>
                                                <option value="quarantine">Quarantine</option>
                                                <option value="dead">Dead</option>
                                            </select>
        </div>
            	<div class="form-group">
            <input type="text" class="form-control" name="hcid" placeholder="Health Center" required="required">
        </div>
                 	<div class="form-group">
            <input type="text" class="form-control" name="qcid" placeholder="Quarantine Center" required="required">
        </div>
                	
                                      
		<div class="form-group">
            <button type="submit"  name="addsubmit" class="btn btn-primary btn-lg">Save</button>
            <a href="patientlist.jsp">Show Patients</a>
        </div>
                
    </form>
	<div class="hint-text"></div>
</div>
    
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
                    int idnum = Integer.valueOf(request.getParameter("idnum")) ;
                    int nationalnum = Integer.valueOf(request.getParameter("nationalnum")) ;
                    int phone = Integer.valueOf(request.getParameter("phone")) ;
                    int mobile = Integer.valueOf(request.getParameter("mobile")) ;
                    String email= request.getParameter("email") ;
                    String address= request.getParameter("address") ;
                    String status= request.getParameter("status") ;
                    int hcid= Integer.valueOf(request.getParameter("hcid")) ;
                    int qcid= Integer.valueOf(request.getParameter("qcid")) ;            
                        try{ 
                            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                            statement = connection.createStatement();
                            String sql = "insert into CASES(";
                            sql = sql + '"'+"name"+'"';
                            sql = sql +",idnum,nationalnum,phone,mobile,email,address,status,hcid,qcid) values(?,?,?,?,?,?,?,?,?,?)";
                            PreparedStatement stmt = connection.prepareStatement(sql);
                            stmt.setString(1,name);
                            stmt.setInt(2,idnum);
                            stmt.setInt(3,nationalnum);
                            stmt.setInt(4,phone);
                            stmt.setInt(5,mobile);
                            stmt.setString(6,email);
                            stmt.setString(7,address);
                            stmt.setString(8,status);
                            stmt.setInt(9,hcid);
                            stmt.setInt(10,qcid);
                            int i=stmt.executeUpdate();
                            if(hcid!=0){
                                sql="update healthcenter set patients=patients+1 where id="+hcid;
                                Statement st=connection.createStatement();
                                st.executeUpdate(sql);
                                out.println("one patient has been added to health center number "+hcid);
                                
                            }
                            else if (qcid!=0){
                                sql="update quarantinecenter set patients=patients+1 where: id="+qcid;
                                Statement st=connection.createStatement();
                                st.executeUpdate(sql);
                                out.println("one patient has been added to quarantine center number: "+hcid);
                            }
                            else{
                                out.println("no patients have been added to any center");
                            }
                            JAVAMail sender = new JAVAMail();
                            String res = sender.SendMail(email, name, address);
                            out.println("<script>alert('"+res+"');</script>");
                            out.println(i + " records inserted");
                           
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                }
                }
            else{ out.println("<script>alert('YOU Are NOT Allowed To Access this Page');document.location.href='index.jsp';</script>");}}
        %>
    </body>
</html>
