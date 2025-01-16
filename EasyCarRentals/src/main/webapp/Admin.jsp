<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - EasyCar Rentals</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(to right, #f4f4f4, #fff);
        }
        .login-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 320px;
            max-width: 90%;
            border: 1px solid #ddd;
        }
        h2 {
            margin-bottom: 20px;
            color: navy;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: navy;
            box-shadow: 0 0 5px rgba(0, 0, 128, 0.5);
            outline: none;
        }
        input[type="submit"] {
            background-color: navy;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: darkorange;
        }
        @media (max-width: 480px) {
            .login-container {
                width: 95%;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <% 
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p style="color: red; font-size: 14px;"><%= error %></p>
        <% 
            } 
        %>
        <form action="admin" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required aria-label="Enter your username">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required aria-label="Enter your password">
            <input type="submit" value="Login" aria-label="Submit the login form">
        </form>
    </div>
</body>
</html>
