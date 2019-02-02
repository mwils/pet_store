<?php
require_once('../database/MysqlConnection.class.php');

// Model Parent class, all model classes should extend me
// TODO, handle logging and error handling 

class Model {
  protected $table;
  private $pdo;

  public function __construct ($table) {
    $connection = MysqlConnection::getInstance();
    $this->pdo = $connection->pdo;
    $this->table = $table;
  }

  public function query($sql, $untrustedParams = array()){
    $stmt = $this->pdo->prepare($sql);
    $stmt->execute($untrustedParams);
    $result = array();

    while ($row = $stmt->fetch()) {
      array_push($result, $row);
    }
    
    return $result;
  }
}