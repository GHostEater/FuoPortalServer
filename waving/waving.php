<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/11/2016
 * Time: 12:01 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from wavedcourses";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'code' => $row['code'],
        'wavedBy' => $row['wavedBy'],
        'matricNo' => $row['matricNo'],
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();