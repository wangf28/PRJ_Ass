<%-- 
    Document   : ViewBorrowRecord
    Created on : Jul 20, 2025, 1:11:49 AM
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
        font-family: 'Segoe UI', sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 30px;
        color: #333;
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 16px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #3498db;
        color: white;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e6f7ff;
    }

    td {
        font-size: 14px;
    }

    .empty-message {
        text-align: center;
        font-style: italic;
        color: #999;
        margin-top: 20px;
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
        <h1>Book Borrowing History</h1>
        <div>
            <c:if test="${not empty requestScope.bbrlist}">
                <table>
                    <tr>
                        <th>Book title</th>
                        <th>Book author</th>
                        <th>Borrow date</th>
                        <th>Due date</th>
                        <th>Status</th>
                    </tr>
                    <c:forEach var="bbr" items="${requestScope.bbrlist}">
                        <tr>
                            <td>${bbr.booktitle}</td>
                            <td>${bbr.bookauthor}</td>
                            <td>${bbr.borrow_date}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${bbr.due_date != null}">
                                        ${bbr.due_date}
                                    </c:when>
                                    <c:otherwise>
                                        chua cap nhat
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${bbr.status}</td>
                        </tr>

                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${empty requestScope.bbrlist}">
                <p class="empty-message">${requestScope.msg}</p>
            </c:if>
        </div>
        <div class="top-right">
            <a href="UserDashboard.jsp" class="back-button">← Back</a>
        </div>

    </body>
</html>
