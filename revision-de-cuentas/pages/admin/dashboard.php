<?php
require_once 'session.php';

if (!isset($_SESSION['usuario_id']) || $_SESSION['rol'] !== 'admin') {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Admin</title>
</head>
<body>
    <h1>Bienvenido, Admin</h1>
    <p>Esta es la página de administración.</p>
    <a href="logout.php">Cerrar sesión</a>
</body>
</html>
