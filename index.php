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
  <div class="sidebar">
    <div class="sidebar__content">
      <ul class="layer__list">
        <li class="layer__item">
          <div class="layer__checkbox-wrapper">
            <input type="checkbox" name="" id="" class="layer__checkbox checkbox">
          </div>
          <div class="layer__img-wrapper">
            <img class="layer__img" src="./assets/textures/crate.gif" alt="#">
          </div>
          <div class="layer__title">Электропроводник</div>
          <div class="layer__controls">
            <div class="layer__controls-btn">
              <svg>
                <use xlink:href="./public/svg/sprites.svg#lock" />
              </svg>
            </div>
            <div class="layer__controls-btn">
              <svg>
                <use xlink:href="./public/svg/sprites.svg#eye"/>
              </svg>
            </div>
          </div>
        </li>
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
        Развернуть
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