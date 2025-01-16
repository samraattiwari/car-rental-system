package BookingMgmtDao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import CarMgmtEntities.*;
import CarMgmtUtils.*;

public class BookingImp implements BookingInterface {

    Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(utils.DRIVER);
        return DriverManager.getConnection(utils.DB_URL, utils.USERNAME, utils.PASSWORD);
    }

    public void createBookingTable() throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        stmt.executeUpdate(utils.CREATE_BOOKING_TABLE);
        stmt.close();
        con.close();
    }

    public int insertBooking(Booking booking) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.INSERT_BOOKING);
        pStmt.setInt(1, booking.getUserId());
        pStmt.setInt(2, booking.getCarId());
        pStmt.setDate(3, new java.sql.Date(booking.getStartDate().getTime()));
        pStmt.setDate(4, new java.sql.Date(booking.getEndDate().getTime()));
        int result = pStmt.executeUpdate();
        pStmt.close();
        con.close();
        return result;
    }

    public Booking getBooking(int bookingId) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.GET_BOOKING);
        pStmt.setInt(1, bookingId);
        ResultSet rSet = pStmt.executeQuery();

        Booking booking = null;
        if (rSet.next()) {
            booking = new Booking();
            booking.setId(rSet.getInt("id"));
            booking.setUserId(rSet.getInt("user_id"));
            booking.setCarId(rSet.getInt("car_id"));
            booking.setStartDate(rSet.getDate("start_date"));
            booking.setEndDate(rSet.getDate("end_date"));
        }

        rSet.close();
        pStmt.close();
        con.close();
        return booking;
    }

    public List<Booking> getAllBookings() throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rSet = stmt.executeQuery(utils.GET_ALL_BOOKINGS);

        List<Booking> bookings = new ArrayList<>();
        while (rSet.next()) {
            Booking booking = new Booking();
            booking.setId(rSet.getInt("id"));
            booking.setUserId(rSet.getInt("user_id"));
            booking.setCarId(rSet.getInt("car_id"));
            booking.setStartDate(rSet.getDate("start_date"));
            booking.setEndDate(rSet.getDate("end_date"));
            bookings.add(booking);
        }

        rSet.close();
        stmt.close();
        con.close();
        return bookings;
    }

    public int deleteBooking(int bookingId) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pStmt = con.prepareStatement(utils.DELETE_BOOKING);
        pStmt.setInt(1, bookingId);
        int result = pStmt.executeUpdate();
        pStmt.close();
        con.close();
        return result;
    }
}
