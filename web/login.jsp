<%-- 
    Document   : login
    Created on : Jul 18, 2025, 8:07:13 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form{
                display:center;
            }
        </style>
    </head>
    <body>
        <div class="form">
            <form>
                <table border="1">
                    <thead>
                        <th scope="row" colspan="2">LOGIN FORM</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <input type="email" name="emailUser" placeholder="example@gmail.com"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <input type="password" name="userPass" placeholder="12345"/>
                            </td>        
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" name="submit"/>
                                <input type="reset" name="clear"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <%
            String error = (String)request.getAttribute("ERROR");
            if(error == null){
                error = "";
            }
        %>
        <%= error %>
        <a href="MainController">Register</a>
    </body>
</html>
