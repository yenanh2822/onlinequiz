/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.utils;

import java.io.Serializable;
import java.sql.Connection;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * @author AnhHY
 */
public class DBConnection implements Serializable {

    public static Connection makeConnection() throws Exception {
        Context context = new InitialContext();
        Context tomContext = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) tomContext.lookup("DBCon");
        Connection conn = ds.getConnection();
        return conn;
    }

}
