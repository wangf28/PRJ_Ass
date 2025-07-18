<%-- 
    Document   : register.jsp
    Created on : Jul 18, 2025, 8:24:08 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="registerForm">
            <form action="RegisterController" method="post">
                <table border="1">
                    <thead>
                        <th scope="row" colspan="2">Register form</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>UserName:</td>
                            <td>
                                <input type="text" name="userName" placeholder="Nguyen Van A" required/>
                            </td>        
                        </tr>
                        <tr>
                            <td>Email:</td>
                            <td>
                                <input type="email" name="userEmail" placeholder="example@gmail.com" required/>
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
    </body>
</html>
