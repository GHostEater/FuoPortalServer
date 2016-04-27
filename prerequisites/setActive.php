<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 27-Apr-16
 * Time: 2:09 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$active = 1;
$query = "UPDATE prerequisites SET active='$active' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();