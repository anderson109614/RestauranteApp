<?php
include "conexion.php";
$query ="SELECT * FROM maestro_factura";
$buscarUsuario = $conn->query($query);
$result = array();
if($buscarUsuario->num_rows >0){
while($fila=$buscarUsuario->fetch_assoc()){
array_push($result,$fila);
}
}else{
    $result = "No se encontraron coincidencias";
}
echo json_encode($result);
?>