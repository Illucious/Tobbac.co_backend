<?php

/**
 * The goal of this file is to allow developers a location
 * where they can overwrite core procedural functions and
 * replace them with their own. This file is loaded during
 * the bootstrap process and is called during the framework's
 * execution.
 *
 * This can be looked at as a `master helper` file that is
 * loaded early on, and may also contain additional functions
 * that you'd like to use throughout your entire application
 *
 * @see: https://codeigniter.com/user_guide/extending/common.html
 */


 // Handle CORS
header("Access-Control-Allow-Origin: *"); // Use specific domain(s) in production
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

// Handle preflight requests (OPTIONS)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200); // Respond OK for preflight requests
    exit();
}