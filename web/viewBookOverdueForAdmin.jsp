<%-- 
    Document   : viewBookOverdueForAdmin
    Created on : Jul 24, 2025, 2:04:17 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .title{
                text-align: center; 
                margin-top: 30px;
            }
            
            .card{
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
            }
            button{
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 14px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }
        </style>
    </head>
    <body>
        <h1 class="title">Detail Of Book Overdue</h1>
        <div class="card">
            <p><strong>📖 Tên sách:</strong> ${requestScope.borrowDetail.booktitle}</p>
            <p><strong>✍️ Tác giả:</strong> ${requestScope.borrowDetail.bookauthor}</p>
            <p><strong>🙋‍♂️ Người mượn:</strong> ${requestScope.userDetail.getName()}</p>
            <p><strong>🔢 ID sách:</strong> ${requestScope.borrowDetail.bookid}</p>
            <p><strong>📅 Ngày mượn:</strong> ${requestScope.borrowDetail.borrow_date}</p>
            <p><strong>📅 Hạn trả:</strong> ${requestScope.borrowDetail.due_date}</p>
            <p><strong>📅 Ngày trả:</strong> ${requestScope.borrowDetail.return_date}</p>
            <p><strong>✅ Trạng thái:</strong> ${requestScope.borrowDetail.status}</p>
            <p><strong>🆔 ID phiếu mượn:</strong> ${requestScope.borrowDetail.id}</p>
            <form action="Admin.jsp">
            <button type="submit">
                ⬅ Back
            </button>
            </form>
        </div>
    </body>
</html>
