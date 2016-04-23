<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 23-Apr-16
 * Time: 2:44 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$id = $_GET['id'];

$query = "select * from course_info WHERE departmentId='$id'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultsArr[$i] = [
        'code' => $row['code'],
        'title' => $row['title'],
        'unit' => $row['unit'],
        'semester' => $row['semester'],
        'level' => $row['level'],
        'prerequisiteFor' => $row['prerequisiteFor']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();