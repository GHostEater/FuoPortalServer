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

$query = "select * from result";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr[$i] = [
        'course_code' => $row['course_code'],
        'matric_no' => $row['matric_no'],
        'ca' => $row['ca'],
        'exam' => $row['exam'],
        'final' => $row['final'],
        'grade' => $row['grade']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();