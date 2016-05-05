<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 29-Apr-16
 * Time: 9:41 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from registrablecourses";
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
    $majorId = $row['majorId'];
    $code = $row['code'];
    $levelId = $row['levelId'];

    $query = "select * from major where sn='$majorId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $major = $row2['name'];
    }

    $query = "select * from level where sn='$levelId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $level = $row2['level'];
    }

    $query = "select * from course_info where code='$code'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $title = $row2['title'];
        $unit = $row2['unit'];
        $semester = $row2['semester'];
        $type = $row2['type'];
    }

    $resultsArr[$i] = [
        'id' => $row['sn'],
        'code' => $row['code'],
        'title' => $title,
        'unit' => $unit,
        'semester' => $semester,
        'type' => $type,
        'level' => $level,
        'levelId' => $levelId,
        'major' => $major,
        'majorId' => $majorId
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();