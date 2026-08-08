package com.internship.servlet;

import com.example.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.isBlank()
                || password == null || password.isBlank()) {

            response.sendRedirect("login.jsp?error=Please+fill+all+fields");
            return;
        }

        String sql = "SELECT id, name, email, branch, college " +
                     "FROM students " +
                     "WHERE email = ? AND password = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    HttpSession session = request.getSession();

                    session.setAttribute("studentId",
                            resultSet.getInt("id"));

                    session.setAttribute("studentName",
                            resultSet.getString("name"));

                    session.setAttribute("studentEmail",
                            resultSet.getString("email"));

                    session.setAttribute("studentBranch",
                            resultSet.getString("branch"));

                    session.setAttribute("studentCollege",
                            resultSet.getString("college"));

                    response.sendRedirect("dashboard.jsp");

                } else {

                    response.sendRedirect(
                            "login.jsp?error=Invalid+email+or+password"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "login.jsp?error=Database+error"
            );
        }
    }
}
