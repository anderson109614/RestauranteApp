<?php
$servidor="localhost";
$usuario="root";
$clave="";
$base="restaurante";
$conn=mysqli_connect($servidor,$usuario,$clave,$base);
$mysqli =new mysqli($servidor,$usuario,$clave,$base);
if(!$mysqli)
{
    die("error en la conexion".mysqli_connect_error());
}
function utf8_converter($array)
{
    array_walk_recursive($array,function(&$item){
    $item=utf8_encode($item);
    });
    return json_encode($array);
}


?>