<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/11/2016
 * Time: 9:02 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$id = $_GET['id'];
$query = "DELETE FROM registerredcourses WHERE sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();