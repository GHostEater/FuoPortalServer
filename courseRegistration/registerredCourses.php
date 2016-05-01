<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 01-May-16
 * Time: 3:41 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from registerredcourses";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$major = '';
$level = '';
$title = '';
$unit = '';
$semester = '';
$type = '';

while($row = mysqli_fetch_assoc($result)){
    $code = $row['code'];
    $matricNo = $row['matricNo'];
    $levelId = $row['levelId'];
    $sessionId = $row['sessionId'];

    $query = "select * from course_info where code='$code'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $title = $row2['title'];
        $unit = $row2['unit'];
        $type = $row2['type'];
    }
    $query = "select * from level WHERE sn='$levelId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $level = $row2['level'];
    }
    $query = "select * from session WHERE sn='$sessionId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $session = $row2['session'];
    }

    $resultsArr[$i] = [
        'id' => $row['id'],
        'code' => $row['code'],
        'matricNo' => $matricNo,
        'title' => $title,
        'unit' => $unit,
        'type' => $type,
        'level' => $level,
        'semester' => $row['semester'],
        'session' => $session,
        'sessionId' => $sessionId
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();