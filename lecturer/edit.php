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
$id = $_GET['matric_no'];
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

$query = "UPDATE lecturer SET firstName='$firstName',middleName='$middleName',lastName='$lastName',rank='$rank',status='$status',collegeId='$collegeId',departmentId='$departmentId',phoneNumber='$phoneNumber',email='$email',address='$address' where id = '$lecturer_id'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();