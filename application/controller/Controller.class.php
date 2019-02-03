<?php
// Any common controller items here here
// Extend me!
class Controller {
  static function getHeader() {
    $header =  "<!doctype html>";
    $header .= "<html lang='en'>";
    $header .= "<head>";
    $header .= "  <meta charset='utf-8'>";
    $header .= "  <title>Pet Store</title>";
    $header .= "  <link rel='stylesheet' href='/application/css/style.css'>"; 
    $header .= "</head>";
    return $header;
  }

  static function getFooter() {
    $footer = "<script src='/application/js/main.js'></script>" ;
    $footer .=  "</html>";
    return $footer;
  }
}