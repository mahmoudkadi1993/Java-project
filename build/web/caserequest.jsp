<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Patient</title>
                <style type="text/css">
          #map{ width:350px; height:350px; }
        </style>
       
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
                    <div class="signup-form ">
    <form >
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
                    	<div class="row">
				<div class="col-xs-6"><button type="submit" class="btn btn-primary btn-lg" name="addsubmit" >Save</button></div>
                                <div class="col-xs-6"><a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="patientlist.jsp">Show Patient</a></div>
                           
			</div> 

        </div>
                
    </form>
	<div class="hint-text"></div>
</div>
                
                <table border="1px" class="table table-bordered table-dark">
                        <tr>
                            <td>NAME</td>
                            <td>ID Number</td>
                            <td>National Number</td>
                            <td>Phone Number</td>
                            <td>Mobile Number</td>
                            <td>Email</td>
                            <td>Address</td>
                        </tr>
        
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
                        try{ 
                            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
                            statement = connection.createStatement();
                            String sql = "insert into caserequest(cname,idnum,nationalnum,phone,mobile,email,address) values(?,?,?,?,?,?,?)";
                            PreparedStatement stmt = connection.prepareStatement(sql);
                            stmt.setString(1,name);
                            stmt.setInt(2,idnum);
                            stmt.setInt(3,nationalnum);
                            stmt.setInt(4,phone);
                            stmt.setInt(5,mobile);
                            stmt.setString(6,email);
                            stmt.setString(7,address);
                            int i=stmt.executeUpdate();  
                            out.println(i + " records inserted");
                            
                        }
                        catch (Exception e) {
                            e.printStackTrace();
                        }
                }
                String ut=(String)session.getAttribute("type");
                if(ut.equals("admin")){
                    %>
                <%
String sql="select * from caserequest";
Connection cn = DriverManager.getConnection(connectionUrl+dbName, userId, password);;
Statement st=null;
st=cn.createStatement();
ResultSet rs = st.executeQuery(sql);
String delete="";
 delete=request.getParameter("delete");
 out.println(delete);
if(delete!=null){
 out.println(delete);
    int ids=Integer.valueOf(request.getParameter("ids"));
    String sqld="delete from caserequest where id="+ids;
    Statement dst=cn.createStatement();
    int i = dst.executeUpdate(sqld);
    out.println("<script>alert('Deleted Successfully');</script>");
    response.sendRedirect("caserequest.jsp");
}
while(rs.next()){
    %>
    <tr>
        <td><%=rs.getString("cname")%></td>
        <td><%=rs.getInt("idnum")%></td>
        <td><%=rs.getInt("nationalnum")%></td>
        <td><%=rs.getInt("phone")%></td>
        <td><%=rs.getInt("mobile")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("address")%></td>
        <td><a href="addpatient.jsp?name=<%=rs.getString("cname")%>&idnum=<%=rs.getInt("idnum")%>&nationalnum=<%=rs.getInt("nationalnum")%>&phone=<%=rs.getInt("phone")%>&mobile=<%=rs.getInt("mobile")%>&email=<%=rs.getString("email")%>&address=<%=rs.getString("address")%>&status=quarantine&hcid=1&qcid=0">confirm</a></td>
    <form method="get" action="">
        <input type="text" name="delete" value="delete" hidden/>
        <input type="text" name="ids" value="<%=rs.getString("id")%>" hidden/>
        <td><button type="submit">Delete</button>
    </form>
    </tr>

<%}}

                
        %>
        </table>
    </body>
</html>
