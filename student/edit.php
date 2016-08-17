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

$id = $_GET['id'];
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
$modeOfEntryId = $_GET['modeOfEntryId'];
$password = $_GET['password'];
$status = $_GET['status'];
$town = $_GET['town'];
$genotype = $_GET['genotype'];
$bloodGroup = $_GET['bloodGroup'];
$oLevel = $_GET['oLevel'];
$parentNo = $_GET['parentNo'];

$query = "update student_info set matricNo='$matricNo',firstName='$firstName',middleName='$middleName',
lastName='$lastName',sex='$sex',email='$email',phoneNumber='$phoneNumber',dateBirth='$dateBirth',
nationality='$nationality',stateOrigin='$stateOrigin',lga='$lga',religion='$religion',address='$address',
nextOfKin='$nextOfKin',nextOfKinAddress='$nextOfKinAddress',collegeId='$collegeId',departmentId='$departmentId',
majorId='$majorId',levelId='$levelId',modeOfEntryId='$modeOfEntryId',password='$password',status='$status',
town='$town',genotype='$genotype',bloodGroup='$bloodGroup',oLevel='$oLevel',parentNo='$parentNo' where sn = '$id'";
mysqli_query($con,$query)or die("Unable To Execute");


header("HTTP/1.0 201 Success");
ob_end_flush();