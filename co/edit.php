<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 8:37 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$collegeId = $_GET['collegeId'];
$email = $_GET['email'];
$password = $_GET['password'];

$query = "UPDATE co_info SET firstName='$firstName',middleName='$middleName',lastName='$lastName',collegeId='$collegeId',email='$email',password='$password' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();