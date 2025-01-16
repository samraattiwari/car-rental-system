<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add User</title>
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
		<h1>Add User</h1>
		<h2>User Details</h2>
		<form action="AddUser" method="get">
			<label for="username">Username:</label> <input type="text"
				id="username" name="username" required> <label
				for="password">Password:</label> <input type="password"
				id="password" name="password" required> <label for="email">Email:</label>
			<input type="email" id="email" name="email" required>


			<button type="submit">Submit</button>
		</form>
		<%
		String message = request.getParameter("message");
		if (message != null) {
			out.print("<p style='color:red;'>" + message + "</p>");
		}
		%>
		<a class="back-link" href="welcome.jsp">Back to Homepage</a>

	</div>
</body>
</html>
