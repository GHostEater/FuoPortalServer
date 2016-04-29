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

$query = "select * from lecturer_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$college = '';
$department = '';
$rank = '';
$status = '';

while($row = mysqli_fetch_assoc($result)){
    $collegeId = $row['collegeId'];
    $departmentId = $row['departmentId'];
    $rankId = $row['rankId'];
    $statusId = $row['statusId'];

    $query2 = "select * from college where sn = '$collegeId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row3 = mysqli_fetch_assoc($result2)){
        $college = $row3['name'];
    }

    $query2 = "select * from department where sn = '$departmentId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $department = $row2['name'];
    }

    $query2 = "select * from lecturerRank where sn = '$rankId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $rank = $row2['rank'];
    }

    $query2 = "select * from lecturerStatus where sn = '$statusId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $status = $row2['status'];
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'firstName' => $row['firstName'],
        'middleName' => $row['middleName'],
        'lastName' => $row['lastName'],
        'rankId' => $row['rankId'],
        'rank' => $rank,
        'statusId' => $row['statusId'],
        'status' => $status,
        'collegeId' => $row['collegeId'],
        'college' => $college,
        'departmentId' => $row['departmentId'],
        'department' => $department,
        'phoneNumber' => $row['phoneNumber'],
        'email' => $row['email'],
        'address' => $row['address']
    ];
    $i += 1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();