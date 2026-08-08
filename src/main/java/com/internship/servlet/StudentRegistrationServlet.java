package com.internship.servlet;

import com.internship.model.Student;
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

@WebServlet("/register")
public class StudentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");
        String college = request.getParameter("college");

        // Validate input
        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()
                || branch == null || branch.isBlank()
                || college == null || college.isBlank()) {

            response.sendRedirect("register.jsp?error=Please+fill+all+fields");
            return;
        }

        // Create Student object
        Student student = new Student(
                name,
                email,
                password,
                branch,
                college
        );

        // Insert student into MySQL
        String sql = "INSERT INTO students " +
                "(name, email, password, branch, college) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, student.getName());
            statement.setString(2, student.getEmail());
            statement.setString(3, student.getPassword());
            statement.setString(4, student.getBranch());
            statement.setString(5, student.getCollege());

            statement.executeUpdate();

            // Send student to success page
            request.setAttribute("student", student);

            request.getRequestDispatcher("registration-success.jsp")
                    .forward(request, response);

        } catch (SQLException e) {

            e.printStackTrace();

            // Duplicate email
            if (e.getErrorCode() == 1062) {
                response.sendRedirect(
                        "register.jsp?error=Email+already+registered"
                );
                return;
            }

            response.sendRedirect(
                    "register.jsp?error=Database+error"
            );
        }
    }
}
