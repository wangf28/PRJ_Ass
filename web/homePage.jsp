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
.actions a {
    text-decoration: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #007bff;
    background-color: white;
    transition: background-color 0.3s, color 0.3s;
}

.actions a:hover {
    background-color: #007bff;
    color: white;
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
                <a href="Login.jsp">Login</a>
                <a href="Register.jsp">Register</a>
                <form action="MainController">
                    <input type="text" name="txtbook" placeholder="Search book" value="${empty param.txtbook ? '' : param.txtbook}"/>
                    <input type="submit" value="Find" name="action"/>
                </form>
            </div>
        </div>
        
                    <div style="display: flex; flex-wrap: wrap; gap: 16px;">
                        <c:forEach var="book" items="${booklist}">
                            <div style="
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 16px;
            width: 220px;
            box-shadow: 2px 2px 6px rgba(0,0,0,0.1);
            background-color: #f9f9f9;
                                 ">
                                <p><strong>Title:</strong> ${book.title}</p>
                                <p><strong>Author:</strong> ${book.author}</p>

                                <div style="margin-top: 12px; display: flex; gap: 8px;">
                                    <form action="MainController" method="get">
                                        <input type="hidden" name="bookId" value="${book.id}" />
                                        <button type="submit" style="
                        padding: 6px 12px;
                        background-color: #007bff;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        " name="action" value="viewdetail">View Detail</button>
                                    </form>

                                    <form action="borrowBook" method="post">
                                        <input type="hidden" name="bookId" value="${book.id}" />
                                        <button type="submit" style="
                        padding: 6px 12px;
                        background-color: #28a745;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                                                ">Borrow</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

        
        <!--khi an tim kiem se hien thi o day-->
        <div style="display: flex; flex-wrap: wrap; gap: 16px; justify-content: center;">
            <c:forEach var="b" items="${blsearch}">
                <div style="
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 16px;
            width: 240px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            transition: transform 0.2s ease;
                     " onmouseover="this.style.transform='scale(1.02)'" onmouseout="this.style.transform='scale(1)'">

                    <p style="margin: 0 0 8px 0;"><strong>📖 Title:</strong> ${b.title}</p>
                    <p style="margin: 0 0 12px 0;"><strong>✍️ Author:</strong> ${b.author}</p>

                    <div style="display: flex; justify-content: space-between; gap: 6px;">
                        <!-- Nút View Detail -->
                        <form action="MainController" method="post" style="margin: 0;">
                            <input type="hidden" name="action" value="viewdetail" />
                            <input type="hidden" name="keysearch" value="${param.txtbook}"/>
                            <input type="hidden" name="bookId" value="${b.id}" />
                            <button type="submit" style="
                        flex: 1;
                        padding: 6px;
                        background-color: #007bff;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        font-size: 13px;
                        cursor: pointer;
                        transition: background-color 0.3s ease;
                                    " onmouseover="this.style.backgroundColor='#0056b3'" onmouseout="this.style.backgroundColor='#007bff'">
                                View Detail
                            </button>
                        </form>

                        <!-- Nút Borrow -->
                        <form action="MainController" method="post" style="margin: 0;">
                            <input type="hidden" name="action" value="borrowBook" />
                            <input type="hidden" name="bookId" value="${b.id}" />
                            <button type="submit" style="
                        flex: 1;
                        padding: 6px;
                        background-color: #28a745;
                        color: white;
                        border: none;
                        border-radius: 4px;
                        font-size: 13px;
                        cursor: pointer;
                        transition: background-color 0.3s ease;
                                    " onmouseover="this.style.backgroundColor='#1e7e34'" onmouseout="this.style.backgroundColor='#28a745'">
                                Borrow
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>


        <c:set var="msg" value="${msg}" />
        <c:if test="${not empty msg}">
            <p style="margin-top: 20px; color: red; font-weight: bold;">${msg}</p>
        </c:if>

        
    </body>
</html>
