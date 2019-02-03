<?php

require_once('../models/Model.class.php');

class Attributes extends Model {
  function __construct() {
    parent::__construct('attribute');
  }

  /**
   * Get a list of all attributes in database
   */
  public function getAllAttributes() {
    $sql = "SELECT name, id from {$this->table} GROUP BY name";

    $res = $this->query($sql);
    return $res;
  }

  /**
   * Gets a list of values that have been used with a certain attribute
   */
  public function getAttributeOptions($attributeId) {
    $sql = "SELECT value from catalog_item_attribute where attribute_name_id = :attId GROUP BY value";

    $res = $this->query($sql, array(":attId" => $attributeId));
    return $res;
  }
}