<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/21/2016
 * Time: 8:23 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$email = $_GET['email'];
$sex = $_GET['sex'];
$position = $_GET['position'];
$password = $_GET['password'];

$query = "UPDATE studentaffair SET firstName='$firstName',middleName='$middleName',lastName='$lastName',
email='$email',password='$password',position='$position',sex='$sex' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();