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

$rank = $_GET['rank'];

$query = "insert into lecturerRank VALUES(NULL,'$rank')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();