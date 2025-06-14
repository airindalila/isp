<?php
session_start();

$host = 'localhost';
$user = 'root';
$pass = ''; // put password if any
$db = 'coursework_db';
$port = 3307; // or 3307 if confirmed in XAMPP

$connection = new mysqli($host, $user, $pass, $db, $port);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
} else {
    echo "✅ Connected successfully!";
}



if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  $email = $_POST['email'];
  $password = md5($_POST['password']);
  $role = $_POST['role'];

  if ($role == 'teacher') {
    $query = "SELECT * FROM Teacher WHERE email='$email' AND password='$password'";
  } else {
    $query = "SELECT * FROM Student WHERE email='$email' AND password='$password'";
  }

  $result = $connection->query($query);
  if ($result->num_rows == 1) {
    $_SESSION['user'] = $result->fetch_assoc();
    $_SESSION['role'] = $role;
    echo "Login successful!";
    // Redirect to dashboard
    // header("Location: dashboard.php");
  } else {
    echo "Invalid login!";
  }
}
?>

<!-- Simple HTML form -->
<form method="POST">
  <label>Email:</label><br>
  <input type="email" name="email" required><br>
  <label>Password:</label><br>
  <input type="password" name="password" required><br>
  <label>Login as:</label><br>
  <select name="role">
    <option value="student">Student</option>
    <option value="teacher">Teacher</option>
  </select><br><br>
  <input type="submit" value="Login">
</form>
