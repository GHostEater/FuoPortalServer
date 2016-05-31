<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/18/2016
 * Time: 2:00 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from resultgpa";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$session = '';

while($row = mysqli_fetch_assoc($result)){
    $matricNo = $row['matricNo'];
    $sessionId = $row['sessionId'];

    $query2 = "select * from student_info WHERE matricNo='$matricNo'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $firstName = $row2['firstName'];
        $middleName = $row2['middleName'];
        $lastName = $row2['lastName'];
        $departmentId = $row2['departmentId'];
        $collegeId = $row2['collegeId'];
        $majorId = $row2['majorId'];
        $levelId = $row2['levelId'];
    }
    $query2 = "select * from session WHERE sn='$sessionId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $session = $row2['session'];
    }
    $resultsArr[$i] = [
        'id' => $row['sn'],
        'sessionId' => $row['sessionId'],
        'semester' => $row['semester'],
        'gpa' => $row['gpa'],
        'cgpa' => $row['cgpa'],
        'prev_cgpa' => $row['prev_cgpa'],
        'matricNo' => $matricNo,
        'firstName' => $firstName,
        'middleName' => $middleName,
        'lastName' => $lastName,
        'departmentId' => $departmentId,
        'majorId' => $majorId,
        'collegeId' => $collegeId,
        'levelId' => $levelId,
        'rel' => $row['rel'],
        'tcp' => $row['tcp'],
        'tnu' => $row['tnu'],
        'ctcp' => $row['ctcp'],
        'ctnu' => $row['ctnu'],
        'statusId' => $row['statusId']

    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();