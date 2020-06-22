<%@page import="java.sql.*"%>
<%@include file="signup.html"%>
        <link href="MAIN.css" rel="stylesheet" type="text/css"/>
<% 
    String connectionUrl = "jdbc:derby://localhost:1527/";
    String dbName = "covid19";
    String userId = "bacel";
    String pass = "bacel123";
    
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    if(fname!=null){
        connection = DriverManager.getConnection(connectionUrl+dbName, userId, pass);
        statement = connection.createStatement();
        String sql = "select * from users where username = "+"'"+username+"'";
        rs=statement.executeQuery(sql);
        if(rs.next()){
            out.println("<script>alert('Username is already exist'); document.location.href='index.jsp';</script>");
        }
        else
        {
            sql="insert into users(fname,lname,type,username,password) values(?,?,?,?,?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1,fname);
            stmt.setString(2,lname);
            stmt.setString(3,"user");
            stmt.setString(4,username);
            stmt.setString(5,password);
            int i=stmt.executeUpdate();
            out.println(i + " records inserted");
            out.println("<script>alert('New Account have been Created Successfully, you will be redirected to Home Page.'); document.location.href='index.jsp';</script>");
        }
    }
%>