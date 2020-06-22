<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About</title>
        <script src="bootstrap-4.5.0-dist/js/jquery.slim.min.js" type="text/javascript"></script>
        <script src="bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="bootstrap-4.5.0-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
        <script src="bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap-4.5.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="MAIN.css"/>
    </head>
    <body>
        <div class="topnav">
          <a href="index.jsp">HOME</a>
          <a href="cases.jsp">Positive Cases Distribution</a>
          <a href="hcenter.jsp">Health Centers</a>
          <a href="qcenter.jsp">Quarantine Centers</a>
          <a class="active" href="">About</a><a style="float:right;" href="admin.html" id="admin" hidden>Admin</a>
          <a style="float:right;" href="signin.html" id="in" hidden>Login</a>
          <a style="float:right;" href="signup.html" id="up" hidden>Sign UP</a>
          <a style="float:right;" href="logout.jsp" id="out">LOG OUT</a>
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
    <header class="bg-primary text-center py-5 mb-4">
  <div class="container">
    <h1 class="font-weight-light text-white">Meet the Team</h1>
  </div>
</header>
 
<div class="container">
  <div class="row">
    <!-- Team Member 1 -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-0 shadow">
        <img src="images/me.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
            <h5 class="card-title mb-0"><a href="https://www.facebook.com/mahmoud.kadi">Mahmmoud Kadi</a></h5>
          <div class="card-text text-black-50">Web Developer</div>
           <div class="card-text text-black-40">Mahmoud_ezat_114979</div>
        </div>
      </div>
    </div>
    <!-- Team Member 2 -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-0 shadow">
        <img src="images/basl.jpg" class="card-img-top" alt="...">
        <div class="card-body text-center">
         <h5 class="card-title mb-0"><a href="https://www.facebook.com/prince.beso.35">Bacel dahdouh</a></h5>
          <div class="card-text text-black-50">Web Developer</div>
           <div class="card-text text-black-40">Bacel_111508</div>
        </div>
      </div>
    </div>

    
  </div>


</div>

    </body>
</html>