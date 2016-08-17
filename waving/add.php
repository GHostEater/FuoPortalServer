<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/11/2016
 * Time: 12:03 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$wavedBy = $_GET['wavedBy'];
$matricNo = $_GET['matricNo'];

$query = "insert into wavedcourses(sn, code, wavedBy, matricNo) VALUES(NULL,'$code','$wavedBy','$matricNo')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();