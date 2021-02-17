/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dao;

import anhhy.dto.UserDTO;
import anhhy.utils.DBUtility;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author AnhHY
 */
public class UserDAO {
    private Connection conn = null;
    private PreparedStatement prStm = null;
    private ResultSet rs = null;

    public UserDTO checkLogin(String username, String password) throws ClassNotFoundException, SQLException, NamingException {
        UserDTO result = null;
        try {

            conn = DBUtility.getConnection();
            String sql = "SELECT u.Id, UserId, Password, FullName, Phone, Email , r.RoleName"
                    + " FROM Users u JOIN Role r ON u.RoleId = r.Id"
                    + " Where u.UserId = ? AND u.Password = ?"
                    + " AND u.IsActive = 1 And r.IsActive = 1;";
            prStm = conn.prepareStatement(sql);
            prStm.setString(1, username);
            prStm.setString(2, password);

            rs = prStm.executeQuery();
            if (rs.next()) {
                result = new UserDTO(rs.getInt("Id"), rs.getString("UserId"), rs.getString("Password"),
                        rs.getString("FullName"), rs.getString("Phone"), rs.getString("Email"), rs.getString("RoleName"));
            }
        } finally {
            DBUtility.closeConnection(conn, prStm, rs);
        }
        return result;
    }
}
