/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dao;

import anhhy.dto.ProductDTO;
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
public class ProductDAO {
    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    public List<ProductDTO> getAllProductAdmin(int currentPage, int next) throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> result = new ArrayList<>();
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT Id,"
                    + "       Name,"
                    + "       Image,"
                    + "       Description,"
                    + "       Price,"
                    + "       Quantity,"
                    + "       IsActive,"
                    + "       CategoryId,"
                    + "       CreatedOn,"
                    + "       UpdatedBy,"
                    + "       UpdatedOn"
                    + " FROM Product"
                    + " ORDER BY UpdatedOn DESC"
                    + " OFFSET ? ROWS FETCH NEXT ? ROW ONLY;";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, (currentPage - 1) * next);
            prStm.setInt(2, next);
            rs = prStm.executeQuery();
            while (rs.next()) {
                ProductDTO dto = new ProductDTO(rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getFloat("Price"),
                        rs.getInt("Quantity"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("CategoryId"),
                        rs.getTimestamp("CreatedOn").toLocalDateTime(),
                        rs.getInt("UpdatedBy"),
                        rs.getTimestamp("UpdatedOn").toLocalDateTime());
                result.add(dto);
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

    public int countProductAdmin() throws SQLException, ClassNotFoundException, NamingException {
        int result = 0;

        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT COUNT(*)"
                    + " FROM Product";
            prStm = conn.prepareStatement(sql);
            rs = prStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

    public List<ProductDTO> searchProduct(int currentPage, int next, String categoryId, String name, String from, String to) throws SQLException, ClassNotFoundException, NamingException {
        List<ProductDTO> result = new ArrayList<>();
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT Id, Name, Image, Description, Price, Quantity, CategoryId, CreatedOn, UpdatedBy, UpdatedOn"
                    + " FROM Product"
                    + " WHERE IsActive = 1 AND Quantity > 0";
            if (categoryId != null && !categoryId.isEmpty()) {
                sql += " AND CategoryId = " + categoryId;
            }
            if (name != null && !name.isEmpty()) {
                sql += " AND Name LIKE '%" + name + "%'";
            }
            if (from != null && !from.isEmpty()) {
                sql += " AND Price >= " + from;
            }
            if (to != null && !to.isEmpty()) {
                sql += " AND Price <= " + to;
            }
            sql += " ORDER BY UpdatedOn DESC"
                    + " OFFSET " + (currentPage - 1) * next
                    + " ROWS FETCH NEXT " + next + " ROW ONLY";
            prStm = conn.prepareStatement(sql);
            rs = prStm.executeQuery();
            while (rs.next()) {
                ProductDTO dto = new ProductDTO(rs.getInt("Id"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Image"),
                        rs.getFloat("Price"),
                        rs.getInt("Quantity"),
                        rs.getInt("CategoryId"),
                        rs.getTimestamp("CreatedOn").toLocalDateTime(),
                        rs.getInt("UpdatedBy"),
                        rs.getTimestamp("UpdatedOn").toLocalDateTime());
                result.add(dto);
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

    public int countProduct(int currentPage, int next, String categoryId, String name, String from, String to) throws SQLException, ClassNotFoundException, NamingException {
        int result = 0;
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT Count(*)"
                    + " FROM Product"
                    + " WHERE IsActive = 1 AND Quantity > 0";
            if (categoryId != null && !categoryId.isEmpty()) {
                sql += " AND CategoryId = " + categoryId;
            }
            if (name != null && !name.isEmpty()) {
                sql += " AND Name LIKE '%" + name + "%'";
            }
            if (from != null && !from.isEmpty()) {
                sql += " AND Price >= " + from;
            }
            if (to != null && !to.isEmpty()) {
                sql += " AND Price <= " + to;
            }
            prStm = conn.prepareStatement(sql);
            rs = prStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }

    public Integer getQuantity(Integer productID) throws SQLException, ClassNotFoundException, NamingException {
        Integer result = 0;
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT quantity FROM Product WHERE id = ?";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, productID);
            rs = prStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("quantity");
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);

        }
        return result;
    }

    public Integer insertProduct(ProductDTO dto, int userId) throws SQLException, ClassNotFoundException, NamingException {
        Integer result = null;
        try {
            conn = DBUtility.getConnection();
            String sql = "INSERT INTO Product(Name, Image, Description, Price, Quantity, IsActive, CategoryId, CreatedOn, UpdatedBy, UpdatedOn)"
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, CURRENT_TIMESTAMP);";
            prStm = conn.prepareStatement(sql);
            prStm.setString(1, dto.getName());
            prStm.setString(2, dto.getImage());
            prStm.setString(3, dto.getDescription());
            prStm.setFloat(4, dto.getPrice());
            prStm.setInt(5, dto.getQuantity());
            prStm.setBoolean(6, true);
            prStm.setInt(7, dto.getCategoryId());
            prStm.setInt(8, userId);
            prStm.executeUpdate();
        } finally {
            if (prStm != null) {
                prStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void deleteProduct(String id, int userId) throws SQLException, ClassNotFoundException, NamingException {
        try {
            conn = DBUtility.getConnection();
            String sql = "UPDATE Product"
                    + " SET IsActive = 0, UpdatedOn = CURRENT_TIMESTAMP, UpdatedBy = " + userId
                    + " WHERE Id = " + id;
            prStm = conn.prepareStatement(sql);
            prStm.executeUpdate();
        } finally {
            if (prStm != null) {
                prStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateProduct(ProductDTO dto, int userId) throws ClassNotFoundException, SQLException, NamingException {
        try {
            conn = DBUtility.getConnection();
            String sql = "UPDATE Product"
                    + " SET Name = ?, ";
            if (dto.getImage() != null && !dto.getImage().equals("")) {
                sql += "Image = '" + dto.getImage() + "', ";
            }
            sql += "Description = ?, Price = ?, "
                    + "Quantity = ?, IsActive = ?, CategoryId = ?, UpdatedBy = ?, UpdatedOn = CURRENT_TIMESTAMP"
                    + " WHERE Id = ?";
            prStm = conn.prepareStatement(sql);
            prStm.setString(1, dto.getName());
            prStm.setString(2, dto.getDescription());
            prStm.setFloat(3, dto.getPrice());
            prStm.setInt(4, dto.getQuantity());
            prStm.setBoolean(5, dto.isIsActive());
            prStm.setInt(6, dto.getCategoryId());
            prStm.setInt(7, userId);
            prStm.setInt(8, dto.getId());
            prStm.executeUpdate();
        } finally {
            if (prStm != null) {
                prStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public void updateQuantity(int id, int minus) throws ClassNotFoundException, SQLException, NamingException {
        try {
            conn = DBUtility.getConnection();
            String sql = "UPDATE Product SET Quantity = Quantity - ? WHERE  Id = ?";
            prStm = conn.prepareStatement(sql);
            prStm.setInt(1, minus);
            prStm.setInt(2, id);
            prStm.executeUpdate();
        } finally {
            if (prStm != null) {
                prStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
