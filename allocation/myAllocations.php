<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 23-Apr-16
 * Time: 12:48 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];

$query = "select * from allocation_info WHERE allocatedBy='$id'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$levelId = '';

while($row = mysqli_fetch_assoc($result)){
    $code = $row['code'];
    $lecturerId = $row['lecturerId'];
    $sessionId = $row['sessionId'];

    $query2 = "select * from course_info WHERE code='$code'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $levelId = $row2['levelId'];
        $title = $row2['title'];
        $unit = $row2['unit'];
    }
    $query2 = "select * from level WHERE sn='$levelId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $level = $row2['level'];
    }
    $query2 = "select * from lecturer_info WHERE sn='$lecturerId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $firstName = $row2['firstName'];
        $middleName = $row2['middleName'];
        $lastName = $row2['lastName'];
    }
    $query2 = "select * from session WHERE sn='$sessionId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $session = $row2['session'];
    }
    $resultsArr[$i] = [
        'id' => $row['sn'],
        'code' => $row['code'],
        'title' => $title,
        'unit' => $unit,
        'semester' => $row['semester'],
        'sessionId' => $row['sessionId'],
        'session' => $session,
        'levelId' => $levelId,
        'level' => $level,
        'firstName' => $firstName,
        'middleName' => $middleName,
        'lastName' => $lastName
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();