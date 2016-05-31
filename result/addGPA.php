<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 05-May-16
 * Time: 4:18 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$matricNo = $_GET['matricNo'];
$tcp = $_GET['tcp'];
$ctcp = $_GET['ctcp'];
$prev_ctcp = $_GET['prev_ctcp'];
$tnu = $_GET['tnu'];
$ctnu = $_GET['ctnu'];
$prev_ctnu = $_GET['prev_ctnu'];
$prev_cgpa = $_GET['prev_cgpa'];
$gpa = $_GET['gpa'];
$cgpa = $_GET['cgpa'];
$sessionId = $_GET['sessionId'];
$semester = $_GET['semester'];

if($cgpa >=4.00) {
    $statusId = '1';
}
elseif($cgpa >= 1.50 && $cgpa <= 3.99) {
    $statusId = '2';
}
elseif($cgpa >= 1.00 && $cgpa < 1.50) {
    $statusId = '3';
}
elseif($cgpa <= 1.00) {
    $statusId = '4';
}


$query = "insert into resultgpa(sn,sessionId,semester,gpa,cgpa,matricNo,rel,tcp,tnu,ctcp,ctnu,prev_cgpa,statusId,prev_ctcp,prev_ctnu)
VALUES(NULL,'$sessionId','$semester','$gpa','$cgpa','$matricNo','0','$tcp','$tnu','$ctcp','$ctnu','$prev_cgpa','$statusId','$prev_ctcp','$prev_ctnu')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();