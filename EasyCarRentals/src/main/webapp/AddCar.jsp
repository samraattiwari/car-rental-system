<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert Car</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 900px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}

h1 {
	text-align: center;
	color: #007bff;
}

h2 {
	color: #333;
	border-bottom: 2px solid #007bff;
	padding-bottom: 5px;
}

form {
	display: flex;
	flex-direction: column;
	margin-top: 15px;
}

label {
	margin-top: 10px;
	font-weight: bold;
}

input {
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

button {
	padding: 10px;
	margin-top: 15px;
	border: none;
	border-radius: 5px;
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

input:focus {
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	outline: none;
}

.back-link {
	position: fixed; /* Fixed positioning */
	bottom: 20px; /* 20px from the bottom */
	left: 50%; /* Center horizontally */
	transform: translateX(-50%); /* Adjust for center alignment */
	text-align: center;
	font-size: 18px;
	color: #ffffff; /* White text */
	background-color: #007bff; /* Blue background */
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	transition: background-color 0.3s, transform 0.3s;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Insert Car</h1>
		<h2>Car Details</h2>
		<form action="AddCar" method="get">
			<label for="make">Make:</label> <input type="text" id="make"
				name="make" required> <label for="model">Model:</label> <input
				type="text" id="model" name="model" required> <label
				for="year">Year:</label> <input type="number" id="year" name="year"
				min="1900" max="2099" step="1" required> <label
				for="pricePerDay">Price Per Day:</label> <input type="number"
				id="pricePerDay" name="pricePerDay" step="0.01" required> <label
				for="count">Count:</label> <input type="number" id="count"
				name="count" min="1" required>

			<button type="submit">Submit</button>
		</form>
		<%
		String message = request.getParameter("message");
		if (message != null)
			out.print("<p style='color:green;'>" + message + "</p>");
		%>

		<a class="back-link" href="adminDash.jsp">Back to Dashboard</a>
	</div>
</body>
</html>
