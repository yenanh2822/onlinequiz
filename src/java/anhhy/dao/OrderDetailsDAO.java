/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dao;

import anhhy.dto.OrderDetailDTO;
import anhhy.utils.DBUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author AnhHY
 */
public class OrderDetailsDAO {
    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    public void insertOrderDetail(OrderDetailDTO dto) throws SQLException, ClassNotFoundException, NamingException {
        try {
            conn = DBUtility.getConnection();
            String sql = "INSERT INTO OrderDetail(ProductId, OrderId, Quantity) VALUES (?, ?, ?)";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, dto.getProductId());
            prStm.setInt(2, dto.getOrderId());
            prStm.setInt(3, dto.getQuantity());
            prStm.executeUpdate();
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
    }

    public List<OrderDetailDTO> GetOrderDetails(int id) throws SQLException, ClassNotFoundException, NamingException {
        List<OrderDetailDTO> result = new ArrayList<>();
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT o.Id, o.OrderId, p.Name, p.Price, o.Quantity"
                    + " FROM OrderDetail o LEFT JOIN Product P on P.Id = o.ProductId"
                    + " WHERE OrderId = ?";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, id);
            rs = prStm.executeQuery();
            while (rs.next()) {
                result.add(new OrderDetailDTO(rs.getInt("Id"), rs.getInt("Quantity"), rs.getInt("OrderId"), rs.getString("Name"), rs.getFloat("Price")));
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }
}
