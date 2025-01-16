package CarMgmtController;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import BookingMgmtDao.BookingImp;
import CarMgmtEntities.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddBooking")
public class AddBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        int carId = Integer.parseInt(request.getParameter("carId"));
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = null;
        Date endDate = null;

        try {
            startDate = sdf.parse(startDateStr);
            endDate = sdf.parse(endDateStr);
            System.out.println("Parsed startDate: " + startDate);
            System.out.println("Parsed endDate: " + endDate);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect("AddBooking.jsp?message=Invalid date format.");
            return;
        }

        Booking booking = new Booking(userId, carId, startDate, endDate);

        BookingImp bookingDao = new BookingImp();

        try {
            int result = bookingDao.insertBooking(booking);
            if (result > 0) {
                response.sendRedirect("AddBooking.jsp?message=Booking successful.");
            } else {
                response.sendRedirect("AddBooking.jsp?message=Booking failed, try again.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AddBooking.jsp?message=An error occurred, please try again.");
        }
    }
}
