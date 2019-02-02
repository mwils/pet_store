<?php

require_once('../models/Model.class.php');

class Attributes extends Model {
  function __construct() {
    parent::__construct('attribute');
  }

  public function getAllAttributes() {
    $sql = "SELECT name, id from {$this->table} GROUP BY name";

    $res = $this->query($sql);
    return $res;
  }

  public function getAttributeOptions($attributeId) {
    $sql = "SELECT value from catalog_item_attribute where attribute_name_id = :attId GROUP BY value";

    $res = $this->query($sql, array(":attId" => $attributeId));
    return $res;
  }
}