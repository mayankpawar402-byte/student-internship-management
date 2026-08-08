package com.internship.servlet;

import com.internship.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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

        if (name == null || name.isBlank()
                || email == null || email.isBlank()
                || password == null || password.isBlank()
                || branch == null || branch.isBlank()
                || college == null || college.isBlank()) {

            response.sendRedirect("register.jsp?error=Please+fill+all+fields");
            return;
        }

        Student student = new Student(
                name,
                email,
                password,
                branch,
                college
        );

        request.setAttribute("student", student);

        request.getRequestDispatcher("registration-success.jsp")
                .forward(request, response);
    }
}
