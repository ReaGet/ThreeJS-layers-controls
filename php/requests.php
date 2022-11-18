<?php
  include_once 'db.php';

  if ($_GET['getIds']) {
    header ('Content-type: application/json');
    
    $smtp = $pdo->prepare('SELECT alias, layers from planner_objects');
    $smtp->execute();
    $rows = $smtp->fetchAll();

    $result = array();

    foreach ($rows as $row) {
      $result []= array(
        "alias" => $row["alias"],
        "layer_id" => $row["layers"]
      );
    }

    echo json_encode($result, true);
  }

?>