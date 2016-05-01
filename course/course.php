<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/16/2016
 * Time: 1:38 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from course_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";
$level = '';
$major = '';
$department = '';

while($row = mysqli_fetch_assoc($result)){
    $levelId = $row['levelId'];
    $departmentId = $row['departmentId'];
    $majorId = $row['majorId'];

    $query2 = "select * from level WHERE sn='$levelId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $level = $row2['level'];
    }

    $query2 = "select * from department WHERE sn='$departmentId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $department = $row2['name'];
    }

    $query2 = "select * from major WHERE sn='$majorId'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $major = $row2['name'];
    }

    $resultsArr[$i] = [
        'code' => $row['code'],
        'title' => $row['title'],
        'unit' => $row['unit'],
        'semesterId' => $row['semesterId'],
        'levelId' => $row['levelId'],
        'level' => $level,
        'departmentId' => $row['departmentId'],
        'department' => $department,
        'majorId' => $row['majorId'],
        'major' => $major,
        '$type' => $row['type']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();