<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 16-Aug-16
 * Time: 9:26 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];

$query = "UPDATE editrequests SET status='3' where id = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();