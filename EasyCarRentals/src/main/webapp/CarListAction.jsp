<%@page import="CarMgmtEntities.Car"%>
<%@page import="CarMgmtDao.CarInterface"%>
<%@page import="CarMgmtDao.CarImplement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car List</title>
    <link href="Css/style.css" type="text/css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f8fd; /* Light background */
            margin: 0;
            padding: 20px; /* Added padding */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 90%; /* Adjusted width */
            margin: 20px auto; /* Centered with margin */
        }

        table {
            width: 100%; /* Full width of container */
            border: 2px solid #e0e0e0;
            border-collapse: collapse;
            margin-top: 20px; /* Increased margin top */
            background-color: #ffffff; /* White background */
        }

        th, td {
            padding: 15px; /* Adjusted padding */
            text-align: center;
            border: 1px solid #ccc;
        }

        caption {
            margin: 20px auto;
            font-size: 24px;
            font-weight: bold;
            text-decoration: underline;
            color: #333;
        }

        .button {
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            display: inline-block;
            margin-right: 10px; /* Added margin-right for button spacing */
            transition: background-color 0.3s;
        }

        .button:nth-child(1) {
            background-color: #ff3333; /* Red background for delete button */
        }

        .button:nth-child(2) {
            background-color: #4caf50; /* Green background for update button */
        }

        .button:hover {
            opacity: 0.8; /* Reduced opacity on hover for button effect */
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            color: #ffffff; /* White text */
            background-color: #007bff; /* Blue background */
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-link:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: scale(1.05); /* Slightly scale on hover */
        }
    </style>
</head>
<body>
    <div class="container">
        <table>
            <caption>Car List</caption>
            <thead>
                <tr>
                    <th>Car ID</th>
                    <th>Make</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Price Per Day</th>
                    <th>Count</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                CarInterface carDao = new CarImplement();
                List<Car> carList = carDao.getAllCars();
                for (Car car : carList) { %>
                    <tr>
                        <td><%= car.getId() %></td>
                        <td><%= car.getMake() %></td>
                        <td><%= car.getModel() %></td>
                        <td><%= car.getYear() %></td>
                        <td><%= car.getPricePerDay() %></td>
                        <td><%= car.getCount() %></td>
                        <td>
                            <a class="button" href="deleteCar?id=<%= car.getId() %>">Delete</a>
                            <a class="button" href="updateCarForm.jsp?id=<%= car.getId() %>">Update</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <a class="back-link" href="adminDash.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
