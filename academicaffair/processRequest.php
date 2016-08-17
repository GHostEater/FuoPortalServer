<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 16-Aug-16
 * Time: 9:25 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$status = $_GET['status'];
$date = date("Y-m-d H:i:s",strtotime($_GET['date']));
$handledBy = $_GET['handledBy'];

$query = "UPDATE editrequests SET status='$status',date='$date',handledBy='$handledBy' where id = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();