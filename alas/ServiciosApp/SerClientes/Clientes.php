<?php
ob_start();
include("../coneccion.php");
$dbConn =  connect($db);
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    try {
        if (isset($_GET['Cedula'])) {
            $sql = $dbConn->prepare(" SELECT
            ced_cli as Cedula,
            nom_cli as Nombre,
            ape_cli as Apellido,
            dir_cli as  Direccion,
            telefono_cli as Telefono
        FROM
            clientes
        WHERE
        ced_cli = :Cedula");
            $sql->bindValue(':Cedula', $_GET['Cedula']);
            
            $sql->execute();
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            header("HTTP/1.1 200 OK");
            echo json_encode($sql->fetchAll());
        }else{
            $sql = $dbConn->prepare("SELECT
            ced_cli as Cedula,
            nom_cli as Nombre,
            ape_cli as Apellido,
            dir_cli as  Direccion,
            telefono_cli as Telefono
        FROM
            clientes");
                       
            $sql->execute();
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            header("HTTP/1.1 200 OK");
            echo json_encode($sql->fetchAll());
        }  
    } catch (Exception $e) {
        echo 'Excepción capturada: ',  $e->getMessage(), "\n";
    }
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    try {
        //$input = $_POST;
        $input = (array) json_decode(file_get_contents('php://input'), TRUE);
        $sql = "INSERT INTO clientes(
            ced_cli ,
            nom_cli ,
            ape_cli ,
            dir_cli,
            telefono_cli 
        )
        VALUES(
             :Cedula,
            :Nombre,
            :Apellido,
            :Direccion,
            :Telefono            
        )";
        $statement = $dbConn->prepare($sql);
        $statement->bindValue(':Cedula', $input['Cedula']);
        $statement->bindValue(':Nombre', $input['Nombre']);
        $statement->bindValue(':Apellido', $input['Apellido']);
        $statement->bindValue(':Telefono', $input['Telefono']);
        $statement->bindValue(':Direccion', $input['Direccion']);
        
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