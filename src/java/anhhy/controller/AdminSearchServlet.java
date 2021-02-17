/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.dao.CategoryDAO;
import anhhy.dao.ProductDAO;
import anhhy.dto.CategoryDTO;
import anhhy.dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
public class AdminSearchServlet extends HttpServlet {

    private final String ADMIN_PAGE = "admin.jsp";

    private final int ITEM_DISPLAY = 20;

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
        HttpSession session = request.getSession();
        try {
            String currentPage = request.getParameter("currentPage");
            int page = 1;
            if (currentPage != null) {
                page = Integer.parseInt(currentPage);
            }
            ProductDAO productDAO = new ProductDAO();
            List<ProductDTO> listProductDTOs = productDAO.getAllProductAdmin(page, ITEM_DISPLAY);
            int count = productDAO.countProductAdmin();
            int maxPage = count / ITEM_DISPLAY;
            if (count % ITEM_DISPLAY > 0) {
                maxPage++;
            }
            CategoryDAO categoryDAO = new CategoryDAO();
            List<CategoryDTO> categoryDTOs = categoryDAO.getAllCategory();

            session.setAttribute("PRODUCT_ADMIN", listProductDTOs);
            session.setAttribute("CATEGORY", categoryDTOs);
            session.setAttribute("MAXPAGE_ADMIN", maxPage);
            request.setAttribute("CURRENTPAGE_ADMIN", page);
        } catch (SQLException ex) {
            log("AdminSearchServlet_SQLException: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("AdminSearchServlet_ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("AdminSearchServlet_NamingException: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(ADMIN_PAGE);
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
