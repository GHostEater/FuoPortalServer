<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 8:39 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$lecturerId = $_GET['lecturerId'];
$departmentId = $_GET['departmentId'];

$query = "insert into hod_info VALUES('$lecturerId','$departmentId')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();