<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 01-May-16
 * Time: 1:56 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$matricNo = $_GET['matricNo'];
$levelId = $_GET['levelId'];
$semester = $_GET['semester'];
$sessionId = $_GET['sessionId'];

$query = "select * from registerredcourses where code='$code' AND matricNo='$matricNo' AND levelId='$levelId'
AND semester='$semester' AND sessionId='$sessionId'";
$result = mysqli_query($con,$query);
$nRows = mysqli_num_rows($result);

if($nRows == 0){
    $query2 = "insert into registerredcourses VALUES(NULL,'$code','$matricNo','$levelId','$semester','$sessionId')";
    mysqli_query($con,$query2)or die("Unable To Execute");
    header("HTTP/1.0 201 Success");
}
else{
    header("HTTP/1.0 401 Already Registerred");
}
ob_end_flush();