<?php
// Connection class. If other connections are required create an interface
require_once('../models/Conf.class.php');

class MysqlConnection {
  private static $connection = null;
  public $pdo;

  public function __construct () {
    $conf = new Conf();
    $config = $conf->getConfig();
    
    try {
      $this->pdo = new PDO("mysql:host={$config['MYSQL_host']};dbname={$config['MYSQL_DB_NAME']}", $config['MYSQL_USER_NAME'], $config['MYSQL_PASSWORD']);
      $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $ex) {
      die('Could not connect to database');
    }
  }

  public static function getInstance() {
    // Use a singleton connection
    if (self::$connection == null) {
      self::$connection = new MysqlConnection();
    }
    return self::$connection;
  }
}
