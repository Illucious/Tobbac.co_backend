<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        // return view('welcome_message');
        return "<h1>Welcome to Tabbac.co API</h1>";
    }
}
