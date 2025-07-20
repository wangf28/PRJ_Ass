<%-- 
    Document   : Register
    Created on : Jul 7, 2025, 1:30:33 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
    }

    h1 {
        text-align: center;
        margin-top: 40px;
        font-size: 32px;
    }

    .form-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding-top: 20px;
    }

    .form-container,
    .back-form,
    .message-box {
        background-color: white;
        padding: 20px 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        width: 320px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }

    .form-container p {
        margin: 10px 0;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .message-box {
        font-size: 14px;
        font-weight: bold;
        text-align: center;
    }

    .message-error {
        background-color: #f8d7da;
        border: 1px solid #dc3545;
        color: #721c24;
    }

    .message-success {
        background-color: #d4edda;
        border: 1px solid #28a745;
        color: #155724;
    }


    
        </style>
    </head>
    <body>
        <h1>Register</h1>
        <div class="form-wrapper">
        <!-- Form đăng ký -->
        <div class="form-container">
            <form action="RegisterController" method="post">
                <p>Name: <input type="text" name="txtname" placeholder="Enter your name"/></p>
                <p>Email: <input type="text" name="txtemail" placeholder="Enter your email"/></p>
                <p>Password: <input type="password" name="txtpassword" placeholder="Enter your password"/></p>
                <p>Confirm password: <input type="password" name="txtconfirmpassword" placeholder="Confirm password"/></p>
                <p><input type="submit" value="Register"/></p>   
            </form>
        </div>

        <!-- Nút Back -->
        <div class="back-form">
            <form accept-charset="utf-8" method="post" action="MainController">
                <input type="hidden" name="action" value="home"/>
                <input type="submit" value="Back"/>
            </form>
        </div>

        <!-- Thông báo lỗi/thành công -->
        <c:if test="${not empty requestScope.error}">
            <div class="message-box message-error">
                ${requestScope.error}
            </div>
        </c:if>

        <c:if test="${not empty requestScope.msg}">
            <div class="message-box message-success">
                ${requestScope.msg}
            </div>
        </c:if>
    </div>

    </body>
</html>
