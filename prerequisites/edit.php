<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/27/2016
 * Time: 12:11 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$code = $_GET['code'];
$prerequisite = $_GET['prerequisite'];

$query = "UPDATE major SET code='$code',prerequiste='$prerequisite' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();