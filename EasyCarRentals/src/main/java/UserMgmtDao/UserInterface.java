package UserMgmtDao;

import java.sql.SQLException;
import java.util.List;
import CarMgmtEntities.*;

public interface UserInterface {
	
    void createUserTable() throws ClassNotFoundException, SQLException;
    
    int insertUser(User user) throws ClassNotFoundException, SQLException;
    
    User getUser(String username, String password) throws ClassNotFoundException, SQLException;
    
    List<User> getAllUsers() throws ClassNotFoundException, SQLException;
    
    int deleteUser(int userId) throws ClassNotFoundException, SQLException;
}
