/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import dao.UserDAO;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="RegisterController", urlPatterns={"/RegisterController"})
public class RegisterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("userName");
        String email=request.getParameter("userEmail");
        String password=request.getParameter("userPass");
        String role ="user";
        String status="active";
        UserDAO userDAO = new UserDAO();
        User user = new User(name, email, password, role, status);
        ArrayList<User> userList = userDAO.getAllUsers();
        for (User x : userList) {
            if(email.equals(x.getEmail())){
                out.println("Email is duplicate !!!");
                return;
            }
        }
        if(name == null || email == null || password == null){
            out.println("Please enter all information");
        }else{
            userDAO.addUser(user);
            out.println("Register successfully");
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    //DO NOT DELETE
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("utf-8");
    //DO NOT DELETE
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    //DO NOT DELETE
        PrintWriter out = response.getWriter();
        response.setCharacterEncoding("utf-8");
        processRequest(request, response);
    //DO NOT DELETE
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
