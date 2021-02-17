/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dao;

import anhhy.dto.CategoryDTO;
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
public class CategoryDAO {
    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    public List<CategoryDTO> getAllCategory() throws ClassNotFoundException, SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();
        try {
            conn = DBUtility.getConnection();
            String sql = "SELECT id, name FROM Category";
            prStm = conn.prepareStatement(sql);
            rs = prStm.executeQuery();
            while (rs.next()) {
                result.add(new CategoryDTO(rs.getInt("id"), rs.getString("name")));
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }
}
