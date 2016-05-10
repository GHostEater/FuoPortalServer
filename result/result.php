<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:34 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from result_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$session = '';

while($row = mysqli_fetch_assoc($result)){
    $matricNo = $row['matricNo'];
    $sessionId = $row['sessionId'];
    $code = $row['code'];

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
    $query2 = "select * from course_info WHERE code='$code'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $title = $row2['title'];
        $unit = $row2['unit'];
    }
    $resultsArr[$i] = [
        'id' => $row['sn'],
        'code' => $row['code'],
        'title' => $title,
        'unit' => $unit,
        'matricNo' => $row['matricNo'],
        'ca' => $row['ca'],
        'exam' => $row['exam'],
        'final' => $row['final'],
        'grade' => $row['grade'],
        'gp' => $row['gp'],
        'sessionId' => $row['sessionId'],
        'session' => $session,
        'semester' => $row['semester'],
        'firstName' => $firstName,
        'middleName' => $middleName,
        'lastName' => $lastName,
        'collegeId' => $collegeId,
        'departmentId' => $departmentId,
        'majorId' => $majorId,
        'levelId' => $levelId
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();