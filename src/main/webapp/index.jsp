<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Internship Management System</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #222;
        }

        header {
            background: #1f4e79;
            color: white;
            padding: 20px 50px;
        }

        header h1 {
            font-size: 28px;
        }

        header p {
            margin-top: 6px;
            opacity: 0.9;
        }

        .container {
            max-width: 1000px;
            margin: 60px auto;
            padding: 20px;
            text-align: center;
        }

        .container h2 {
            font-size: 36px;
            margin-bottom: 15px;
            color: #1f4e79;
        }

        .container > p {
            font-size: 18px;
            color: #555;
            margin-bottom: 40px;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .card {
            background: white;
            width: 300px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .card h3 {
            color: #1f4e79;
            margin-bottom: 12px;
        }

        .card p {
            color: #666;
            margin-bottom: 20px;
        }

        .button {
            display: inline-block;
            padding: 12px 24px;
            background: #1f4e79;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .button:hover {
            background: #163a5c;
        }

        footer {
            margin-top: 80px;
            padding: 20px;
            text-align: center;
            background: #1f4e79;
            color: white;
        }
    </style>
</head>

<body>

<header>
    <h1>Student Internship Management System</h1>
    <p>Manage your internship journey easily</p>
</header>

<div class="container">

    <h2>Welcome to SIMS</h2>

    <p>
        A simple platform for students to discover internships,
        apply for opportunities, and track their applications.
    </p>

    <div class="cards">

        <div class="card">
            <h3>Student Registration</h3>

            <p>
                Create your student account and start your
                internship journey.
            </p>

            <a class="button" href="register.jsp">
                Register
            </a>
        </div>

        <div class="card">
            <h3>Student Login</h3>

            <p>
                Login to your account and manage your
                internship applications.
            </p>

            <a class="button" href="login.jsp">
                Login
            </a>
        </div>

        <div class="card">
            <h3>Internships</h3>

            <p>
                Explore available internship opportunities
                from different companies.
            </p>

            <a class="button" href="internships.jsp">
                View Internships
            </a>
        </div>

    </div>

</div>

<footer>
    Student Internship Management System
</footer>

</body>
</html>
<!-- CI/CD test -->
<!-- Jenkins CI/CD verification -->
