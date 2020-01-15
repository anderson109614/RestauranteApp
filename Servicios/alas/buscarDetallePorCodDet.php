<?php
//include "conexion.php";
include "config.php";
include "utils.php";

$dbConn =  connect($db);

if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
      //Mostrar un post
      //$sql = $dbConn->prepare("SELECT * FROM detalle_factura where cod_fac_per=:cod_fac_per ");
      $sql = $dbConn->prepare("SELECT nom_pla,cantidad,precio FROM detalle_factura D, platos P 
      WHERE D.cod_fac_per=:cod_fac_per AND P.cod_pla = D.cod_pla_per; ");
      $sql->bindValue(':cod_fac_per', $_GET['cod_fac_per']);
      $sql->execute();
      $sql->setFetchMode(PDO::FETCH_ASSOC);
      header("HTTP/1.1 200 OK");
      echo json_encode(  $sql->fetchAll()  );
      exit();
}
?>