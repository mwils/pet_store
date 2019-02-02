<?php

require_once('../controller/HomeController.class.php');

$ctr = new HomeController();

?>

<?=$ctr->getHeader();?>
  <body>
    <header>
      <h1>Pet Store</p>
    </header>
    <main>
      <p>We have a lot of pets available. Please take a look around</p>
      <p>Filter by one of our attributes</p>
      <?=$ctr->warn()?>
      <form>
        <label for="attribute_name">Filter BY: </label>
        <select name="attribute_name">
          <?php foreach ($ctr->getAttribute() as $row): ?>
            <option value=""></option>
            <option value="<?=$row['name'];?>"><?=$row['name'];?></option>
          <?php endforeach ?>
        </select>
        <label for="attribute_value">Filter Value: </label>
        <input list="all_values" name="attribute_value">
        <label for="reverse">Reverse Order</label>
        <input type="checkbox" name="reverse" value="true">

        <!-- provide value hints for users -->
        <!-- TODO dynamically update list based on selected attribute with javascript -->
        <datalist id="all_values">
          <?php foreach ($ctr->getAttribute() as $row): ?>
            <?php foreach ($ctr->getAttributeOptions($row['id']) as $opt): ?>
              <option><?=$opt['value'];?></option>
            <?php endforeach ?>
          <?php endforeach ?>
        </datalist>
        <button type="submit" action="application/view/index.php">FIND MY PET</button>
      </form>
      <div class="petList">
        <?php foreach ($ctr->getCatalogItems() as $item): 
          $itemAttributes = $ctr->getItemAttributes($item['id']);
        ?>
          <div class="petItem">
            <h4>
              <?=$item['title']?>
            </h4>
            <section class="itemDetails">
              <p>
                PRICE: $ <?=$itemAttributes['price'];?>
              <p>
                age: $ <?=$itemAttributes['age'];?>
              </p>
              <p>
                life: $ <?=$itemAttributes['lifespan'];?>
              </p>
              <p>
                DISCOUNT: <?=$ctr->isDiscounted($itemAttributes['age'], $itemAttributes['lifespan'])?>
              </p>
            </section>
          </div>
        <?php endforeach ?>
      </div>
    </main>
  </body>
<?=$ctr->getFooter();?>
