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

while($row = mysqli_fetch_assoc($result)){
    $code = $row['code'];

    $query2 = "select * from course_info WHERE code='$code'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $levelId = $row2['levelId'];

        $query3 = "select * from level WHERE sn='$levelId'";
        $result3 = mysqli_query($con,$query3)or die("Unable To Execute");
        while($row3 = mysqli_fetch_assoc($result3)){
            $lecturerId = $row['lecturerId'];

            $query4 = "select * from lecturer_info WHERE sn='$lecturerId'";
            $result4 = mysqli_query($con,$query4)or die("Unable To Execute");
            while($row4 = mysqli_fetch_assoc($result4)){
                $resultsArr[$i] = [
                    'id' => $row['sn'],
                    'code' => $row['code'],
                    'title' => $row2['title'],
                    'unit' => $row2['unit'],
                    'semesterId' => $row2['semesterId'],
                    'levelId' => $row2['levelId'],
                    'level' => $row3['level'],
                    'prerequisiteFor' => $row2['prerequisiteFor'],
                    'firstName' => $row4['firstName'],
                    'middleName' => $row4['middleName'],
                    'lastName' => $row4['lastName']
                ];
            }
        }
    }
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();