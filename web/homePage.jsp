<%-- 
    Document   : homePage
    Created on : Jun 15, 2025, 10:19:20 PM
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
            .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 8px 16px;
    background-color: #f5f5f5; /* tùy ý */
}

h1 {
    margin: 0;
    font-size: 24px;
}

.actions {
    display: flex;
    align-items: center;
    gap: 12px;
}

.actions form {
    display: flex;
    align-items: center;
}

.actions input[type="text"] {
    padding: 4px 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.actions input[type="submit"] {
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    margin-left: 4px;
}

.actions input[type="submit"]:hover {
    background-color: #0056b3;
}
.header h1 a {
    text-decoration: none;
}

        </style>
    </head>
    <body>
        <div class="header">
            <h1><a href="MainController">LIBRARY ONLINE</a></h1>
            <div class="actions">
                <form action="MainController" method="post">
                    <input type="submit" value="Login" name="action"/>
                </form>
                <form action="MainController" method="post">
                    <input type="submit" value="Register" name="action"/>
                </form>
                <form action="MainController">
                    <input type="text" name="txtbook" placeholder="Search book" value="${empty param.txtbook ? '' : param.txtbook}"/>
                    <input type="submit" value="Find" name="action"/>
                </form>
            </div>
        </div>
        
        <div style="display: flex; flex-wrap: wrap; gap: 16px;">
            <c:forEach var="book" items="${booklist}">
                <div style="border: 1px solid #ccc; border-radius: 8px; padding: 16px; width: 200px; box-shadow: 2px 2px 6px rgba(0,0,0,0.1);">
                    <p><strong>Title:</strong> ${book.title}</p>
                    <p><strong>Author:</strong> ${book.author}</p>
                </div>
            </c:forEach>
        </div>
        
        <!--khi an tim kiem se hien thi o day-->
        <c:forEach var="b" items="${blsearch}">
            <div style="border: 1px solid #ccc; border-radius: 8px; padding: 16px; width: 200px; box-shadow: 2px 2px 6px rgba(0,0,0,0.1);">
                <p><strong>Title:</strong> ${b.title}</p>
                <p><strong>Author:</strong> ${b.author}</p>
            </div>
        </c:forEach>
        <c:set var="msg" value="${msg}"/>
        <c:if test="${not empty msg}">
            <p>${msg}</p>
        </c:if>
        
    </body>
</html>
