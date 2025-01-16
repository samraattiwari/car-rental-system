package CarMgmtController;

import CarMgmtDao.CarImplement;
import CarMgmtDao.CarInterface;
import CarMgmtEntities.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateCar")
public class UpdateCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int carId = Integer.parseInt(request.getParameter("carId"));
        String make = request.getParameter("make");
        String model = request.getParameter("model");
        int year = Integer.parseInt(request.getParameter("year"));
        double pricePerDay = Double.parseDouble(request.getParameter("pricePerDay"));
        int count = Integer.parseInt(request.getParameter("count"));

        Car car = new Car();
        car.setId(carId);
        car.setMake(make);
        car.setModel(model);
        car.setYear(year);
        car.setPricePerDay(pricePerDay);
        car.setCount(count);

        CarInterface carDao = new CarImplement();
        try {
            carDao.updateCar(car);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("CarListAction.jsp");
    }
}
