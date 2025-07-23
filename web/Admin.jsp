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
        <style>
    h1 {
        text-align: center;
        color: #2c3e50;
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 30px;
        background: linear-gradient(to right, #3498db, #8e44ad);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-transform: uppercase;
        letter-spacing: 1px;
    }
    .logout-wrapper {
        position: absolute;
        top: 20px;
        right: 30px;
    }

    .logout-wrapper input[type="submit"] {
        padding: 8px 16px;
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-wrapper input[type="submit"]:hover {
        background-color: #c0392b;
    }
    
    .book-list {
        display: flex;
        flex-wrap: wrap;
        gap: 16px;
        justify-content: center;
        margin-top: 20px;
    }

    /* Mỗi cuốn sách hiển thị như 1 card */
    .book-card {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 16px;
        width: 240px;
        transition: transform 0.2s ease;
    }

    .book-card:hover {
        transform: scale(1.02);
    }

    .book-card p {
        margin: 8px 0;
        font-size: 14px;
        color: #333;
    }

    .book-card p strong {
        color: #2c3e50;
    }
    
    /* Nhóm nút */
    .button-group {
        display: flex;
        justify-content: space-between;
        gap: 6px;
        margin-top: 10px;
    }

    .button-group form {
        margin: 0;
        flex: 1;
    }

    .button-group button {
        width: 100%;
        padding: 8px;
        border: none;
        border-radius: 6px;
        font-size: 13px;
        font-weight: bold;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .button-group button:first-child {
        background-color: #007bff;
    }

    .button-group button:first-child:hover {
        background-color: #0056b3;
    }

    .button-group button:last-child {
        background-color: #28a745;
    }

    .button-group button:last-child:hover {
        background-color: #1e7e34;
    }
    
    .alert-message {
        max-width: 600px;
        margin: 20px auto;
        padding: 12px 20px;
        background-color: #fff3cd; /* màu vàng nhạt */
        color: #856404; /* màu chữ đậm hơn */
        border: 1px solid #ffeeba;
        border-radius: 6px;
        font-size: 15px;
        font-family: Arial, sans-serif;
        text-align: center;
    }
    
    .Change-profile{
        position: absolute;
        top: 20px;
        left: 30px;
    }
    
    .Change-profile input[type="submit"] {
        padding: 8px 16px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    .logout-wrapper input[type="submit"]:hover {
        background-color: #c0392b;
    }
    /*Menu*/
    .menu-bar {
            background-color: #007bff;
            overflow: hidden;
            display: flex;
            justify-content: center;
        }

        .menu-bar input {
            color: white;
            border: none;
            background: none;
            padding: 14px 20px;
            font-size: 15x;
            font-weight: bold;
            display: block;
        }

        .menu-bar input:hover {
            background-color: white;
            color: black;
            font-weight: bold;
        }
        
    /*Menu*/
    
</style>

    </head>
    
    
    <body>
       
        <% 
            HttpSession s = request.getSession();
            User u = (User) s.getAttribute("ADMINSESSION");
            if(u == null){
                response.sendRedirect("MainController");
            }else{
        %>
        <h1>HELLO: ${sessionScope.ADMINSESSION.name}</h1>
        
        <div class="Change-profile">
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="Change Profile"/>
                <input type="submit" value="Change Profile"/>
            </form>
        </div>
        
        <div class="logout-wrapper">
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>
        </div>
                
        <!-- Menu admin -->
        <div class="menu-bar">
            <form action="ViewBookOverdueController" method="post">
                <input type="submit" value="View Books Overdue"/>
            </form>
            <form action="statisc.page" method="post">
                <input type="submit" value="statisc"/>
            </form>
        </div>
        <!-- Menu admin -->
        <!-- List Book overdue -->
        <div class="book-list">
            <c:forEach var="b" items="${requestScope.bList}">
                <div class="book-card">
                    <p><strong>📖 Title:</strong> ${b.getBooktitle()}</p>
                    <p><strong>✍️ Author:</strong> ${b.getBookauthor()}</p>
                    <div class="button-group">
                        <!-- View Detail -->
                        <form action="MainController" method="post">
                            <input type="hidden" name="action" value="viewbookoverdue" />
                            <input type="hidden" name="userId" value="${b.getUserid()}"/>
                            <input type="hidden" name="id" value="${b.getId()}" />
                            <button type="submit">View Detail</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${not empty requestScope.msg}">
            <div class="alert-message">
                <p>${requestScope.msg}</p>
            </div>
        </c:if>
        <%
            }
        %>
    </body>
</html>
