<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
</head>

<body>

<h1>Student Internship Management System</h1>

<h2>Student Registration</h2>

<form action="register" method="post">

    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Password:</label><br>
    <input type="password" name="password" required><br><br>

    <label>Branch:</label><br>
    <input type="text" name="branch" placeholder="e.g. CSE" required><br><br>

    <label>College:</label><br>
    <input type="text" name="college" required><br><br>

    <button type="submit">Register</button>

</form>

</body>
</html>
