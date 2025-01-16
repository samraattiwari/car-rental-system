package CarMgmtController;

import java.io.IOException;
import java.sql.SQLException;
import CarMgmtDao.*;
import CarMgmtEntities.Car;
import CarMgmtController.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCar")
public class AddCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String make = request.getParameter("make");
        String model = request.getParameter("model");
        String yearStr = request.getParameter("year");
        String pricePerDayStr = request.getParameter("pricePerDay");
        String countStr = request.getParameter("count");

        System.out.println("Make: " + make);
        System.out.println("Model: " + model);
        System.out.println("Year: " + yearStr);
        System.out.println("Price Per Day: " + pricePerDayStr);
        System.out.println("Count: " + countStr);

        try {
            int year = Integer.parseInt(yearStr);
            double pricePerDay = Double.parseDouble(pricePerDayStr);
            int count = Integer.parseInt(countStr);

            Car car = new Car(make, model, year, pricePerDay, count);
            CarImplement carDao = new CarImplement();

            int result = carDao.insertCar(car);
            if (result > 0) {
                response.sendRedirect("AddCar.jsp?message=CAR ADDED SUCCESSFULLY");
                System.out.println("Success");
            } else {
                response.sendRedirect("AddCar.jsp?message=CAR NOT ADDED, TRY AGAIN");
                System.out.println("Failure");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("AddCar.jsp?message=An error occurred, please try again.");
        } catch (NumberFormatException e) {
            System.err.println("NumberFormatException: " + e.getMessage());
            response.sendRedirect("AddCar.jsp?message=Invalid input, please check your data.");
        }
    }
}

