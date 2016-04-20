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
$id = $_GET['matricNo'];
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

$query = "UPDATE student SET firstName='$firstName',middleName='$middleName',lastName='$lastName',collegeId='$collegeId',departmentId='$departmentId',majorId='$majorId',level='$level',mode_of_entry='$mode_of_entry',session='$session',dateBirth='$dateBirth',email='$email',address='$address' where id = '$matricNno'";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();