<?php
require_once('Controller.class.php');
require_once('../models/Attributes.class.php');
require_once('../models/CatalogItem.class.php');

class HomeController extends Controller {
  public $attributesModel;
  public $catalogModel;
  public function __construct() {
    $this->catalogModel = new CatalogItem();
    $this->attributesModel = new Attributes();
  }

  public function warn() {
    if ($_GET['attribute_name'] || $_GET['attribute_value'] && !$_GET['attribute_name'] && $_GET['attribute_value'] ) {
      return "<p>Please complete the form to view results.</p>";
    }
  }

  public function getAttribute() {
    return $this->attributesModel->getAllAttributes();
  }

  public function getAttributeOptions($id) {
    return $this->attributesModel->getAttributeOptions($id);
  }

  public function getCatalogItems() {
    if ($_GET['attribute_name'] && $_GET['attribute_value']) {
      $filter = array('attribute'=>$_GET['attribute_name'], 'value'=>$_GET['attribute_value']);
    }
    return $this->catalogModel->getCatalogItems($filter, $_GET['reverse']);
  }

  public function getItemAttributes($id) {
    $attributes = $this->catalogModel->getItemAttributes($id);
    $map = array();
    foreach($attributes as $key => $value) {
      $map[$value['name']] = $value['value'];
    }
    
    return $map;
  }

  public function getOrderByOptions() {
    return $this->catalogModel->getSortableFields();
  }

  public function isDiscounted($age, $lifespan) {
    return $this->catalogModel->isDiscounted($age, $lifespan) ? "YES" : "NO";
  }
}