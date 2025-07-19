<%-- 
    Document   : BookBorrowSlip
    Created on : Jul 19, 2025, 4:14:30 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    /* Container chính */
    .borrow-slip {
        max-width: 500px;
        margin: 50px auto;
        background-color: #ffffff;
        padding: 24px;
        border-radius: 12px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        font-family: 'Segoe UI', sans-serif;
        text-align: left;
    }

    .borrow-slip h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
    }

    .borrow-slip p {
        font-size: 16px;
        margin: 12px 0;
        color: #333;
    }

    .borrow-slip input[type="submit"] {
        display: block;
        margin: 20px auto 0 auto;
        padding: 10px 24px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .borrow-slip input[type="submit"]:hover {
        background-color: #2c80b4;
    }

    .back-form {
        text-align: center;
        margin-top: 30px;
    }

    .back-form input[type="submit"] {
        padding: 10px 20px;
        background-color: #6c757d;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .back-form input[type="submit"]:hover {
        background-color: #5a6268;
    }
</style>

        
    </head>
    <body>
        <c:set var="user" value="${requestScope.user}" />
        <c:set var="book" value="${requestScope.book}"/>

        <div class="borrow-slip">
            <h1>Book borrow slip</h1>
            <p>Borrower's name: ${user.name} </p>
            <p>Book title: ${book.title}</p>
            <p>Author: ${book.author}</p>
            <form action="MainController" method="post">
                <input type="hidden" value="borrowbook1" name="action"/>
                <input type="hidden" name="userid" value="${user.id}"/>
                <input type="hidden" name="bookid" value="${book.id}"/>
                <input type="submit" value="Send"/>
            </form>
        </div>

        <div class="back-form">
            <form action="MainController">
                <input type="hidden" value="backuserdashboard" name="action"/>
                <input type="submit" value="Back"/>
            </form>
        </div>


    </body>
</html>
