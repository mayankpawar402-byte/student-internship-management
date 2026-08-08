<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.DatabaseConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Available Internships - SIMS</title>

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

        .back {
            color: white;
            text-decoration: none;
            background: #475569;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        h1 {
            margin-bottom: 25px;
        }

        .grid {
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

        .card h2 {
            margin-top: 0;
            color: #1e3a8a;
        }

        .company {
            font-weight: bold;
            color: #475569;
        }

        .description {
            line-height: 1.6;
            color: #444;
        }

        .info {
            margin-top: 15px;
            line-height: 1.8;
        }

        .skills {
            margin-top: 15px;
            font-size: 14px;
        }

        .apply {
            display: block;
            text-align: center;
            margin-top: 20px;
            padding: 11px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .apply:hover {
            background: #1d4ed8;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 15px;
            border-radius: 5px;
        }

        @media (max-width: 800px) {
            .grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="navbar">

    <h2>Student Internship Management System</h2>

    <a class="back" href="dashboard.jsp">
        Dashboard
    </a>

</div>

<div class="container">

    <h1>Available Internships</h1>

    <div class="grid">

        <%
            String sql = "SELECT * FROM internships ORDER BY created_at DESC";

            try (Connection connection = DatabaseConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
        %>

        <div class="card">

            <h2>
                <%= resultSet.getString("internship_title") %>
            </h2>

            <div class="company">
                <%= resultSet.getString("company_name") %>
            </div>

            <p class="description">
                <%= resultSet.getString("description") %>
            </p>

            <div class="info">

                <strong>📍 Location:</strong>
                <%= resultSet.getString("location") %>
                <br>

                <strong>⏱ Duration:</strong>
                <%= resultSet.getString("duration") %>
                <br>

                <strong>💰 Stipend:</strong>
                <%= resultSet.getString("stipend") %>

            </div>

            <div class="skills">

                <strong>Skills:</strong>
                <%= resultSet.getString("skills_required") %>

            </div>

            <a class="apply"
               href="apply.jsp?internshipId=<%= resultSet.getInt("id") %>">

                Apply Now

            </a>

        </div>

        <%
                }

            } catch (Exception e) {
        %>

            <div class="error">
                Unable to load internships.
            </div>

        <%
                e.printStackTrace();
            }
        %>

    </div>

</div>

</body>
</html>
