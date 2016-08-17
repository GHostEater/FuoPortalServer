<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 17-Aug-16
 * Time: 6:27 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from editlogs";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $resultId = $row['resultId'];
    $editedBy = $row['editedBy'];

    $query = "select * from lecturer_info where sn='$editedBy'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $lecturer = $row2['lastName'].", ".$row2['firstName']." ".$row2['middleName'];
        $departmentId = $row2['departmentId'];
        $collegeId = $row2['collegeId'];
    }
    $query = "select * from department WHERE sn='$departmentId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $lectDept = $row2['name'];
    }
    $query = "select * from college WHERE sn='$collegeId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $lectCollege = $row2['acronym'];
    }

    $query = "select * from result_info WHERE sn='$resultId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $matricNo = $row2['matricNo'];
        $sessionId = $row2['sessionId'];
        $semester = $row2['semester'];
    }
    $query = "select * from student_info WHERE matricNo='$matricNo'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $student = $row2['lastName'].", ".$row2['firstName']." ".$row2['middleName'];
    }
    $query = "select * from session WHERE sn='$sessionId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $session = $row2['session'];
    }

    $resultsArr[$i] = [
        'id' => $row['id'],
        'resultId' => $row['resultId'],
        'type' => $row['type'],
        'prevScore' => $row['prevScore'],
        'newScore' => $row['newScore'],
        'dateEdited' => date('c',strtotime($row['dateEdited'])),
        'editedById' => $editedBy,
        'editedBy' => $lecturer,
        'lectDept' => $lectDept,
        'lectCollege' => $lectCollege,
        'matricNo' => $matricNo,
        'student' => $student,
        'session' => $session,
        'semester' => $semester
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();