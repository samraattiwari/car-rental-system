<%@page import="CarMgmtEntities.Car"%>
<%@page import="CarMgmtDao.CarImplement"%>
<%@page import="CarMgmtDao.CarInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Car</title>
    <link href="Css/style.css" type="text/css" rel="stylesheet">
</head>
<body>
    <%
    int carId = Integer.parseInt(request.getParameter("CarId"));
    CarInterface carDao = new CarImplement();
    Car car = carDao.getCar(carId);
    %>
    <div class="container">
        <h2>Update Car</h2>
        <form action="updateCar" method="post">
            <input type="hidden" name="carId" value="<%= car.getId() %>">
            <label>Make:</label>
            <input type="text" name="make" value="<%= car.getMake() %>"><br>
            <label>Model:</label>
            <input type="text" name="model" value="<%= car.getModel() %>"><br>
            <label>Year:</label>
            <input type="text" name="year" value="<%= car.getYear() %>"><br>
            <label>Price Per Day:</label>
            <input type="text" name="pricePerDay" value="<%= car.getPricePerDay() %>"><br>
            <label>Count:</label>
            <input type="text" name="count" value="<%= car.getCount() %>"><br>
            <button type="submit">Update Car</button>
        </form>
    </div>
</body>
</html>
