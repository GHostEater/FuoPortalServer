<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 04-May-16
 * Time: 1:21 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$matricNo = $_GET['matricNo'];
$ca = $_GET['ca'];
$sessionId = $_GET['sessionId'];
$semester = $_GET['semester'];

if($ca > 30){
    $ca = 30;
}


$query = "select * from result_info WHERE code='$code' AND matricNo='$matricNo' AND sessionId='$sessionId'
AND semester='$semester'";
$result = mysqli_query($con,$query)or die("Unable To Execute 1");
$nRows = mysqli_num_rows($result);

if($nRows === 0){
    $query2 = "select * from registerredcourses where code='$code' and matricNo='$matricNo'
    and sessionId='$sessionId' AND semester='$semester'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute 2");
    $nRows2 = mysqli_num_rows($result2);

    if($nRows2 > 0){
        $query2 = "insert into result_info(code,matricNo,ca,exam,final,grade,sessionId,semester,rel,gp,statusId)
VALUES('$code','$matricNo','$ca',NULL,NULL,NULL,'$sessionId','$semester','0',NULL,NULL)";
        mysqli_query($con,$query2)or die("Unable To Execute 3");
        sleep(2);
        header("HTTP/1.0 201 Success");
    }
    else{
        sleep(2);
        header("HTTP/1.0 401 Student Not Registered");
    }
}
else{
    sleep(2);
    header("HTTP/1.0 402 Already Uploaded");
}
ob_end_flush();