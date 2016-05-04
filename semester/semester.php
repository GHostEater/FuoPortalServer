<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 03-May-16
 * Time: 11:43 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from semester";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$semester = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr = [
        'id' => $row['sn'],
        'semester' => $row['semester'],
    ];
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();