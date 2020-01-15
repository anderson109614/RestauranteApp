<?php
ob_start();
include("../coneccion.php");
$dbConn =  connect($db);


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try{
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
       
        $sql = $dbConn->prepare("SELECT
        ced_per,
        nom_per,
        ape_per,
        dir_per,
        tip_per,
        usuario,
        contrasenia
    FROM
        personal
    WHERE
             usuario=:usuario
     AND   contrasenia=:contrasenia;");

        $sql->bindValue(':usuario', $input['usuario'] );
        $sql->bindValue(':contrasenia', $input['contrasenia'] );
        $sql->execute();
          $sql->setFetchMode(PDO::FETCH_ASSOC);
          header("HTTP/1.1 200 OK");
          echo json_encode( $sql->fetchAll()  );
       // echo json_encode(  $sql->fetch(PDO::FETCH_ASSOC)  );
      
   
    } catch (Exception $e) {
        //echo 'Excepción capturada: ',  $e->getMessage(), "\n";
        $input['error'] =$e->getMessage() ;
        echo json_encode($input);
    }
   

}


header('Content-type: application/json');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: *');
ob_end_flush();
?>