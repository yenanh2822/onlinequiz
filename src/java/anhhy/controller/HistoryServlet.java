/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.controller;

import anhhy.dao.OrderDAO;
import anhhy.dao.OrderDetailsDAO;
import anhhy.dto.OrderDTO;
import anhhy.dto.OrderDetailDTO;
import anhhy.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
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
public class HistoryServlet extends HttpServlet {

    private final String HISTORY_PAGE = "history.jsp";

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
            String name = request.getParameter("txtNameSearch");
            String txtDate = request.getParameter("txtDate");
//            Date date = null;
            LocalDate date = null;
            if (txtDate != null && !txtDate.isEmpty()) {
            date = LocalDate.parse(txtDate);
//                date = new SimpleDateFormat("yyyy-MM-dd").parse(txtDate);
            }
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
            UserDTO udto = (UserDTO) session.getAttribute("USERS");

            List<OrderDTO> listOrderDTOs = orderDAO.GetOrders(name, date, udto.getId());
            List<OrderDetailDTO> list = new ArrayList<>();
            if (listOrderDTOs != null) {
                for (OrderDTO orderDTO : listOrderDTOs) {
                    list.addAll(orderDetailsDAO.GetOrderDetails(orderDTO.getId()));
                }
            }

            session.setAttribute("HISTORY", listOrderDTOs);
            session.setAttribute("HISTORYDETAIL", list);
        } catch (SQLException ex) {
            log("HistoryServlet_SQLException: " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("HistoryServlet_ClassNotFoundException: " + ex.getMessage());
        } catch (NamingException ex) {
            log("HistoryServlet_NamingException: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(HISTORY_PAGE);
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
