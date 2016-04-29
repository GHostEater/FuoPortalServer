<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:36 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$rankId = $_GET['rankId'];
$statusId = $_GET['statusId'];
$collegeId = $_GET['collegeId'];
$departmentId = $_GET['departmentId'];
$phoneNumber = $_GET['phoneNumber'];
$email = $_GET['email'];
$password = $_GET['password'];
$address = $_GET['address'];

$query = "insert into lecturer_info VALUES(NULL,'$firstName','$middleName','$lastName',
                                          '$rankId','$statusId','$collegeId','$departmentId',
                                          '$phoneNumber','$email','$password','$address')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();