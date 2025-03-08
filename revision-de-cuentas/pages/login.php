<?php
require_once 'session.php';
require_once 'db.php';

// Si el formulario fue enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario = $_POST['usuario'];
    $password = $_POST['password'];

    // Buscar el usuario y su rol
    $sql = "
        SELECT u.id, u.password, r.nombre_rol
        FROM usuarios u
        JOIN roles r ON u.rol_id = r.id
        WHERE u.nombre_usuario = ?
    ";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $usuario);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows === 1) {
        $row = $resultado->fetch_assoc();

        // Verificar la contraseña usando password_verify
        if (password_verify($password, $row['password'])) {
            // Guardar datos en sesión
            $_SESSION['usuario_id'] = $row['id'];
            $_SESSION['rol'] = $row['nombre_rol'];

            // Redirigir según el rol
            if ($row['nombre_rol'] === 'admin') {
                header("Location: admin.php");
                exit();
            } else {
                header("Location: usuario.php");
                exit();
            }
        } else {
            $error = "Contraseña incorrecta.";
        }
    } else {
        $error = "Usuario no encontrado.";
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Página de Login</title>
</head>
<body>
    <h1>Iniciar Sesión</h1>

    <!-- Mostrar error si existe -->
    <?php if (isset($error)) : ?>
        <p style="color:red;"><?php echo $error; ?></p>
    <?php endif; ?>

    <!-- Formulario de login -->
    <form method="POST" action="">
        <label for="usuario">Usuario:</label>
        <input type="text" name="usuario" required><br><br>

        <label for="password">Contraseña:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit">Iniciar Sesión</button>
    </form>

    <!-- Mensaje de éxito al volver de crear usuario -->
    <?php if (isset($_GET['success'])) : ?>
        <p style="color:green;">Usuario creado correctamente. ¡Ahora inicia sesión!</p>
    <?php endif; ?>

    <hr>

    <!-- Botón para crear un nuevo usuario -->
    <a href="crear_usuario.php">Crear nuevo usuario</a>
</body>
</html>
