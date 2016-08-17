<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/28/2016
 * Time: 9:02 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$matricNo = $_GET['matricNo'];
$roomId = $_GET['roomId'];
$sessionId = $_GET['sessionId'];

$query = "select * from roomAllocation WHERE roomId='$roomId' and sessionId='$sessionId'";
$result = mysqli_query($con,$query);
$nRows = mysqli_num_rows($result);

if($nRows < 6){
    $query = "select * from roomAllocation WHERE matricNo='$matricNo' and sessionId='$sessionId'";
    $result = mysqli_query($con,$query);
    $nRows2 = mysqli_num_rows($result);
    if($nRows2 == 0){
        $query = "insert into roomAllocation(sn, matricNo, roomId, sessionId) VALUES (null,'$matricNo','$roomId','$sessionId')";
        mysqli_query($con,$query)or die("Unable To Execute");

        header("HTTP/1.0 201 Success");
    }
    else{
        header("HTTP/1.0 402 Already Has a Room");
    }
}
else{
    header("HTTP/1.0 401 Above Limit");
}
ob_end_flush();