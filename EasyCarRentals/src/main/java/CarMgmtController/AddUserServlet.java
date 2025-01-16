package CarMgmtController;

import java.io.IOException;
import java.sql.SQLException;
import UserMgmtDao.UserImplement;
import CarMgmtEntities.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUser")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);
        System.out.println("Email: " + email);

        User user = new User(username, password, email);

        UserImplement userDao = new UserImplement();

        try {
            int result = userDao.insertUser(user);
            if (result > 0) {
                response.sendRedirect("AddUser.jsp?message=USER ADDED SUCCESSFULLY");
                System.out.println("Success");
            } else {
                response.sendRedirect("AddUser.jsp?message=USER NOT ADDED, TRY AGAIN");
                System.out.println("Failure");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("AddUser.jsp?message=An error occurred, please try again.");
        }
    }
}
