/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dao;

import anhhy.dto.OrderDTO;
import anhhy.utils.DBUtility;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author AnhHY
 */
public class OrderDAO {
    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    public Integer insertOrder(OrderDTO dto) throws SQLException, ClassNotFoundException, NamingException {
        Integer result = null;

        try {
            conn = DBUtility.getConnection();
            String sql = "INSERT INTO Orders(UserId, OderDate, Total, Status, Notes, Phone, Email, Address)"
                    + " OUTPUT inserted.Id"
                    + " VALUES (?, CURRENT_TIMESTAMP, ?, 1, ?, ?, ?, ?)";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, dto.getUserId());
            prStm.setFloat(2, dto.getTotal());
            prStm.setString(3, dto.getNotes());
            prStm.setString(4, dto.getPhone());
            prStm.setString(5, dto.getEmail());
            prStm.setString(6, dto.getAddress());
            rs = prStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("id");
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

    public List<OrderDTO> GetOrders(String name, LocalDate date, int userId) throws SQLException, ClassNotFoundException, NamingException {
        List<OrderDTO> result = new ArrayList<>();
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT Id,"
                    + "       UserId,"
                    + "       OderDate,"
                    + "       Total,"
                    + "       Status,"
                    + "       Notes,"
                    + "       Phone,"
                    + "       Email,"
                    + "       Address"
                    + " FROM Orders"
                    + " WHERE UserId = " + userId;
            if (date != null) {
                sql += "  AND OderDate = ?";
            }
            if (name != null && !name.isEmpty()) {
                sql += "  AND Id IN (SELECT OrderId"
                        + "             FROM OrderDetail"
                        + "                      JOIN Product P on P.Id = OrderDetail.ProductId"
                        + "             WHERE P.Name like '%" + name + "%')";
            }
            sql += " ORDER BY OderDate desc";
            prStm = conn.prepareStatement(sql);
            if (date != null) {
                prStm.setDate(1, Date.valueOf(date));
            }
            rs = prStm.executeQuery();
            while (rs.next()) {
                result.add(new OrderDTO(rs.getInt("Id"), rs.getInt("UserId"),
                        new Date((rs.getTimestamp("OderDate").getTime())), rs.getString("Notes"), rs.getString("Phone"), rs.getString("Email"), rs.getString("Address"),
                        rs.getFloat("Total"), rs.getInt("Status")
                ));
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

}
