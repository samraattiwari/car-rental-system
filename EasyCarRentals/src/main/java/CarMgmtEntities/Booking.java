package CarMgmtEntities;

import java.util.Date;

public class Booking {
    private int id;
    private int userId;
    private int carId;
    private Date startDate;
    private Date endDate;

    public Booking() {
        super();
    }

    public Booking(int userId, int carId, Date startDate, Date endDate) {
        super();
        this.userId = userId;
        this.carId = carId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Booking(int id, int userId, int carId, Date startDate, Date endDate) {
        super();
        this.id = id;
        this.userId = userId;
        this.carId = carId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Booking [id=" + id + ", userId=" + userId + ", carId=" + carId + ", startDate=" + startDate
                + ", endDate=" + endDate + "]";
    }
}
