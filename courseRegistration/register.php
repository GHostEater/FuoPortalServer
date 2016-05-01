<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 01-May-16
 * Time: 1:56 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$matricNo = $_GET['matricNo'];
$levelId = $_GET['levelId'];
$semesterId = $_GET['semesterId'];
$sessionId = $_GET['sessionId'];

$query = "insert into registerredcourses VALUES(NULL,'$code','$matricNo','$levelId','$semesterId','$sessionId')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();