<%-- 
    Document   : logout
    Created on : May 28, 2020, 11:54:57 PM
    Author     : Bacel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("type", null);
    response.sendRedirect("index.jsp");
%>