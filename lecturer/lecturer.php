<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:36 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from lecturer";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr[$i] = [
        'lecturer_id' =>$row['lecturer_id'],
        'lastName' => $row['last_name'],
        'middleName' => $row['middle_name'],
        'firstName' => $row['first_name'],
        'rank' => $row['rank'],
        'status' => $row['status'],
        'college' => $college,
        'department' => $department,
        'phoneNumber' => $row['phoneNumber'],
        'email' => $row['email'],
        'address' => $row['address']

    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();