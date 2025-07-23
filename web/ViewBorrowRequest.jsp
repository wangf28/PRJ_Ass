<%-- 
    Document   : ViewBorrowRequest
    Created on : Jul 23, 2025, 11:19:29 PM
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
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 20px;
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
    }

    table {
        margin: 0 auto;
        border-collapse: collapse;
        width: 80%;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 16px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #2c3e50;
        color: white;
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .msg {
        text-align: center;
        margin-top: 20px;
        color: #e74c3c;
        font-weight: bold;
    }
    .top-right {
        position: absolute;
        top: 20px;
        right: 30px;
    }

    .back-button {
        display: inline-block;
        padding: 8px 16px;
        background-color: #3498db;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        font-size: 14px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #2c80b4;
    }
</style>

    </head>
    <body>
        <h1>Book Borrow Request</h1>
        
        <c:if test="${not empty requestScope.brlist}">
            <div>
                <table>
                    <tr>
                        <th>Book Title</th>
                        <th>Request Date</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach var="br" items="${requestScope.brlist}">
                        <tr>
                            <td>${br.booktitle}</td>
                            <td>${br.request_date}</td>
                            <td>${br.status}</td>
                        </tr>   
                    </c:forEach>
                </table>
            </div>
        </c:if>
        <c:if test="${requestScope.msg != null}">
            ${requestScope.msg}
        </c:if>
        <div class="top-right">
            <a href="UserDashboard.jsp" class="back-button">← Back</a>
        </div>
    </body>
</html>
