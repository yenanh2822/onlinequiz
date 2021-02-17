/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AnhHY
 */
public class MainController extends HttpServlet {

    private final String LOGIN_Servlet = "LoginServlet";
    private final String LOGOUT_Servlet = "LogoutServlet";
    private final String SEARCH_Servlet = "SearchServlet";
    private final String LOGIN_PAGE = "login.jsp";
    private final String VIEW_CART_PAGE = "cart.jsp";
    private final String ADD_CART_SERVLET = "AddCartServlet";
    private final String DELETE_CART_SERVLET = "DeleteCartServlet";
    private final String UPDATE_CART_SERVLET = "UpdateCartServlet";
    private final String CONFIRM_SERVLET = "ConfirmServlet";
    private final String SEARCH_HISTORY = "HistoryServlet";
    private final String ADMIN_SEARCH_SERVLET = "AdminSearchServlet";
    private final String DELETE_PRODUCT_SERVLET = "DeleteProductServlet";
    private final String UPLOAD_SERVLET = "UploadServlet";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = LOGIN_PAGE;
        try {
            HttpSession session = request.getSession();
            UserDTO udto = (UserDTO) session.getAttribute("USERS");
            String action = request.getParameter("action");

            if (action != null) {
                switch (action) {
                    case "Login":
                        url = LOGIN_Servlet;
                        break;
                    case "logout":
                        url = LOGOUT_Servlet;
                        break;
                    case "Search":
                        url = SEARCH_Servlet;
                        break;
                    case "viewcart":
                        url = udto == null ? LOGIN_PAGE : VIEW_CART_PAGE;
                        break;
                    case "Add to Cart":
                        url = udto == null ? LOGIN_PAGE : ADD_CART_SERVLET;
                        break;
                    case "deleteItemInCart":
                        url = udto == null ? LOGIN_PAGE : DELETE_CART_SERVLET;
                        break;
                    case ">>":
                    case "<<":
                        url = udto == null ? LOGIN_PAGE : UPDATE_CART_SERVLET;
                        break;
                    case "Confirm":
                        url = udto == null ? LOGIN_PAGE : CONFIRM_SERVLET;
                        break;
                    case "Search History":
                        url = udto == null ? LOGIN_PAGE : SEARCH_HISTORY;
                        break;
                    case "admin":
                        url = udto == null ? LOGIN_PAGE : ADMIN_SEARCH_SERVLET;
                        break;
                    case "deleteProduct":
                        url = udto == null ? LOGIN_PAGE : DELETE_PRODUCT_SERVLET;
                        break;
                    case "Update":
                        url = udto == null ? LOGIN_PAGE : UPLOAD_SERVLET;
                        break;
                    default:
                        url = LOGIN_PAGE;
                }
            } else {
                url = SEARCH_Servlet;
            }
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
