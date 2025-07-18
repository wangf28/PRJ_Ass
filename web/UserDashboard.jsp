<%-- 
    Document   : UserDashboard
    Created on : Jul 19, 2025, 1:48:22 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <% 
            HttpSession s = request.getSession();
            User u = (User) s.getAttribute("USERSESSION");
            if(u == null){
                response.sendRedirect("MainController");
            }else{
        %>
        <h1>HELLO: ${sessionScope.USERSESSION.name}</h1>
        
        
        <%
            }
        %>
    </body>
</html>
