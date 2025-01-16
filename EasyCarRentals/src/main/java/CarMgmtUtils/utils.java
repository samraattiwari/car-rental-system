package CarMgmtUtils;

public class utils {

    public final static String DRIVER = "com.mysql.cj.jdbc.Driver";

    public final static String DB_BASE = "jdbc:mysql://localhost:3306";
    public final static String DB_URL = "jdbc:mysql://localhost:3306/EasyCarRentalDB";
    public final static String USERNAME = "root";
    public final static String PASSWORD = "1234";

    public final static String CREATE_SCHEMA = "CREATE DATABASE EasyCarRentalDB";

    // User table creation
    public final static String CREATE_USER_TABLE = "CREATE TABLE users (\r\n"
            + "    id INT AUTO_INCREMENT PRIMARY KEY,\r\n"
            + "    username VARCHAR(50) NOT NULL UNIQUE,\r\n"
            + "    password VARCHAR(50) NOT NULL,\r\n"
            + "    email VARCHAR(100) NOT NULL\r\n"
            + ");";

    // Car table creation
    public final static String CREATE_CAR_TABLE = "CREATE TABLE cars (\r\n"
            + "    id INT AUTO_INCREMENT PRIMARY KEY,\r\n"
            + "    make VARCHAR(50) NOT NULL,\r\n"
            + "    model VARCHAR(50) NOT NULL,\r\n"
            + "    year INT NOT NULL,\r\n"
            + "    price_per_day DOUBLE NOT NULL,\r\n"
            + "    count INT NOT NULL DEFAULT 1\r\n"
            + ");";

    // Booking table creation
    public final static String CREATE_BOOKING_TABLE = "CREATE TABLE bookings (\r\n"
            + "    id INT AUTO_INCREMENT PRIMARY KEY,\r\n"
            + "    user_id INT,\r\n"
            + "    car_id INT,\r\n"
            + "    start_date DATE NOT NULL,\r\n"
            + "    end_date DATE NOT NULL,\r\n"
            + "    FOREIGN KEY (user_id) REFERENCES users(id),\r\n"
            + "    FOREIGN KEY (car_id) REFERENCES cars(id)\r\n"
            + ");";

    // User-related queries
    public final static String INSERT_USER = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
    public final static String GET_USER = "SELECT * FROM users WHERE username = ? AND password = ?";
    public final static String GET_ALL_USERS = "SELECT * FROM users";
    public final static String DELETE_USER = "DELETE FROM users WHERE id = ?";

    // Car-related queries
    public final static String INSERT_CAR = "INSERT INTO cars (id, make, model, year, price_per_day, count) VALUES (?, ?, ?, ?, ?, ?)";
    public final static String UPDATE_CAR = "UPDATE cars SET make = ?, model = ?, year = ?, price_per_day = ?, count = ? WHERE id = ?";
    public final static String GET_CAR = "SELECT * FROM cars WHERE id = ?";
    public final static String GET_ALL_CARS = "SELECT * FROM cars";
    public final static String DELETE_CAR = "DELETE FROM cars WHERE id = ?";
    public final static String CHECK_CAR_AVAILABILITY = "SELECT count FROM cars WHERE id = ?";
    public final static String DECREMENT_CAR_COUNT = "UPDATE cars SET count = count - 1 WHERE id = ? AND count > 0";
    public final static String INCREMENT_CAR_COUNT = "UPDATE cars SET count = count + 1 WHERE id = ?";

    // Booking-related queries
    public static final String INSERT_BOOKING = "INSERT INTO bookings (user_id, car_id, start_date, end_date) VALUES (?, ?, ?, ?)";
    public final static String GET_BOOKING = "SELECT * FROM bookings WHERE id = ?";
    public final static String GET_ALL_BOOKINGS = "SELECT * FROM bookings";
    public final static String DELETE_BOOKING = "DELETE FROM bookings WHERE id = ?";
}
