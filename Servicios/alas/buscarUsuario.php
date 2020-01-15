<?php
include "conexion.php";
$query ="SELECT * FROM personal ORDER BY ced_per";
if(isset($_POST['ced_per']) != ""){
$q =$conn->real_escape_string($_POST['ced_per']);
$query = "SELECT * FROM personal where ced_per LIKE '%".$q."%'";
}

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