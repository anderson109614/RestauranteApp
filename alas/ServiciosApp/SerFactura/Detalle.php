<?php
ob_start();
include("../coneccion.php");
$dbConn =  connect($db);


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
  

    try {
        //$input = $_POST;
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        $sql = "INSERT INTO detalle_factura(
            cod_pla_per,
            cantidad,
            precio,
            cod_fac_per
        )
        VALUES(
            :cod_pla_per,
            :cantidad,
            :precio,
            :cod_fac_per
        )";
        $statement = $dbConn->prepare($sql);
        $statement->bindValue(':cod_pla_per', $input['cod_pla_per']);
        $statement->bindValue(':cantidad', $input['cantidad']);
        $statement->bindValue(':precio', $input['precio']);
        $statement->bindValue(':cod_fac_per', $input['cod_fac_per']);
        
        // bindAllValues($statement, $input,-1);

        $statement->execute();
        
        header("HTTP/1.1 200 OK");
        echo json_encode($input);
        
    } catch (Exception $e) {
        echo 'Excepción capturada: ',  $e->getMessage(), "\n";
    }
    
}




header('Content-type: application/json');
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: *');
ob_end_flush(); 
?>