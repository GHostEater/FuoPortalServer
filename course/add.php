<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:38 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$title = $_GET['title'];
$unit = $_GET['unit'];
$semesterId = $_GET['semesterId'];
$levelId = $_GET ['levelId'];
$departmentId = $_GET['departmentId'];
$majorId = $_GET['majorId'];
$prerequisiteFor = $_GET['prerequisiteFor'];

$query = "insert into course_info (code,title,unit,semesterId,levelId,departmentId,majorId)
VALUES('$code','$title','$unit','$semesterId','$levelId','$departmentId','$majorId')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();