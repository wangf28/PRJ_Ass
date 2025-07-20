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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtemail");
            String pass = request.getParameter("txtpassword");
            
            if(email == null && email.isEmpty() && pass == null && pass.isEmpty()){
                request.setAttribute("msg", "vui long nhap email va mat khau!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }else{
                UserDAO ud = new UserDAO();
                User u = ud.getUserByEmailAndPass(email, pass);
                if(u != null){
                    if(u.getStatus().equals("blocked")){
                        request.setAttribute("msg", "Tai khoan da bi cam");
                        request.getRequestDispatcher("Login.jsp").forward(request, response);
                    }else{
                        HttpSession s = request.getSession();
                        if(u.getRole().equals("user")){
                            s.setAttribute("USERSESSION", u);
                            request.getRequestDispatcher("UserDashboard.jsp").forward(request, response);
                        }else if(u.getRole().equals("admin")){
                            
                        }
                    }
                }else{
                    request.setAttribute("msg", "Sai email hoac mat khau");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                    
                }
                
            }
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
        processRequest(request, response);
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
