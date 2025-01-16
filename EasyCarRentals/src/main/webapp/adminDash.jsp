<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="Css/style.css" rel="stylesheet" type="text/css">
<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(180deg, #f2f8fd, #ffffff);
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    position: relative; /* Make body relative for absolute positioning */
}

.container {
    text-align: center;
    background-color: #ffffff;
    padding: 50px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border: 1px solid #e0e0e0;
    border-radius: 10px;
    margin: 20px; /* Increased margin */
    flex: 1; /* Fill remaining space */
}

h1 {
    margin-bottom: 40px;
    text-decoration: underline;
    color: #004080; /* Adjusted color */
}

.nav-links {
    display: flex;
    justify-content: space-around;
    gap: 20px; /* Adjusted gap */
}

.nav-links div {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100px; /* Adjusted height */
    background-color: #f2f8fd; /* Light background */
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    position: relative;
    overflow: hidden;
    transition: background-color 0.3s, transform 0.3s;
}

.nav-links div:hover {
    background-color: #007bff; /* Hover background color */
    transform: translateY(-5px);
}

.nav-links div::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(45deg, transparent, #004080, transparent);
    transition: transform 0.5s ease;
    transform: scaleX(0);
    transform-origin: right;
}

.nav-links div:hover::before {
    transform: scaleX(1);
    transform-origin: left;
}

.nav-links a {
    text-decoration: none;
    color: #004080; /* Adjusted link color */
    font-size: 1.2em;
    z-index: 1;
    transition: color 0.3s;
}

.nav-links a:hover {
    color: #fff; /* Hover link color */
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

.back-link:hover {
    background-color: #0056b3; /* Darker blue on hover */
    transform: scale(1.05); /* Slightly scale on hover */
}
</style>
</head>
<body>

<%
String username = (String)session.getAttribute("adminUsername");
if (username == null) {
    response.sendRedirect("Admin.jsp");
} else {
%>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="nav-links">
            <div>
                <a href="CarListAction.jsp">Update Cars</a>
            </div>
            <div>
                <a href="AddCar.jsp">Add Cars</a>
            </div>
      
        </div>
    </div>
    
    <a class="back-link" href="welcome.jsp">Back to HomePage</a>
    
<%
}
%>

</body>
</html>
