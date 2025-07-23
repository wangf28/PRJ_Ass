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
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name="ChangeController", urlPatterns={"/ChangeController"})
public class ChangeController extends HttpServlet {
   
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
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("USERSESSION");
            String name = request.getParameter("txtname");
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String checkpass = request.getParameter("txtconfirmpassword");
           
            if(name.isEmpty()||email.isEmpty()||password.isEmpty()){
                String msg="Please fill all form!!!";
                request.setAttribute("error", msg);
                request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
            }
            User checkemail = UserDAO.getInstance().getUserByEmail(email);
            if(checkemail != null && !user.getEmail().equals(checkemail.getEmail())){
                String msg="Email already exist";
                request.setAttribute("error", msg);
                request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
            }
            if(password.equals(checkpass)){
                int check=UserDAO.getInstance().updateUser(user, name, email, password);
                if(check == 1){
                    String msg="Successfully change profile";
                    request.setAttribute("msg", msg);
                    request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
                    
                }else{
                    String msg="Failed change profile";
                    request.setAttribute("error", msg);
                    request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
                    }
            }else{
                String msg="Password is not match!!!";
                request.setAttribute("error", msg);
                request.getRequestDispatcher("ChangeProfile.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.getMessage();
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
        processRequest(request, response);
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
    //DO NOT DELETE
        HttpSession session = request.getSession();
        if(session.getAttribute("USERSESSION") != null){
            processRequest(request, response);
        }else{
            response.sendRedirect("home.jsp");
        }
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
