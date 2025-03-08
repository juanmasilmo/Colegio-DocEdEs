<?php
require_once __DIR__ . '/database.php';
require_once __DIR__ . '/functions.php';

class Auth {
    public static function login($username, $password) {
        $pdo = Database::getInstance();
        
        $stmt = $pdo->prepare("SELECT * FROM usuarios WHERE username = ? AND activo = 1");
        $stmt->execute([$username]);
        $user = $stmt->fetch();
        
        if($user && password_verify($password, $user['password'])) {
            // Regenerar ID de sesión para prevenir fijación
            session_regenerate_id(true);
            
            $_SESSION['user'] = [
                'id' => $user['id'],
                'username' => $user['username'],
                'rol_id' => $user['rol_id'],
                'csrf_token' => bin2hex(random_bytes(32))
            ];
            
            return true;
        }
        
        return false;
    }

    public static function checkRole($requiredRole) {
        if(!isset($_SESSION['user']) || $_SESSION['user']['rol_id'] != $requiredRole) {
            return false;
        }
        return true;
    }
    
    public static function logout() {
        $_SESSION = [];
        session_destroy();
    }
}
?>