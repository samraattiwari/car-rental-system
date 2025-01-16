<%@page import="CarMgmtEntities.Car"%>
<%@page import="CarMgmtDao.CarInterface"%>
<%@page import="CarMgmtDao.CarImplement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Car</title>
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
            max-width: 600px; /* Max width for form */
            margin: 20px auto; /* Centered with margin */
            background-color: #ffffff; /* White background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="number"], input[type="submit"] {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #007bff; /* Blue background */
            color: white; /* White text */
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: scale(1.05); /* Slightly scale on hover */
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
        <%
            int carId = Integer.parseInt(request.getParameter("id"));
            CarInterface carDao = new CarImplement();
            Car car = null;
            try {
                car = carDao.getCar(carId);
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (car != null) {
        %>
        <form action="updateCar" method="post">
            <input type="hidden" name="carId" value="<%= car.getId() %>">

            <label for="make">Make:</label>
            <input type="text" id="make" name="make" value="<%= car.getMake() %>" required>

            <label for="model">Model:</label>
            <input type="text" id="model" name="model" value="<%= car.getModel() %>" required>

            <label for="year">Year:</label>
            <input type="number" id="year" name="year" value="<%= car.getYear() %>" required>

            <label for="pricePerDay">Price Per Day:</label>
            <input type="number" step="0.01" id="pricePerDay" name="pricePerDay" value="<%= car.getPricePerDay() %>" required>

            <label for="count">Count:</label>
            <input type="number" id="count" name="count" value="<%= car.getCount() %>" required>

            <input type="submit" value="Update Car">
        </form>
        <% } else { %>
            <p>Car not found!</p>
        <% } %>

        <a class="back-link" href="CarListAction.jsp">Back to Car List</a>
    </div>
</body>
</html>
