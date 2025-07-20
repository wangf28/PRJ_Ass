<%-- 
    Document   : Login
    Created on : Jul 7, 2025, 1:28:05 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    h1 {
        text-align: center;
        margin-top: 40px;
        font-size: 32px;
    }

    .login-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding-top: 20px;
    }

    .login-form,
    .back-form,
    .message-box {
        background-color: white;
        padding: 20px 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 320px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    .login-form p,
    .back-form p {
        margin: 10px 0;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .message-box {
        font-size: 14px;
        font-weight: bold;
        text-align: center;
    }

    .message-success {
        
        border: 1px solid red;
        color: red;
    }
</style>

    </head>
    <body>
        <h1>LOGIN</h1>

<div class="login-wrapper">
    <div class="login-form">
        <form action="MainController" method="post">
            <p>Email: <input type="text" name="txtemail" pattern="^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$" required /></p>
            <p>Password: <input type="password" name="txtpassword" required /></p>
            <p><input type="submit" name="action" value="Login" /></p>
        </form>
    </div>

    <div class="back-form">
        <form accept-charset="utf-8" method="post" action="MainController">
            <input type="hidden" name="action" value="home"/>
            <input type="submit" value="Back"/>
        </form>
    </div>

    <c:if test="${not empty requestScope.msg}">
        <div class="message-box message-success">
            ${requestScope.msg}
        </div>
    </c:if>
</div>

        </div>
    </body>
</html>
