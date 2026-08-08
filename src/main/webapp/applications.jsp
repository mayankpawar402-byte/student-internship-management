<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.DatabaseConnection" %>

<%
if (session.getAttribute("studentId") == null) {
    response.sendRedirect("login.jsp");
    return;
}

int studentId = (Integer) session.getAttribute("studentId");

String sql =
    "SELECT a.id, a.status, a.applied_at, " +
    "i.company_name, i.internship_title, " +
    "i.location, i.duration, i.stipend " +
    "FROM applications a " +
    "JOIN internships i ON a.internship_id = i.id " +
    "WHERE a.student_id = ? " +
    "ORDER BY a.applied_at DESC";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Applications</title>

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
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .status {
            display: inline-block;
            padding: 7px 12px;
            background: #dcfce7;
            color: #166534;
            border-radius: 5px;
            font-weight: bold;
        }

        .back {
            display: inline-block;
            margin-bottom: 25px;
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

    <a class="back" href="dashboard.jsp">
        ← Back to Dashboard
    </a>

    <h1>My Applications</h1>

<%
try (
    Connection connection = DatabaseConnection.getConnection();
    PreparedStatement statement = connection.prepareStatement(sql)
) {

    statement.setInt(1, studentId);

    try (ResultSet rs = statement.executeQuery()) {

        boolean hasApplications = false;

        while (rs.next()) {

            hasApplications = true;
%>

    <div class="card">

        <h2>
            <%= rs.getString("internship_title") %>
        </h2>

        <p>
            <strong>Company:</strong>
            <%= rs.getString("company_name") %>
        </p>

        <p>
            <strong>Location:</strong>
            <%= rs.getString("location") %>
        </p>

        <p>
            <strong>Duration:</strong>
            <%= rs.getString("duration") %>
        </p>

        <p>
            <strong>Stipend:</strong>
            <%= rs.getString("stipend") %>
        </p>

        <p>
            <strong>Applied On:</strong>
            <%= rs.getTimestamp("applied_at") %>
        </p>

        <p>
            <strong>Status:</strong>
            <span class="status">
                <%= rs.getString("status") %>
            </span>
        </p>

    </div>

<%
        }

        if (!hasApplications) {
%>

    <div class="card">
        <h2>No Applications Yet</h2>
        <p>You haven't applied for any internships yet.</p>

        <a href="internships.jsp">
            Browse Internships
        </a>
    </div>

<%
        }
    }

} catch (Exception e) {
%>

    <div class="card">
        <h2>Error</h2>
        <p><%= e.getMessage() %></p>
    </div>

<%
}
%>

</div>

</body>
</html>
