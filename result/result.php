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
    $sessionId = $row['sessionId'];
    $code = $row['code'];

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
        'semester' => $row['semester']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();