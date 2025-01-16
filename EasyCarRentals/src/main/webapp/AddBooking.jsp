<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
	text-align: center;
}

h1 {
	color: #333;
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #555;
}

input[type="number"], input[type="date"] {
	width: calc(100% - 20px);
	padding: 8px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

button:hover {
	background-color: #0056b3;
}

p {
	color: red;
	font-size: 14px;
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
		<h1>Book a Car</h1>
		<form action="AddBooking" method="get">
			<label for="userId">User ID:</label> <input type="number" id="userId"
				name="userId" required> <label for="carId">Car ID:</label> <input
				type="number" id="carId" name="carId" required> <label
				for="startDate">Start Date:</label> <input type="date"
				id="startDate" name="startDate" required> <label
				for="endDate">End Date:</label> <input type="date" id="endDate"
				name="endDate" required>

			<button type="submit">Book Now</button>
		</form>
		<%
		String message = request.getParameter("message");
		if (message != null) {
			out.print("<p>" + message + "</p>");
		}
		%>

		<a class="back-link" href="welcome.jsp">Back to HomePage</a>
	</div>
</body>
</html>
