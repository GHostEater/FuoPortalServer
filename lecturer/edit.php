<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:37 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];
$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$rank = $_GET['rank'];
$status = $_GET['status'];
$collegeId = $_GET['collegeId'];
$departmentId = $_GET['departmentId'];
$phoneNumber = $_GET['phoneNumber'];
$email = $_GET['email'];
$password = $_GET['password'];
$address = $_GET['address'];

$query = "UPDATE lecturer_info SET firstName='$firstName',middleName='$middleName',lastName='$lastName',rank='$rank',status='$status',collegeId='$collegeId',departmentId='$departmentId',phoneNumber='$phoneNumber',email='$email',password='$password',address='$address' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();