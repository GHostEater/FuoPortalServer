<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:40 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$lecturer_id = $_GET['lecturer_id'];
$course_code = $_GET['course_code'];
$course_title = $_GET['course_title'];
$course_unit = $_GET['course_unit'];
$course_semester = $_GET['course_semester'];
$course_level = $_GET ['course_level'];

$query = "UPDATE allocation SET lecturer_id='$lecturer_id',course_code='$course_code',course_title='$course_title',course_unit='$course_unit',course_semester='$course_semester',course_level='$course_level' where lecturer_id = '$lecturer_id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();