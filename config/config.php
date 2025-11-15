<?php
// config/config.php (Koneksi Database)

// Ganti dengan kredensial database Anda
$host = "localhost";
$user = "root"; 
$pass = ""; 
$db_name = "sp_gangguan_jiwa"; 

$conn = new mysqli($host, $user, $pass, $db_name);

if ($conn->connect_error) {
    // Memberi tahu jika koneksi gagal
    die("Koneksi gagal: " . $conn->connect_error);
}
?>