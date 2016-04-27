<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/27/2016
 * Time: 12:09 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$name = $_GET['code'];
$departmentId = $_GET['prerequisite'];

$query = "insert into major VALUES(NULL,'$code','$prerequisite')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();