<?php
require_once('../database/MysqlConnection.class.php');

// Model Parent class, all model classes should extend me
// For actual production would add logging and potentially caching

class Model {
  protected $table;
  private $pdo;

  public function __construct ($table) {
    $connection = MysqlConnection::getInstance();
    $this->pdo = $connection->pdo;
    $this->table = $table;
  }

  /**
   * returns an array of results from the mysql / pdo query
   * @param {string} sql string
   * @param {array} pdo input params
   */
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