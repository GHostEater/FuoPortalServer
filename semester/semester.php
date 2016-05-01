<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 01-May-16
 * Time: 2:17 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from semester";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr = [
        'id' => $row['id'],
        'semester' => $row['semester']
    ];
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();