<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 8:39 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$lecturerId = $_GET['lecturerId'];
$departmentId = $_GET['departmentId'];

$query = "select * from hod_info WHERE lecturerId='$lecturerId'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$nRows = mysqli_num_rows($result);

if($nRows === 0){
    $query = "select * from hod_info WHERE departmentId='$departmentId'";
    $result = mysqli_query($con,$query)or die("Unable To Execute");
    $nRows2 = mysqli_num_rows($result);

    if($nRows2 === 0){
        $query = "insert into hod_info VALUES(NULL,'$lecturerId','$departmentId')";
        mysqli_query($con,$query)or die("Unable To Execute");

        header("HTTP/1.0 201 Success");
    }
    else{
        header("HTTP/1.0 402 Department Already has Head");
    }
}
else{
    header("HTTP/1.0 401 Lecturer Already Assigned");
}

ob_end_flush();