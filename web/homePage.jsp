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
.booklist-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 16px;
        margin-top: 20px;
    }

    /* Card từng quyển sách */
    .book-card {
        background-color: #ffffff;
        padding: 16px;
        border: 1px solid #ddd;
        border-radius: 10px;
        width: 240px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.08);
        transition: transform 0.2s ease;
    }

    .book-card:hover {
        transform: scale(1.02);
    }

    .book-card p {
        margin: 6px 0;
        font-size: 14px;
        color: #333;
    }

    .book-card p strong {
        color: #2c3e50;
    }

    /* Nút View Detail */
    .book-card form button {
        padding: 8px 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .book-card form button:hover {
        background-color: #0056b3;
    }
    .search-results {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 16px;
        margin-top: 20px;
    }

    /* Mỗi card sách */
    .book-item {
        background-color: #ffffff;
        border: 1px solid #ddd;
        border-radius: 10px;
        padding: 16px;
        width: 240px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
        transition: transform 0.2s ease;
    }

    .book-item:hover {
        transform: scale(1.02);
    }

    .book-item p {
        margin: 8px 0;
        font-size: 14px;
        color: #333;
    }

    .book-item p strong {
        color: #2c3e50;
    }

    /* Nút View Detail */
    .book-item button {
        padding: 8px 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 13px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .book-item button:hover {
        background-color: #0056b3;
    }

    .book-item form {
        text-align: center;
        margin-top: 10px;
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
        
                    <div class="booklist-container">
                        <c:forEach var="book" items="${booklist}">
                            <div class="book-card">
                                <p><strong>Title:</strong> ${book.title}</p>
                                <p><strong>Author:</strong> ${book.author}</p>

                                <div style="margin-top: 12px; display: flex; gap: 8px;">
                                    <form action="MainController" method="get">
                                        <input type="hidden" name="bookId" value="${book.id}" />
                                        <button type="submit" name="action" value="viewdetail">View Detail</button>
                                    </form>   
                                </div>
                            </div>
                        </c:forEach>
                    </div>


        
                    <!-- khi ấn tìm kiếm sẽ hiển thị ở đây -->
                    <div class="search-results">
                        <c:forEach var="b" items="${blsearch}">
                            <div class="book-item">
                                <p><strong>📖 Title:</strong> ${b.title}</p>
                                <p><strong>✍️ Author:</strong> ${b.author}</p>

                                <div>
                                    <form action="MainController" method="post" style="margin: 0;">
                                        <input type="hidden" name="action" value="viewdetail" />
                                        <input type="hidden" name="keysearch" value="${param.txtbook}"/>
                                        <input type="hidden" name="bookId" value="${b.id}" />
                                        <button type="submit">View Detail</button>
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
