<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String studentName = (String) session.getAttribute("studentName");
    String studentEmail = (String) session.getAttribute("studentEmail");
    String studentBranch = (String) session.getAttribute("studentBranch");
    String studentCollege = (String) session.getAttribute("studentCollege");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard - SIMS</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
        }

        .navbar {
            background: #1e3a8a;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #dc2626;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .welcome h1 {
            margin-top: 0;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .card h3 {
            margin-top: 0;
        }

        .profile {
            line-height: 1.8;
        }

        .button {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 15px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div class="navbar">
    <h2>Student Internship Management System</h2>

    <a class="logout" href="logout">
        Logout
    </a>
</div>

<div class="container">

    <div class="welcome">

        <h1>
            Welcome, <%= studentName %>! 👋
        </h1>

        <p>
            Welcome to your Student Internship Management dashboard.
        </p>

    </div>

    <div class="cards">

        <div class="card">

            <h3>My Profile</h3>

            <div class="profile">

                <strong>Name:</strong>
                <%= studentName %>
                <br>

                <strong>Email:</strong>
                <%= studentEmail %>
                <br>

                <strong>Branch:</strong>
                <%= studentBranch %>
                <br>

                <strong>College:</strong>
                <%= studentCollege %>

            </div>

        </div>

        <div class="card">

            <h3>Internships</h3>

            <p>
                Explore available internship opportunities.
            </p>

            <a class="button" href="internships.jsp">
                View Internships
            </a>
<a class="button" href="applications.jsp">
    My Applications
</a>

        </div>

        <div class="card">

            <h3>My Applications</h3>

            <p>
                Track the internships you have applied for.
            </p>

            <a class="button" href="#">
                View Applications
            </a>

        </div>

    </div>

</div>

</body>
</html>
