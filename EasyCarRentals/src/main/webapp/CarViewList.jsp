<%@page import="CarMgmtEntities.Car"%>
<%@page import="java.util.List"%>
<%@page import="CarMgmtDao.CarImplement"%>
<%@page import="CarMgmtDao.CarInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car List</title>
<link href="Css/style.css" type="text/css" rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f2f5;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 1000px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 12px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	color: #333;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #e0e7ff;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.button:hover {
	background-color: #45a049;
}

.back-button-container {
	text-align: center;
	margin-top: 20px;
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
</style>
</head>
<body>
	<div class="container">
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
					<td><%=car.getId()%></td>
					<td><%=car.getMake()%></td>
					<td><%=car.getModel()%></td>
					<td><%=car.getYear()%></td>
					<td><%=car.getPricePerDay()%></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>

		<div class="back-button-container">
			<a href="welcome.jsp" class="button">Back to HomePage</a>
		</div>
	</div>
</body>
</html>
