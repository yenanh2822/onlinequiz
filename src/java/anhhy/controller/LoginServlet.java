/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.dao.UserDAO;
import anhhy.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
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
public class LoginServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String ADMIN_SEARCH_SERVLET = "AdminSearchServlet";

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
        HttpSession session = request.getSession();
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            UserDAO userDAO = new UserDAO();
            UserDTO userDTO = userDAO.checkLogin(username, password);
            if (userDTO == null) {
                url = LOGIN_PAGE;
                request.setAttribute("ERROR", true);
            } else {
                if ("Admin".equals(userDTO.getRoleName())) {
                    url = ADMIN_SEARCH_SERVLET;
                } else {
                    url = SEARCH_SERVLET;
                }
                session.setAttribute("USERS", userDTO);
            }

        } catch (SQLException ex) {
            log("LoginServlet_SQLException: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("LoginServlet_ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("LoginServlet_NamingException: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            if (out != null) {
                out.close();
            }
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
