<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:34 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$course_code = $_GET['course_code'];
$matric_no = $_GET['matric_no'];
$ca = $_GET['ca'];
$exam = $_GET['exam'];
$final = $_GET['final'];
$grade = $_GET['grade'];
$grade = $_GET['session'];
$grade = $_GET['semester'];

$query = "insert into result VALUES(NULL,'$course_code','$matric_no','$ca','$exam','$final','$grade')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();