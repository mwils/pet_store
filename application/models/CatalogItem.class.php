<?php

require_once('../models/Model.class.php');

class CatalogItem extends Model {
  function __construct() {
    parent::__construct('catalog_item');
  }

  /**
   * returns sortable fields for catalog items
   */
  public function getSortableFields() {
    return $sortableFields = array('title', 'price');
  }

  /**
   * Gets items from the catalog
   * @param $filterArray {array} - associative array with attribute and value entries for filtering results
   * @param $reverse {boolean} - use descending order?
   * @return array results
   */
  public function getCatalogItems($filterArray = null, $reverse = false) {
    $sortableFields = $this->getSortableFields();
    $unEscapedParams = array();
    
    $sql = "" .
    "SELECT catalog_item.id, catalog_item.title " .
    "FROM catalog_item " .
    "JOIN catalog_item_attribute " .
    "ON catalog_item_attribute.item_id = catalog_item.id " .
    "JOIN attribute " .
    "ON attribute.id = catalog_item_attribute.attribute_name_id ";

    if (!empty($filterArray)) {
      $sql .= "WHERE attribute.name = ? AND catalog_item_attribute.value = ? ";
      array_push($unEscapedParams, $filterArray['attribute'], $filterArray['value']);
    }


    $sql .= "GROUP BY catalog_item.id ";

    if (!empty($filterArray)) {
      $sql .= "ORDER BY catalog_item_attribute.value ";
    } else {
      $sql .= "ORDER BY title ";
    }


    if ($reverse) {
      $sql .= "DESC ";
    }

    $res = $this->query($sql, $unEscapedParams);
    return $res;
  }

  /**
   * Gets catalog item attributes by item id
   * @param $itemId {string}
   * @return {array} results
  */
  public function getItemAttributes($itemId) {
    $sql = "SELECT catalog_item_attribute.value, attribute.name " . 
    "from catalog_item " .
    "JOIN catalog_item_attribute " .
    "ON catalog_item_attribute.item_id = catalog_item.id " .
    "JOIN attribute " .
    "ON attribute.id = catalog_item_attribute.attribute_name_id " . 
    "WHERE catalog_item.id = :id " .
    "GROUP BY attribute.name";
    
    $res = $this->query($sql, array(":id" => $itemId));
    return $res;
  }

  public function isDiscounted($age = 0, $lifespan = 0) {

    // if no age or lifespan set, no discount
    return $age && $lifespan && $age * 2 > $lifespan;
  }
}