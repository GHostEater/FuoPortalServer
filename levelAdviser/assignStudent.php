<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/17/2016
 * Time: 10:02 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$lecturerId = $_GET['lecturerId'];
$matricNo = $_GET['matricNo'];

$query = "select * from student_info WHERE levelAdviserId='$lecturerId' AND matricNo='$matricNo'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$nRows = mysqli_num_rows($result);

if($nRows == 0){
    $query = "update student_info set levelAdviserId='$lecturerId' WHERE matricNo='$matricNo'";
    mysqli_query($con,$query)or die("Unable To Execute");
    header("HTTP/1.0 201 Success");
}
else{
    header("HTTP/1.0 401 Level Adviser Already Assigned");
}

ob_end_flush();