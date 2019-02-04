<?php

require_once('../controller/HomeController.class.php');

$ctr = new HomeController();

?>

<?=$ctr->getHeader();?>
  <body>
    <header>
      <h1>Pet Store</h1>
    </header>
    <main>
      <p>We have a lot of pets available. Please take a look around. I'm responsive.</p>
      <p>Filter by one of our attributes</p>
      <?=$ctr->warn()?>
      <form>
        <!-- *RESPONSIVE* class form-group is block on small screens -->
        <span class="form-group">
          <label for="attribute_name">Filter BY: </label>
          <select name="attribute_name" onchange="app.updateValueHints(this)">
            <option value=""></option>
            <?php foreach ($ctr->getAttribute() as $row): ?>
              <option value="<?=$row['name'];?>"><?=$row['name'];?></option>
            <?php endforeach ?>
          </select>
        </span>

        <span class="form-group">
          <label for="attribute_value">Filter Value: </label>
          <input list="all_values" name="attribute_value" autocomplete="off">
        </span>

        <span class="form-group">
          <label for="sort_key">Sort BY: </label>
          <select name="sort_key">
            <option value="">Name</option>
            <?php foreach ($ctr->getAttribute() as $row): ?>
              <option value="<?=$row['name'];?>"><?=$row['name'];?></option>
            <?php endforeach ?>
          </select>
          <label for="reverse">Reverse Order</label>
          <input type="checkbox" name="reverse" value="true">
        </span>

        <span class="form-group">
          <button type="submit" action="application/view/index.php">FIND MY PET</button>
        </span>
        <!-- provide value hints for users -->
        <!-- List is updated by javascript to display relevant (per filter attribute key) items only -->
        <datalist id="all_values">
          <?php foreach ($ctr->getAttribute() as $row): ?>
            <?php foreach ($ctr->getAttributeOptions($row['id']) as $opt): ?>
              <option class="att-option att-opt-<?=$row['name']?>"><?=$opt['value'];?></option>
            <?php endforeach ?>
          <?php endforeach ?>
        </datalist>
      </form>

      <!-- ITEM LIST -->
      <!-- Responsive, 4,3,2,1 column depending on screen width -->
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
                Only: $<?=$itemAttributes['price'];?>
              </p>
              <?=$ctr->displayAttribute('Age', $itemAttributes['age']);?>
              <?=$ctr->displayAttribute('Lifespan', $itemAttributes['lifespan']);?>
              <?=$ctr->displayAttribute('Color', $itemAttributes['color']);?>
              <?=$ctr->displayAttribute('Item type', $itemAttributes['item_type']);?>
              <?=$ctr->displayAttribute('Pet type', $itemAttributes['pet_type']);?>
              <?=$ctr->displayAttribute('Size', $itemAttributes['size']);?>
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
