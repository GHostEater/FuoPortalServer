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
$level = $_GET ['level'];
$prequisiteFor = $_GET['prequisiteFor'];

$query = "UPDATE course SET code='$code',title='$title',unit='$unit',semester='$semester',level='$level',prequisiteFor='$prequisiteFor' where code = '$code'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();