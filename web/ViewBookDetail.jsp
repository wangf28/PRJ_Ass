<%-- 
    Document   : ViewBookDetail
    Created on : Jul 7, 2025, 10:31:39 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center; margin-top: 30px;">Chi tiết sách</h1>

        <div style="
    max-width: 400px;
    margin: 0 auto;
    margin-top: 20px;
    padding: 24px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    font-family: Arial, sans-serif;
    text-align: left;
             ">
            <p><strong>📖 Tên sách:</strong> ${bookdetail.title}</p>
            <p><strong>✍️ Tác giả:</strong> ${bookdetail.author}</p>
            <p><strong>🔢 ISBN:</strong> ${bookdetail.isbn}</p>
            <p><strong>📚 Thể loại:</strong> ${bookdetail.category}</p>
            <p><strong>📅 Năm xuất bản:</strong> ${bookdetail.published_year}</p>
            <p><strong>📦 Tổng số bản:</strong> ${bookdetail.total_copies}</p>
            <p><strong>✅ Bản còn lại:</strong> ${bookdetail.available_copies}</p>




            <c:choose>
                <c:when test="${not empty txtbook}">
                    <!-- Nếu từ search -->
                    <form action="MainController" method="get">
                        <input type="hidden" name="action" value="Find"/>
                        <input type="hidden" name="txtbook" value="${txtbook}"/>
                        <button type="submit" style="
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s ease;
                                " onmouseover="this.style.backgroundColor='#0056b3'" onmouseout="this.style.backgroundColor='#007bff'">
                            ⬅ Quay lại
                        </button>
                    </form>
                </c:when>
                <c:otherwise>
                    <!-- Nếu từ trang chủ -->
                    <form action="MainController" method="get">
                        <input type="hidden" name="action" value="home"/>
                        <button type="submit" style="
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s ease;
                                " onmouseover="this.style.backgroundColor='#0056b3'" onmouseout="this.style.backgroundColor='#007bff'">
                            ⬅ Quay lại
                        </button>
                    </form>
                </c:otherwise>
            </c:choose>

</div>

        
    </body>
</html>
