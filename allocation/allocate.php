<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 23-Apr-16
 * Time: 3:13 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$lecturerId = $_GET['lecturerId'];
$code = $_GET['code'];
$allocatedBy = $_GET['allocatedBy'];

$query = "select * from allocation_info WHERE code='$code'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$nRows = mysqli_num_rows($result);

if($nRows === 0){
    $query2 = "insert into allocation_info VALUES(NULL,'$lecturerId','$code','$allocatedBy')";
    mysqli_query($con,$query2)or die("Unable To Execute");
    header("HTTP/1.0 201 Success");
}
else{
    header("HTTP/1.0 401 Already Assigned");
}
ob_end_flush();