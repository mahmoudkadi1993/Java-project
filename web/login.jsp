<%@page import="java.sql.*"%>
<form action="" method="POST">
    <h1>Login</h1>
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Please Enter your Username" name="username" required>
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Please Enter your Password" name="password" required>
    <a href="index.jsp" class="cancelbtn">Cancel</a>
    <button type="submit">Login</button>
</form>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String er = request.getParameter("error");
    String connectionUrl = "jdbc:derby://localhost:1527/";
    String dbName = "covid19";
    String dbuserId = "bacel";
    String dbpassword = "bacel123";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    try{ 
        connection = DriverManager.getConnection(connectionUrl+dbName, dbuserId, dbpassword);
        statement=connection.createStatement();
        //String sql = "select fname, lname from users where username = '" + username + "' and password = '" + password + "';";
        
       rs = statement.executeQuery("select * from users where username='" + username + "' and password='" + password + "'");
        if (rs.next()) {
            session.setAttribute("userid", rs.getString("id"));
            session.setAttribute("type", rs.getString("type"));
            out.println("First Name: " + rs.getString("fname"));
            out.println("Last Name: " + rs.getString("lname"));
            out.println("<p style='text-align: center' > Welcome: " +rs.getString("fname")+ " </p>" );
            response.sendRedirect("index.jsp");
        } else {
            if(er != null){
                out.println("<script>alert('Login Failed, Username or Password is invaled')</script>");
                out.println("<script>alert("+er+")</script>");
            }
        }

    } catch (Exception e) {
    e.printStackTrace();
    }
%>