<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 6/21/2016
 * Time: 8:48 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from room";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $hostelId = $row['hostelId'];
    $query = "select * from hostel WHERE sn='$hostelId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $hostel = $row2['name'];
        $sex = $row2['sex'];
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'name' => $row['name'],
        'hostelId' => $row['hostelId'],
        'hostel' => $hostel,
        'sex' => $sex
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();