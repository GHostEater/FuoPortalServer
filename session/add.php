<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 4:12 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$session = $_GET['session'];

$query = "insert into session VALUES(NULL,'$session')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();