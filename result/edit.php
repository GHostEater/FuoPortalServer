<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:35 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$code = $_GET['code'];
$matricNo = $_GET['matricNo'];
$ca = $_GET['ca'];
$exam = $_GET['exam'];
$final = $_GET['final'];
$grade = $_GET['grade'];
$session = $_GET['session'];
$semester = $_GET['semester'];


$query = "UPDATE result_info SET code='$code',matricNo='$matricNo',ca='$ca',exam='$exam',final='$final',grade='$grade',sessionId='$session',semester='$semester',statusId='statusId' where code = '$code'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();