<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:37 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$name = $_GET['name'];
$acronym = $_GET['acronym'];

$query = "UPDATE department SET name='$name',acronym='$acronym' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();