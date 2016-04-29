<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/26/2016
 * Time: 7:56 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$rank = $_GET['rank'];

$query = "UPDATE lecturerRank SET rank='$rank' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();