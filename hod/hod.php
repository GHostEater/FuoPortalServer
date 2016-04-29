<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 8:38 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from hod_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$department = '';
$firstName = '';
$middleName = '';
$lastName = '';

while($row = mysqli_fetch_assoc($result)){
    $lecturerId = $row['lecturerId'];
    $departmentId = $row['departmentId'];

    $query = "select * from lecturer_info WHERE sn='$lecturerId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $firstName = $row2['firstName'];
        $middleName = $row2['middleName'];
        $lastName = $row2['lastName'];
    }

    $query = "select * from department WHERE sn='$departmentId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $department = $row2['name'];
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'lecturerId' => $row['lecturerId'],
        'firstName' => $firstName,
        'middleName' => $middleName,
        'lastName' => $lastName,
        'departmentId' => $row['departmentId'],
        'department' => $department
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();