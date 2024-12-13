<?php
namespace Config;

class Cors {
    public function handleCors() {
        // Get the origin of the request
        $origin = $_SERVER['HTTP_ORIGIN'] ?? '*';

        // Allowed origins (replace with your actual domains)
        $allowedOrigins = [
            'http://localhost:3000',
            'https://your-frontend-domain.com',
            '*' // Use * carefully in production
        ];

        // Check if origin is allowed
        $originAllowed = in_array('*', $allowedOrigins) || 
                         in_array($origin, $allowedOrigins);

        if ($originAllowed) {
            header("Access-Control-Allow-Origin: " . $origin);
            header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE, PATCH");
            header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With, Origin, Accept");
            header("Access-Control-Allow-Credentials: true");
            header("Access-Control-Max-Age: 86400");
        }

        // Handle preflight requests
        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            http_response_code(200);
            exit();
        }
    }
}