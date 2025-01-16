package BookingMgmtDao;

import java.sql.SQLException;
import java.util.List;
import CarMgmtEntities.*;

public interface BookingInterface {
	
    void createBookingTable() throws ClassNotFoundException, SQLException;
    
    int insertBooking(Booking booking) throws ClassNotFoundException, SQLException;
    
    Booking getBooking(int bookingId) throws ClassNotFoundException, SQLException;
    
    List<Booking> getAllBookings() throws ClassNotFoundException, SQLException;
    
    int deleteBooking(int bookingId) throws ClassNotFoundException, SQLException;
}
