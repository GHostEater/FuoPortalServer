<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 16-Aug-16
 * Time: 9:16 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$query = "select * from editrequests";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$i = 0;
$resultsArr = "";

while($row = mysqli_fetch_assoc($result)){
    $lecturerId = $row['lecturerId'];
    $handledById = $row['handledBy'];

    $query = "select * from lecturer_info WHERE sn='$lecturerId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $lecturer = $row2['lastName'].", ".$row2['firstName']." ".$row2['middleName'];
        $departmentId = $row2['departmentId'];
        $collegeId = $row2['collegeId'];
    }
    $query = "select * from department WHERE sn='$departmentId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $department = $row2['name'];
    }
    $query = "select * from college WHERE sn='$collegeId'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $college = $row2['acronym'];
    }
    $query = "select * from academicaffair_info WHERE sn='$handledById'";
    $result2 = mysqli_query($con,$query)or die("Unable To Execute");
    while($row2 = mysqli_fetch_assoc($result2)){
        $handledBy = $row2['lastName'].", ".$row2['firstName']." ".$row2['middleName'];
    }

    $resultsArr[$i] = [
        'id' => $row['id'],
        'lecturerId' => $lecturerId,
        'name' => $lecturer,
        'collegeId' => $college,
        'college' => $college,
        'departmentId' => $departmentId,
        'department' => $department,
        'date' => date('c',strtotime($row['date'])),
        'handledById' => $handledById,
        'handledBy' => $handledBy,
        'status' => $row['status']
    ];
    $i+=1;
}
header("HTTP/1.0 201 Success");
echo json_encode($resultsArr);
ob_end_flush();