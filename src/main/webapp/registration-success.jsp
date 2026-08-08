<%@ page import="com.internship.model.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
</head>

<body>

<h1>Registration Successful!</h1>

<%
    Student student = (Student) request.getAttribute("student");
%>

<h2>Welcome, <%= student.getName() %>!</h2>

<p><strong>Email:</strong> <%= student.getEmail() %></p>
<p><strong>Branch:</strong> <%= student.getBranch() %></p>
<p><strong>College:</strong> <%= student.getCollege() %></p>

<br>

<a href="register.jsp">Register Another Student</a>

</body>
</html>
