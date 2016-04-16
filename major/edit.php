<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:35 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$name = $_GET['name'];
$departmentId = $_GET['departmentId'];

$query = "UPDATE major SET name='$name',departmentId='$departmentId' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();