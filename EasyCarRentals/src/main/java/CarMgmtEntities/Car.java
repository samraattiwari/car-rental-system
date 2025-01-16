package CarMgmtEntities;

public class Car {
	
	private int id;
    private String make;
    private String model;
    private int year;
    private double pricePerDay;
    private int count;
    
	public Car() {
		super();
	}

	public Car(int id, String make, String model, int year, double pricePerDay, int count) {
		super();
		this.id = id;
		this.make = make;
		this.model = model;
		this.year = year;
		this.pricePerDay = pricePerDay;
		this.count = count;
	}
	
	

	public Car(String make, String model, int year, double pricePerDay, int count) {
		super();
		this.make = make;
		this.model = model;
		this.year = year;
		this.pricePerDay = pricePerDay;
		this.count = count;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public double getPricePerDay() {
		return pricePerDay;
	}

	public void setPricePerDay(double pricePerDay) {
		this.pricePerDay = pricePerDay;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", make=" + make + ", model=" + model + ", year=" + year + ", pricePerDay="
				+ pricePerDay + ", count=" + count + "]";
	}
	
	
    
	
	
	

}
