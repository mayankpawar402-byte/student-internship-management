<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.DatabaseConnection" %>

<%
if (session.getAttribute("studentId") == null) {
    response.sendRedirect("login.jsp");
    return;
}

String internshipId = request.getParameter("internshipId");

if (internshipId == null || internshipId.isBlank()) {
    response.sendRedirect("internships.jsp");
    return;
}

String sql = "SELECT * FROM internships WHERE id = ?";

try (
    Connection connection = DatabaseConnection.getConnection();
    PreparedStatement statement = connection.prepareStatement(sql)
) {

    statement.setInt(1, Integer.parseInt(internshipId));

    try (ResultSet rs = statement.executeQuery()) {

        if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Internship</title>

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
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        h1 {
            color: #1e3a8a;
        }

        .company {
            font-weight: bold;
            color: #475569;
        }

        .info {
            line-height: 2;
            margin-top: 20px;
        }

        .apply-button {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 25px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .apply-button:hover {
            background: #1d4ed8;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            color: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="navbar">
    <h2>Student Internship Management System</h2>
</div>

<div class="container">

    <div class="card">

        <h1>
            <%= rs.getString("internship_title") %>
        </h1>

        <p class="company">
            <%= rs.getString("company_name") %>
        </p>

        <p>
            <%= rs.getString("description") %>
        </p>

        <div class="info">

            <strong>Location:</strong>
            <%= rs.getString("location") %>
            <br>

            <strong>Duration:</strong>
            <%= rs.getString("duration") %>
            <br>

            <strong>Stipend:</strong>
            <%= rs.getString("stipend") %>
            <br>

            <strong>Skills Required:</strong>
            <%= rs.getString("skills_required") %>

        </div>

        <form action="apply" method="post">

            <input type="hidden"
                   name="internshipId"
                   value="<%= rs.getInt("id") %>">

            <button type="submit" class="apply-button">
                Confirm Application
            </button>

        </form>

        <a class="back" href="internships.jsp">
            ← Back to Internships
        </a>

    </div>

</div>

</body>
</html>

<%
        } else {
            response.sendRedirect("internships.jsp");
        }
    }

} catch (Exception e) {
    out.println("<h2>Error loading internship</h2>");
    out.println("<p>" + e.getMessage() + "</p>");
}
%>
