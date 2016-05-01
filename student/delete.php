<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 12:30 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$matricNo = $_GET['matricNo'];
$query = "DELETE FROM student_info WHERE matricNo = '$matricNo'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();