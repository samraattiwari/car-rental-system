<%@page import="CarMgmtEntities.Car"%>
<%@page import="java.util.List"%>
<%@page import="CarMgmtDao.CarImplement"%>
<%@page import="CarMgmtDao.CarInterface"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Luxury Car Rental Indore</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #161748;
            padding: 10px 20px;
            color: #fff;
        }

        .logo img {
            height: 50px;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .contact-info {
            font-size: 14px;
        }

        .container {
            padding: 20px;
            text-align: center;
        }

        .services, .pricing {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .service-card, .pricing-card {
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 30%;
            margin: 10px;
        }

        .service-card h3, .pricing-card h3 {
            font-size: 18px;
            color: #39a0ca;
        }

        .service-card p, .pricing-card p {
            color: #666;
        }

        .btn {
            background-color: #39a0ca;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
            margin-top: 15px;
        }

        .btn:hover {
            background-color: #555;
        }

        footer {
            background-color: #39a0ca;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        /* Table Styles */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table th, table td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #39a0ca;
            color: #fff;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }

        .info-section {
            margin: 40px 40px 40px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        
        .city-list {
            margin-top: 10px;
            font-size: 14px;
        }

    </style>
</head>
<body>

    <header>
        <div class="logo">
           <h1>HIRE</h1>
        </div>
        <nav>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="AddUser.jsp">User</a></li>
                <li><a href="#pricing">Pricing</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="Admin.jsp">Admin</a></li>
                
            </ul>
        </nav>
        <div class="contact-info">
            <p>Call us: +91-9702747577</p>
        </div>
    </header>
    
    <!-- New Content Added Above Table -->
        <section class="info-section">
        
            <h2>Luxury Cars on Rent for Wedding</h2>
            <p><strong>Traditional & Trendy – A Destination Wedding at Indore</strong></p>
            <p>Indore is the city of nawabs and kings, once it was known for only kings and nawabs. The individuals staying in Indore are not less than kings, and they have dreams of a luxury life. Luxury car rental is one of the mediums to fulfill this dream at an affordable price. Hire Cab Tours and Travels provide luxury cars on rent in Indore city for business meetings, airport pick-up and drop, Indore Darshan, and weddings.</p>

            <p><strong>Luxury Car Rental Indore</strong></p>
            <p>Everyone has a dream of a grand wedding, and Hire Cab Tours and Travels helps fulfill every bride and groom's wedding at a very nominal price by providing high-end luxury cars such as BMW, Audi, Mercedes, Range Rover, Fortuner, and many more. We maintain all our cars in the best condition and never keep a car older than three years. For wedding purposes, we also offer hourly rental and special wedding packages with and without decoration.</p>

            <p><strong>Luxury Cars on Rent for Indore Weddings</strong></p>
            <p>Book a luxury car on rent in Indore for your wedding and impress your love and relatives. Our highly skilled staff and well-trained drivers will make your wedding special, memorable, and comfortable. We ensure hygienic cars and local drivers who will pick you up from your location and take you to your destination. So choose your luxury car from our secure website and fulfill your lifetime dream at a very nominal price.</p>
        </section>

        <!-- Luxury Car Rates Table -->
        <section class="info-section">
         <div class="container">
            <h1>Luxury Car Rental Rates</h1>
            <table>
                <thead>
                    <tr>
                        <th>Car Model</th>
                        <th>Luxury Sedan</th>
                        <th>Luxury SUV</th>
                        <th>Luxury Limousine</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Price per Day</td>
                        <td>₹5000</td>
                        <td>₹7000</td>
                        <td>₹10000</td>
                    </tr>
                    <tr>
                        <td>Price per Week</td>
                        <td>₹30000</td>
                        <td>₹42000</td>
                        <td>₹60000</td>
                    </tr>
                    <tr>
                        <td>Price per Month</td>
                        <td>₹100000</td>
                        <td>₹140000</td>
                        <td>₹200000</td>
                    </tr>
                </tbody>
            </table>
            </div>
        </section>
        
        <section class="info-section">
    <div class="container">
        <h1>Available Luxury Cars</h1>
        <%
        CarInterface carDao = new CarImplement();
        List<Car> carList = carDao.getAllCars();
        %>
        <table>
            <thead>
                <tr>
                    <th>Car ID</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Price Per Day</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Car car : carList) {
                %>
                <tr>
                    <td><%= car.getId() %></td>
                    <td>
                        <a href="AddBooking.jsp?carId=<%= car.getId() %>" class="btn">
                            <%= car.getMake() %>
                        </a>
                    </td>
                    <td>
                        <a href="AddBooking.jsp?carId=<%= car.getId() %>" class="btn">
                            <%= car.getModel() %>
                        </a>
                    </td>
                    <td><%= car.getYear() %></td>
                    <td><%= car.getPricePerDay() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</section>
        

    <div class="container">

        <section id="pricing" class="pricing">
            <div class="pricing-card">
                <h3>Luxury Sedan</h3>
                <p>₹5000/day</p>
                <a href="AddBooking.jsp" class="btn">Book Now</a>
            </div>
            <div class="pricing-card">
                <h3>Luxury SUV</h3>
                <p>₹7000/day</p>
                <a href="AddBooking.jsp" class="btn">Book Now</a>
            </div>
            <div class="pricing-card">
                <h3>Luxury Limousine</h3>
                <p>₹10000/day</p>
                <a href="AddBooking.jsp" class="btn">Book Now</a>
            </div>
        </section>

        

        <!-- Additional Information below the table -->
        <section class="info-section">
            <h2>Taxi Service Available in Indore</h2>
            <p>Indore Darshan Cab | Luxury Car Rental Indore | Bus on Rent in Indore | Indore Outstation Cabs | Indore Car Rental</p>
            <p><strong>Luxury Car Rental in Other Cities</strong></p>
            <p>New Delhi | Bangalore | Pune | Jaipur | Lucknow | Kolkata | Indore | Mumbai | Varanasi | Bhopal | Nagpur | Hyderabad | Chennai | Ahmedabad | Prayagraj | Goa</p>
        </section>

    </div>

    

</body>
</html>
    