<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/18/2016
 * Time: 1:48 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];


$query = "UPDATE result_info SET rel='1' where sn='$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();