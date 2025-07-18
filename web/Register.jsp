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
    }

    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    form {
        background-color: white;
        padding: 24px 32px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
    }

    form p {
        margin-bottom: 16px;
    }

    form input[type="text"],
    form input[type="password"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    form input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .message-box {
    width: 300px;
    margin: 16px auto;
    padding: 12px;
    border-radius: 4px;
    text-align: center;
    font-weight: bold;
}

.message-error {
    background-color: #ffe5e5;
    color: #cc0000;
    border: 1px solid #cc0000;
}

.message-success {
    background-color: #e6ffe6;
    color: #006600;
    border: 1px solid #006600;
}

        </style>
    </head>
    <body>
        <h1>Register</h1>
        <div class="form-container">
            <form action="RegisterController" method="post">
                <p>Name: <input type="text" name="txtname" placeholder="Enter your name"/></p>
                <p>Email: <input type="text" name="txtemail" placeholder="Enter your email"/></p>
                <p>Password: <input type="text" name="txtpassword" placeholder="Enter your password"/></p>
                <p>Confirm password: <input type="text" name="txtconfirmpassword" placeholder="Confirm password"/></p>
                <p><input type="submit" value="Register"/></p>
            </form>
        </div>
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

    </body>
</html>
