package CarMgmtDao;

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

public class CarImplement implements CarInterface {

    Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(utils.DRIVER);
        return DriverManager.getConnection(utils.DB_URL, utils.USERNAME, utils.PASSWORD);
    }

    public void createSchema(String schemaName) throws ClassNotFoundException, SQLException {
        Class.forName(utils.DRIVER);

        try (Connection con = DriverManager.getConnection(utils.DB_BASE, utils.USERNAME, utils.PASSWORD);
             Statement stmt = con.createStatement()) {
            int result = stmt.executeUpdate(utils.CREATE_SCHEMA);
            System.out.println("\nSchema creation result: " + result);
        } catch (SQLException e) {
            System.err.println("Error creating schema: " + e.getMessage());
            throw e;
        }
    }

    public void createTable() throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             Statement stmt = con.createStatement()) {
            stmt.executeUpdate(utils.CREATE_CAR_TABLE);
            System.out.println("Car table created successfully.");
        } catch (SQLException e) {
            System.err.println("Error creating car table: " + e.getMessage());
            throw e;
        }
    }

    public int insertCar(Car car) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.INSERT_CAR)) {
            pStmt.setInt(1, car.getId());
            pStmt.setString(2, car.getMake());
            pStmt.setString(3, car.getModel());
            pStmt.setInt(4, car.getYear());
            pStmt.setDouble(5, car.getPricePerDay());
            pStmt.setInt(6, car.getCount());

            int result = pStmt.executeUpdate();
            System.out.println("Insert Car result: " + result);
            return result;
        } catch (SQLException e) {
            System.err.println("Error inserting car: " + e.getMessage());
            throw e;
        }
    }

    public int updateCar(Car car) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.UPDATE_CAR)) {
            pStmt.setString(1, car.getMake());
            pStmt.setString(2, car.getModel());
            pStmt.setInt(3, car.getYear());
            pStmt.setDouble(4, car.getPricePerDay());
            pStmt.setInt(5, car.getCount());
            pStmt.setInt(6, car.getId());

            int result = pStmt.executeUpdate();
            System.out.println("Update Car result: " + result);
            return result;
        } catch (SQLException e) {
            System.err.println("Error updating car: " + e.getMessage());
            throw e;
        }
    }

    public Car getCar(int carId) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.GET_CAR)) {
            pStmt.setInt(1, carId);
            ResultSet rSet = pStmt.executeQuery();

            if (rSet.next()) {
                Car car = new Car();
                car.setId(rSet.getInt("id"));
                car.setMake(rSet.getString("make"));
                car.setModel(rSet.getString("model"));
                car.setYear(rSet.getInt("year"));
                car.setPricePerDay(rSet.getDouble("price_per_day"));
                car.setCount(rSet.getInt("count"));

                System.out.println("Fetched Car: " + car);
                return car;
            } else {
                System.out.println("No car found with ID: " + carId);
                return null;
            }
        } catch (SQLException e) {
            System.err.println("Error fetching car: " + e.getMessage());
            throw e;
        }
    }

    public List<Car> getAllCars() throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             Statement stmt = con.createStatement();
             ResultSet rSet = stmt.executeQuery(utils.GET_ALL_CARS)) {

            List<Car> cars = new ArrayList<>();
            while (rSet.next()) {
                Car car = new Car();
                car.setId(rSet.getInt("id"));
                car.setMake(rSet.getString("make"));
                car.setModel(rSet.getString("model"));
                car.setYear(rSet.getInt("year"));
                car.setPricePerDay(rSet.getDouble("price_per_day"));
                car.setCount(rSet.getInt("count"));

                cars.add(car);
            }

            System.out.println("Fetched Cars: " + cars);
            return cars;
        } catch (SQLException e) {
            System.err.println("Error fetching all cars: " + e.getMessage());
            throw e;
        }
    }

    public int deleteCar(int carId) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.DELETE_CAR)) {
            pStmt.setInt(1, carId);
            int result = pStmt.executeUpdate();
            System.out.println("Delete Car result: " + result);
            return result;
        } catch (SQLException e) {
            System.err.println("Error deleting car: " + e.getMessage());
            throw e;
        }
    }

    public int checkCarAvailability(int carId) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.CHECK_CAR_AVAILABILITY)) {
            pStmt.setInt(1, carId);
            ResultSet rSet = pStmt.executeQuery();

            if (rSet.next()) {
                int count = rSet.getInt("count");
                System.out.println("Car availability for ID " + carId + ": " + count);
                return count;
            } else {
                System.out.println("No car found with ID: " + carId);
                return 0;
            }
        } catch (SQLException e) {
            System.err.println("Error checking car availability: " + e.getMessage());
            throw e;
        }
    }

    public int decrementCarCount(int carId) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.DECREMENT_CAR_COUNT)) {
            pStmt.setInt(1, carId);
            int result = pStmt.executeUpdate();
            System.out.println("Decrement Car Count result: " + result);
            return result;
        } catch (SQLException e) {
            System.err.println("Error decrementing car count: " + e.getMessage());
            throw e;
        }
    }

    public int incrementCarCount(int carId) throws ClassNotFoundException, SQLException {
        try (Connection con = getConnection();
             PreparedStatement pStmt = con.prepareStatement(utils.INCREMENT_CAR_COUNT)) {
            pStmt.setInt(1, carId);
            int result = pStmt.executeUpdate();
            System.out.println("Increment Car Count result: " + result);
            return result;
        } catch (SQLException e) {
            System.err.println("Error incrementing car count: " + e.getMessage());
            throw e;
        }
    }
}
