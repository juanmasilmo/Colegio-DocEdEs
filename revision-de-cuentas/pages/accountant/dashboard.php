<?php
require_once 'session.php';

if (!isset($_SESSION['usuario_id'])) {
    header("Location: login.php");
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Usuario</title>
</head>
<body>
    <h1>Bienvenido</h1>
    <p>Esta es la página para usuarios.</p>
    <a href="logout.php">Cerrar sesión</a>
</body>
</html>
