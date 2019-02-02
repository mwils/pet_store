<?php

class Conf {
  private $config;

  public function __construct() {
    // TODO would be to validate the ini and throw a meaningful error
    $this->config = parse_ini_file('../../conf.ini', true);
  }

  public function getConfig() {
    return $this->config;
  }
}