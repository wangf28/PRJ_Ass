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
    .search-form {
        text-align: center;
        margin-bottom: 30px;
        margin-top: 20px;
    }

    .search-form input[type="text"] {
        padding: 10px 16px;
        width: 280px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .search-form input[type="text"]:focus {
        border-color: #3498db;
        box-shadow: 0 0 6px rgba(52, 152, 219, 0.4);
        outline: none;
    }

    .search-form input[type="submit"] {
        padding: 10px 20px;
        background-color: #3498db;
        color: white;
        border: none;
        border-radius: 8px;
        font-weight: bold;
        margin-left: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .search-form input[type="submit"]:hover {
        background-color: #2c80b4;
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
    .history-form {
        text-align: center;
        margin-top: 30px;
    }

    .history-form input[type="submit"] {
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

    .history-form input[type="submit"]:hover {
        background-color: #5a6268;
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
</style>

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
        
        <div class="logout-wrapper">
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>
        </div>
                
        <div class="search-form">
            <form action="MainController">
                <input type="hidden" name="action" value="searchbook"/>
                <input type="text" name="txtbook" placeholder="Search book" 
                       value="${empty param.txtbook ? '' : param.txtbook}"/>
                <input type="submit" value="Find"/>
            </form>
        </div>

                       <!-- danh sách sách -->
                       <div class="book-list">
                           <c:forEach var="b" items="${blsearch}">
                               <div class="book-card">
                                   <p><strong>📖 Title:</strong> ${b.title}</p>
                                   <p><strong>✍️ Author:</strong> ${b.author}</p>

                                   <div class="button-group">
                                       <!-- View Detail -->
                                       <form action="MainController" method="post">
                                           <input type="hidden" name="action" value="viewdetailuserpage" />
                                           <input type="hidden" name="keysearch" value="${param.txtbook}"/>
                                           <input type="hidden" name="bookId" value="${b.id}" />
                                           <button type="submit">View Detail</button>
                                       </form>

                                       <!-- Borrow -->
                                       <form action="MainController" method="post">
                                           <input type="hidden" name="action" value="borrowbook" />
                                           <input type="hidden" name="userId" value="${sessionScope.USERSESSION.id}"/>
                                           <input type="hidden" name="bookId" value="${b.id}" />
                                           <button type="submit">Borrow</button>
                                       </form>
                                   </div>
                               </div>
                           </c:forEach>
                       </div>

            
                       <!--form xem lịch sử mượn sách-->
                       <div class="history-form">
                           <form action="MainController" method="post">
                               <input type="hidden" name="action" value="viewborrowrecord"/>
                               <input type="hidden" name="userid" value="${sessionScope.USERSESSION.id}"/>
                               <input type="submit" value="Xem lịch sử mượn sách"/>
                           </form>
                       </div>

            
            
            
            <!--thong bao yeu cau muon sach-->
            <c:if test="${not empty requestScope.thongbao}">
                <div class="alert-message">
                    <p>${requestScope.thongbao}</p>
                </div>
            </c:if>
        <%
            }
        %>
    </body>
</html>
