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
$sex = $_GET['sex'];
$email = $_GET['email'];
$phoneNumber = $_GET['phoneNumber'];
$dateBirth = $_GET['dateBirth'];
$nationality = $_GET['nationality'];
$stateOrigin = $_GET['stateOrigin'];
$lga = $_GET['lga'];
$religion = $_GET['religion'];
$address = $_GET['address'];
$nextOfKin = $_GET['nextOfKin'];
$nextOfKinAddress = $_GET['nextOfKinAddress'];
$collegeId = $_GET['collegeId'];
$departmentId = $_GET['departmentId'];
$majorId = $_GET['majorId'];
$levelId = $_GET['levelId'];
$mode_of_entry = $_GET['mode_of_entry'];
$password = $_GET['password'];

$query = "UPDATE student_info SET matricNo='$matricNo',firstName='$firstName',middleName='$middleName',
lastName='$lastName',sex='$sex',email='$email',phoneNumber='$phoneNumber',dob='$dateBirth',nationality='$nationality',
stateOrigin='$stateOrigin',lga='$lga',religion='$religion',address='$address',nextOfKin'$nextOfKin',
nextOfKinAddress'$nextOfKinAddress',collegeId='$collegeId',departmentId='$departmentId',majorId='$majorId',
levelId='$levelId',modeOfEntryId='$mode_of_entry',password='$password'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();