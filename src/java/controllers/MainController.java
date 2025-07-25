/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {
   
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
            String url = "LoadController";
            try {
                
                String act = request.getParameter("action");
                if(act == null) act = "home";
                switch (act) {
                    case "home":
                        url = "LoadController";
                        break;
                    case "backuserdashboard":
                        url = "UserDashboard.jsp";
                        break;
                    case "Find":
                        url = "SearchController";
                        break;
                    case "searchbook":
                        url = "SearchBookController";
                        break;
                    case "viewdetail":
                        url = "ViewDetailController";
                        break;
                    case "viewdetailuserpage":
                        url = "ViewDetailForUserController";
                        break;
                    case "borrowbook":
                        url = "BorrowBookController";
                        break;
                    case "borrowbook1":
                        url = "BorrowBookController1";
                        break;
                    case "viewborrowrecord":
                        url = "ViewBorrowRecordController";
                        break;
                    case "Login": 
                        url = "LoginController";
                        break;
                    case "logout": 
                        url = "LogoutController";
                        break;
                    case "Change Profile":
                        url = "ChangeProfile.jsp";
                        break;
                    case "viewbookoverdue":
                        url = "ViewBookOverdueForAdmin";
                        break;
                }
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
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
