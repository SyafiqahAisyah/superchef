<?php
$servername = "localhost";
$username   = "asaboleh_superchefadmin";
$password   = "7]3uSKwrL3m#";
$dbname     = "asaboleh_superchef";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
