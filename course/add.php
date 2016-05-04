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
$semester = $_GET['semester'];
$levelId = $_GET ['levelId'];
$departmentId = $_GET['departmentId'];
$majorId = $_GET['majorId'];
$prerequisiteFor = $_GET['prerequisiteFor'];
$type = $_GET['type'];

$query = "insert into course_info (code,title,unit,semester,levelId,departmentId,majorId,type)
VALUES('$code','$title','$unit','$semester','$levelId','$departmentId','$majorId','$type')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();