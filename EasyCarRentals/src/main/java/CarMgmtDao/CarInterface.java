package CarMgmtDao;

import java.sql.SQLException;
import java.util.List;

import CarMgmtEntities.*;

public interface CarInterface {

    void createSchema(String schemaName) throws ClassNotFoundException, SQLException;

    void createTable() throws ClassNotFoundException, SQLException;

    int insertCar(Car car) throws ClassNotFoundException, SQLException;

    int updateCar(Car car) throws ClassNotFoundException, SQLException;

    Car getCar(int carId) throws ClassNotFoundException, SQLException;

    List<Car> getAllCars() throws ClassNotFoundException, SQLException;

    int deleteCar(int carId) throws ClassNotFoundException, SQLException;

    int checkCarAvailability(int carId) throws ClassNotFoundException, SQLException;

    int decrementCarCount(int carId) throws ClassNotFoundException, SQLException;

    int incrementCarCount(int carId) throws ClassNotFoundException, SQLException;
}
