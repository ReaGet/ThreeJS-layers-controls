<?php
  require_once './php/db.php';
  $stmp = $pdo->prepare('select * from planner_layers');
  $stmp->execute();
  $layers = $stmp->fetchAll();

  function generateLayer($layer) {
    $layer_id = $layer["id"];
    $layer_alias = $layer["alias"];
    $layer_title = $layer["title"];
    $layer_objects = implode(",", getObjectAliasesForLayer($layer_id));

    echo <<<LAYER__ITEM
      <li class="layer__item" data-id="$layer_id" data-layer-objects="$layer_objects">
        <div class="layer__checkbox-wrapper">
          <input type="checkbox" name="" id="" class="layer__checkbox checkbox">
        </div>
        <div class="layer__img-wrapper">
          <img class="layer__img" src="./assets/textures/crate.gif" alt="#">
        </div>
        <div class="layer__title">$layer_title</div>
        <div class="layer__controls">
          <div class="layer__controls-btn" data-button-type="lock">
            <svg>
              <use xlink:href="./public/svg/sprites.svg#lock" />
            </svg>
          </div>
          <div class="layer__controls-btn" data-button-type="visibility">
            <svg class="layer__controls-btn--visible">
              <use xlink:href="./public/svg/sprites.svg#eye"/>
            </svg>
            <svg class="layer__controls-btn--hidden">
              <use xlink:href="./public/svg/sprites.svg#eye--hidden"/>
            </svg>
          </div>
        </div>
      </li>
    LAYER__ITEM;
  }

  function getObjectAliasesForLayer($layer_id) {
    global $pdo;
    $smtp = $pdo->prepare('SELECT alias from planner_objects where layers=:id');
    $smtp->execute([':id' => $layer_id]);
    $rows = $smtp->fetchAll();
    $aliases = array();
    foreach ($rows as $row) {
      $aliases[] = $row["alias"];
    }
    return $aliases;
  }

?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Three JS</title>
  <link rel="stylesheet" href="./public/css/styles.css">
</head>
<body>
  <div class="sidebar expanded">
    <div class="sidebar__content">
      <ul class="layer__list">
        <?php 
          foreach($layers as $layer) {
            generateLayer($layer);
          }
        ?>
        <!-- <li class="layer__item layer__item--hidden">
          <div class="layer__checkbox-wrapper">
            <input type="checkbox" name="" id="" class="layer__checkbox checkbox">
          </div>
          <div class="layer__img-wrapper">
            <img class="layer__img" src="./assets/textures/crate.gif" alt="#">
          </div>
          <div class="layer__title">Электропроводник</div>
          <div class="layer__controls">
            <div class="layer__controls-btn" data-button-type="lock">
              <svg>
                <use xlink:href="./public/svg/sprites.svg#lock" />
              </svg>
            </div>
            <div class="layer__controls-btn" data-button-type="visibility">
              <svg class="layer__controls-btn--visible">
                <use xlink:href="./public/svg/sprites.svg#eye"/>
              </svg>
              <svg class="layer__controls-btn--hidden">
                <use xlink:href="./public/svg/sprites.svg#eye--hidden"/>
              </svg>
            </div>
          </div>
        </li> -->
      </ul>
    </div>
    <div class="sidebar__footer">
      <label for="select__all" class="sidebar__footer-label">
        <input type="checkbox" name="select__all" class="sidebar__footer-checkbox checkbox" id="select__all">
        Выделить все
      </label>
      <div class="sidebar__footer-toggle">
        <svg width="40" height="40">
          <use xlink:href="./public/svg/sprites.svg#arrow" />
        </svg>
        <span class="sidebar__toggle-title sidebar__toggle-title--expand">Развернуть</span>
        <span class="sidebar__toggle-title sidebar__toggle-title--collapse">Свернуть</span>
      </div>
    </div>
  </div>
  <script type="importmap">
    {
      "imports": {
        "three": "./src/build/three.module.js",
        "three/addons/": "./src/addons/"
      }
    }
  </script>
  <script type="module" src="./src/app.js"></script>
  <script type="module" src="./src/script.js"></script>
</body>
</html>