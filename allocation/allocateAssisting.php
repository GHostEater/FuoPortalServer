<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 10-May-16
 * Time: 2:57 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$lecturerId = $_GET['lecturerId'];
$code = $_GET['code'];
$allocatedBy = $_GET['allocatedBy'];
$sessionId = $_GET['sessionId'];
$semester = $_GET['semester'];
$position = $_GET['position'];

$query2 = "insert into allocation_info VALUES(NULL,'$lecturerId','$code','$allocatedBy','$semester','$sessionId','$position')";
mysqli_query($con,$query2)or die("Unable To Execute");
header("HTTP/1.0 201 Success");

ob_end_flush();