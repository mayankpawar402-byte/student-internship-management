package com.internship.servlet;

import com.example.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/apply")
public class ApplyInternshipServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("studentId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int studentId = (Integer) request.getSession()
                .getAttribute("studentId");

        String internshipIdParam =
                request.getParameter("internshipId");

        if (internshipIdParam == null || internshipIdParam.isBlank()) {
            response.sendRedirect("internships.jsp");
            return;
        }

        int internshipId = Integer.parseInt(internshipIdParam);

        String sql =
                "INSERT INTO applications " +
                "(student_id, internship_id, status) " +
                "VALUES (?, ?, 'Applied')";

        try (Connection connection =
                     DatabaseConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, studentId);
            statement.setInt(2, internshipId);

            statement.executeUpdate();

            response.sendRedirect("applications.jsp");

        } catch (SQLException e) {

            if (e.getErrorCode() == 1062) {
                response.sendRedirect(
                        "applications.jsp?error=already_applied"
                );
            } else {
                throw new ServletException(
                        "Unable to submit application", e
                );
            }
        }
    }
}
