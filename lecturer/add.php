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

$lecturer_id = $_GET['lecturer_id'];
$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$rank = $_GET['rank'];
$status = $_GET['status'];
$collegeId = $_GET['collegeId'];
$departmentId = $_GET['departmentId'];
$phoneNumber = $_GET['phoneNumber'];
$email = $_GET['email'];
$address = $_GET['address'];

$query = "insert into lecturer VALUES(NULL,'$lecturer_id',$firstName','$middleName','$lastName','$rank','$status','$collegeId','$departmentId',$phoneNumber','$email','$address')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();