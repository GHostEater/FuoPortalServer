<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 05-May-16
 * Time: 4:18 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$matricNo = $_GET['matricNo'];

$totalCourseUnit = $_GET['total'];


$query = "insert into result_info VALUES('$code','$matricNo','$ca','$exam','$final','$grade','$session','$semester')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();