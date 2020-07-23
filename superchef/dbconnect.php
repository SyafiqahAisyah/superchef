<?php
$servername = "localhost";
$username   = "asaboleh_superchefadmin";
$password   = "=K8#mCc6mz-V";
$dbname     = "asaboleh_superchef";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>

