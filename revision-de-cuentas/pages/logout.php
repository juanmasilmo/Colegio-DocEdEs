<?php
// logout.php
session_start();
session_unset();
session_destroy();

// Redirige al login después de cerrar sesión
header("Location: login.php");
exit();
?>
