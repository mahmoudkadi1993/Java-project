

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
   
    <body style="background:whitesmoke">
        <div class="topnav">
          <a class="active" href="index.jsp">HOME</a>
          <a href="cases.jsp">Positive Cases Distribution</a>
          <a href="hcenter.jsp">Health Centers</a>
          <a href="qcenter.jsp">Quarantine Centers</a>
          <a href="about.jsp">About</a>
          <a style="float:right;" href="admin.html" id="admin" hidden>Admin</a>
          <a style="float:right;" href="signin.html" id="in" hidden>Login</a>
          <a style="float:right;" href="signup.jsp" id="up" hidden>Sign UP</a>
          <a style="float:right;" href="logout.jsp" id="out">LOG OUT</a>
        </div>
        
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" >
      <div class="carousel-item active" style="height: 800px">
          <img width="100%" height="100%" src="images/2.png" alt="Chania">
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>اغسل  اليدين بانتظام</h1>
            <p>لماذا؟ إن تنظيف يديك بالماء والصابون أو فركهما بمطهر كحولي من شأنه أن يقتل الفيروسات التي قد تكون على يديك.
... </p>
            <p><a class="btn btn-lg btn-primary" href="signup.html" onclick="document.getElementById('id02').style.display='block'"  role="button">سجل في موقعنا</a> </p>
          </div>
        </div>
      </div>
      <div class="carousel-item" style="height: 800px">
         <img width="100%" height="100%"  width="200" height="250" src="images/2.png" alt="Chania">
        <div class="container">
          <div class="carousel-caption">
            <h1>احرص على ممارسات النظافة التنفسية</h1>
            <p>احرص على تغطية الفم والأنف بثني المرفق أو بمنديل ورقي عند السعال أو العطس، ثم تخلص من المنديل الورقي فوراً بإلقائه في سلة مهملات مغلقة ونظف يديك بمطهر كحولي أو بالماء والصابون.</p>
            <p><a class="btn btn-lg btn-primary" href="https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item" style="height: 800px">
      <img width="100%" height="100%" src="images/2.png" alt="Chania">
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>هل توصي المنظمة بإلغاء جميع التجمعات الدولية الحاشدة بسبب مرض فيروس كورونا؟</h1>
            <p>لا. فكل تجمع تجمع جماهيري دولي يختلف عن الآخر، ‏وبالتالي قد تتباين كذلك العوامل التي يتعين مراعاتها ‏عند تحديد ما إذا كان ينبغي إلغاء الحدث أم لا. فأي ‏قرار بتغيير موعد تجمع دولي كان مقرراً من قبل ينبغي ‏أن يستند إلى تقييم دقيق للمخاطر وكيف يمكن إدارة ‏هذه المخاطر، ومستوى تخطيط الحدث. وينبغي أن ‏تُشرَك في هذا التقييم جميع الجهات صاحبة المصلحة ‏في الحدث، لاسيما السلطات الصحية في البلد أو ‏المجتمع المحلي الذي من المقرر أن يُنظّم فيه الحدث</p>
 
          </div>
        </div>
      </div>
    </div>
       <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<div class="row mb-2">
        <%
                        String connectionUrl = "jdbc:derby://localhost:1527/";
                        String dbName = "covid19";
                        String dbuserId = "bacel";
                        String dbpassword = "bacel123";
                        Connection connection = null;
                        Statement statement = null;
                        ResultSet rs = null;
                        connection = DriverManager.getConnection(connectionUrl+dbName, dbuserId, dbpassword);
                        statement=connection.createStatement();
                        String sql1= "select count(*) from cases where status='negative'";
                            ResultSet rs2 = statement.executeQuery(sql1);
                            String nn ="0";
                            if(rs2.next()) nn = rs2.getString(1);
                        sql1= "select count(*) from cases where status='quarantine'";
                            rs2 = statement.executeQuery(sql1);
                            String qn ="0";
                            if(rs2.next()) qn = rs2.getString(1);
                        sql1= "select count(*) from cases where status='positive'";
                            rs2 = statement.executeQuery(sql1);
                            String pn ="0";
                            if(rs2.next()) pn = rs2.getString(1);
                        sql1= "select count(*) from cases where status='dead'";
                            rs2 = statement.executeQuery(sql1);
                            String dn ="0";
                            if(rs2.next()) dn = rs2.getString(1);                      
                      %>
                     
                  
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">NEGATIVE</strong>
          <h1 class="mb-0"><% out.println(nn); %></h1>

        </div>
       <div class="col-auto d-none d-lg-block">
                     <img class="bd-placeholder-img"  width="200" height="250" src="images/NEGATIVE.png" alt="Chania">

        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">POSITIVE</strong>
          <h1 class="mb-0"><% out.println(pn); %></h1>
         
        </div>
       <div class="col-auto d-none d-lg-block">
                     <img class="bd-placeholder-img"  width="200" height="250" src="images/positive.png" alt="Chania">

        </div>
      </div>
    </div>
              <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
            <strong class="d-inline-block mb-2" style="COLOR:ORANGE;">Quarantine</strong>
          <h1 class="mb-0"><% out.println(qn); %></h1>
         
        </div>
        <div class="col-auto d-none d-lg-block">
                     <img class="bd-placeholder-img"  width="200" height="250" src="images/Quarantine.png" alt="Chania">

        </div>
      </div>
    </div>
              <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 ">Dead</strong>
          <h1 class="mb-0"><% out.println(dn); %></h1>
         
        </div>
        <div class="col-auto d-none d-lg-block">
                     <img class="bd-placeholder-img"  width="200" height="250" src="images/DEAD.png" alt="Chania">

        </div>
      </div>
              </div></div>
  
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
             
              <div id="patients" 	style="background: #3598dc;color:white;height:400px">
                   <h1 align="center">Stay Safe, Keep Social Distancing</h1>
                   <p>As we move to the 'new normal' it’s important to understand that even when people appear not to have symptoms of coronavirus (COVID-19), they may still be carrying the virus.  Where you’re meeting people who aren’t from your household, your risk of catching coronavirus can increase depending on the situation.  

The European Centre for Disease Control talks about high risk and low risk contacts with other people.  You should take these risks into account when you are thinking about visiting or gathering with other people, in particular the time limits where you may be at a higher risk of catching COVID-19 when spending time with someone indoors. 

You should also consider the greater risks posed to those who are classed as vulnerable and very vulnerable. 

When meeting people from outside your household, that is, people you don’t currently live with, you should continue to practice good hygiene measures.</p>
              </div>

<div class="row-fluid"  style="background-color:#ffffff;" >
 
    <!----------- Footer ------------>
    <footer class="footer-bs"  width="100%" >
        <div class="row" width="100%">
            <h2>COVID-19 WJD PROJECT</h2>
        	<div class="col-md-3 footer-brand animated fadeInLeft">
            	<h2></h2>
                <p>موقع إلكتروني للمساهمة في حد انتشار فيرو س كورونا المستجد COVID19</p>
                <p>© 2020  All rights reserved</p>
            </div>
        	<div class="col-md-4 footer-nav animated fadeInUp">
            	<h4>Menu</h4>
            	<div class="col-md-6">
                    <ul class="pages">
                     <li>   <a href="cases.jsp">Positive Cases Distribution</a></li>
               <li><a href="hcenter.jsp">Health Centers</a></li>
             <li>  <a href="qcenter.jsp">Quarantine Centers</a></li>
              <li> <a href="about.jsp">About</a></li>
                    </ul>
                </div>
            	
            </div>
        	<div class="col-md-2 footer-social animated fadeInDown">
            	<h4>Follow Us</h4>
            	<ul>
                	<li><a href="https://www.facebook.com/mahmoud.kadi">Facebook</a></li>
                
                </ul>
            </div>

        </div>
    </footer>
    <section style="text-align:center; margin:10px auto;"></section>

</div>
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="bootstrap-4.5.0-dist/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="bootstrap-4.5.0-dist/js/bootstrap.bundle.js"></script>

    </body>
</html>