/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.cart.CartDTO;
import anhhy.cart.CartObj;
import anhhy.dao.OrderDAO;
import anhhy.dao.OrderDetailsDAO;
import anhhy.dao.ProductDAO;
import anhhy.dto.OrderDTO;
import anhhy.dto.OrderDetailDTO;
import anhhy.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class ConfirmServlet extends HttpServlet {

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
        String url = "cart.jsp";
        try {
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            String txtPhone = request.getParameter("txtPhone");
            String txtEmail = request.getParameter("txtEmail");
            String txtAddress = request.getParameter("txtAddress");
            String txtNote = request.getParameter("txtNote");
            List<CartDTO> exist = new ArrayList<>();
            List<CartDTO> notExist = new ArrayList<>();
            if (session.getAttribute("CARTS") != null) {
                CartObj carts = (CartObj) session.getAttribute("CARTS");
                for (CartDTO cartDTO : carts.getItems()) {
                    Integer inDB = dao.getQuantity(cartDTO.getProductID());
                    if (inDB >= cartDTO.getCount()) {
                        cartDTO.setQuantity(inDB);
                        exist.add(cartDTO);
                    } else {
                        notExist.add(cartDTO);
                    }
                }
                if (exist.size() > 0) {
                    UserDTO user = (UserDTO) session.getAttribute("USERS");
                    OrderDTO orderDTO = new OrderDTO();
                    List<OrderDetailDTO> orderDetails = new ArrayList<>();
                    orderDTO.setUserId(user.getId());
                    Float total = 0F;
                    for (CartDTO cartDTO : exist) {
                        total += cartDTO.getPrice() * cartDTO.getCount();
                        orderDetails.add(new OrderDetailDTO(cartDTO.getProductID(), cartDTO.getCount()));
                    }
                    orderDTO.setTotal(total);
                    orderDTO.setPhone(txtPhone);
                    orderDTO.setAddress(txtAddress);
                    orderDTO.setEmail(txtEmail);
                    orderDTO.setNotes(txtNote);
                    OrderDAO orderDAO = new OrderDAO();
                    Integer orderId = orderDAO.insertOrder(orderDTO);
                    OrderDetailsDAO orderDetailDAO = new OrderDetailsDAO();
                    ProductDAO productDAO = new ProductDAO();
                    if (orderId != null) {
                        for (OrderDetailDTO orderDetailDTO : orderDetails) {
                            orderDetailDTO.setOrderId(orderId);
                            orderDetailDAO.insertOrderDetail(orderDetailDTO);
                            productDAO.updateQuantity(orderDetailDTO.getProductId(), orderDetailDTO.getQuantity());
                        }
                    }
                    request.setAttribute("COMPLETED", true);
                    session.setAttribute("CARTS", null);
                }
                if (notExist.size() > 0) {
                    carts.setItems(notExist);
                    session.setAttribute("CARTS", carts);
                    request.setAttribute("NOTEXIST", true);
                }
            }
        } catch (SQLException ex) {
            log("ConfirmServlet_SQLException: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("ConfirmServlet_ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("ConfirmServlet_NamingException: " + ex.getMessage());
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
