package CarMgmtController;

import CarMgmtDao.CarImplement;
import CarMgmtDao.CarInterface;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteCar")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("id"));
        CarInterface carDao = new CarImplement();
        try {
            carDao.deleteCar(carId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("CarListAction.jsp");
    }
}
