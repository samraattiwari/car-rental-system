package UserMgmtDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import CarMgmtEntities.*;
import CarMgmtUtils.*;

public class UserImplement implements UserInterface {

    Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(utils.DRIVER);
        return DriverManager.getConnection(utils.DB_URL, utils.USERNAME, utils.PASSWORD);
    }

    public void createUserTable() throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate(utils.CREATE_USER_TABLE);
        stmt.close();
        con.close();
    }

    public int insertUser(User user) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.INSERT_USER);
        pStmt.setString(1, user.getUsername());
        pStmt.setString(2, user.getPassword());
        pStmt.setString(3, user.getEmail());
        int result = pStmt.executeUpdate();
        pStmt.close();
        con.close();
        return result;
    }

    public User getUser(String username, String password) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.GET_USER);
        pStmt.setString(1, username);
        pStmt.setString(2, password);
        ResultSet rSet = pStmt.executeQuery();

        User user = null;
        if (rSet.next()) {
            user = new User();
            user.setId(rSet.getInt("id"));
            user.setUsername(rSet.getString("username"));
            user.setPassword(rSet.getString("password"));
            user.setEmail(rSet.getString("email"));
        }

        rSet.close();
        pStmt.close();
        con.close();
        return user;
    }

    public List<User> getAllUsers() throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rSet = stmt.executeQuery(utils.GET_ALL_USERS);

        List<User> users = new ArrayList<>();
        while (rSet.next()) {
            User user = new User();
            user.setId(rSet.getInt("id"));
            user.setUsername(rSet.getString("username"));
            user.setPassword(rSet.getString("password"));
            user.setEmail(rSet.getString("email"));
            users.add(user);
        }

        rSet.close();
        stmt.close();
        con.close();
        return users;
    }

    public int deleteUser(int userId) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.DELETE_USER);
        pStmt.setInt(1, userId);
        int result = pStmt.executeUpdate();
        pStmt.close();
        con.close();
        return result;
    }
}
