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
$collegeId = $_GET['collegeId'];


$query = "UPDATE course_info SET code='$code',title='$title',unit='$unit',semester='$semester',
levelId='$levelId',departmentId='$departmentId',type='$type',collegeId='$collegeId' where code = '$code'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();