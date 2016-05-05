<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 05-May-16
 * Time: 3:18 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$levelId = $_GET ['levelId'];
$majorId = $_GET['majorId'];

$query = "select * from registrablecourses WHERE code='$code' AND levelId='$levelId' AND majorId='$majorId'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$nRows = mysqli_num_rows($result);

if($nRows == 0){
    $query2 = "insert into registrablecourses VALUES(NULL,'$majorId','$code','$levelId')";
    mysqli_query($con,$query2)or die("Unable To Execute");
    header("HTTP/1.0 201 Success");
}
else{
    header("HTTP/1.0 401 Already Added");
}
ob_end_flush();