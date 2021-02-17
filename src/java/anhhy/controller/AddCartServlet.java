/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.cart.CartDTO;
import anhhy.cart.CartObj;
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
public class AddCartServlet extends HttpServlet {

    private final String LOGIN_PAGE = "login.jsp";

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
        PrintWriter out = response.getWriter();
        String url = "cart.jsp";
        try {
            HttpSession session = request.getSession();
            Integer productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            Float price = Float.parseFloat(request.getParameter("price"));
            Integer quantity = Integer.parseInt(request.getParameter("quantity"));
            CartObj carts;
            if (session.getAttribute("CARTS") == null) {
                carts = new CartObj();
            } else {
                carts = (CartObj) session.getAttribute("CARTS");
            }
            Boolean inCart = false;
            for (CartDTO cartDTO : carts.getItems()) {
                if (cartDTO.getProductID().equals(productId)) {
                    cartDTO.setCount(cartDTO.getCount() + 1);
                    inCart = true;
                    break;
                }
            }
            if (inCart == false) {
                CartDTO cartDTO = new CartDTO(productId, productName, price, 1, quantity);
                carts.addNewItem(cartDTO);
            }
            session.setAttribute("CARTS", carts);
            request.setAttribute("ADDCARTCOMPLETED", true);
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
