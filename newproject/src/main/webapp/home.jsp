<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("username") == null) {
        response.sendRedirect("index.html");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(45deg, #00bcd4, #ff4081);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #fff;
        }

        .home-container {
            background: rgba(255, 255, 255, 0.9); 
            width: 100%;
            max-width: 600px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
            backdrop-filter: blur(10px); 
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .welcome-message {
            font-size: 24px;
            color: #444;
            margin-bottom: 30px;
            font-weight: 500;
        }

        a {
            display: inline-block;
            padding: 12px 20px;
            background-color: #ff4081;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #00bcd4;
        }
    </style>
</head>
<body>
    <div class="home-container">
        <h2>Welcome, <%= session1.getAttribute("username") %>!</h2>
        <p class="welcome-message">You have successfully logged in.</p>
        <a href="LogoutServlet">Logout</a>
    </div>
</body>
</html>
