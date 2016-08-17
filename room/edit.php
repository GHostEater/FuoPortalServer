<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/21/2016
 * Time: 8:48 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$name = $_GET['name'];
$hostelId = $_GET['hostelId'];

$query = "UPDATE room SET name='$name',hostelId='$hostelId' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();