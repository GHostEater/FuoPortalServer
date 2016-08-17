<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/18/2016
 * Time: 1:57 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];


$query = "UPDATE resultgpa SET rel='1' where sn='$id'";
mysqli_query($con,$query)or die("Unable To Execute");

sleep(2);
header("HTTP/1.0 201 Success");
ob_end_flush();