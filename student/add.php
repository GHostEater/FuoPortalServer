<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 12:29 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$matricNo = $_GET['matricNo'];
$firstName = $_GET['firstName'];
$middleName = $_GET['middleName'];
$lastName = $_GET['lastName'];
$collegeId = $_GET['collegeId'];
$departmentId = $_GET['departmentId'];
$majorId = $_GET['majorId'];
$level = $_GET['level'];
$mode_of_entry = $_GET['mode_of_entry'];
$session = $_GET['session'];
$dateBirth = $_GET['dateBirth'];
$email = $_GET['email'];
$address = $_GET['address'];
$password = $_GET['password'];

$query = "insert into student_info VALUES('$matricNo','$firstName','$middleName','$lastName','$collegeId','$departmentId','$majorId','$level','$mode_of_entry','$session','$dateBirth','$email','$address','$password')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();