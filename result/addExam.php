<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/4/2016
 * Time: 3:34 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$code = $_GET['code'];
$matricNo = $_GET['matricNo'];
$exam = $_GET['exam'];
$sessionId = $_GET['sessionId'];
$semester = $_GET['semester'];
if(floatval($exam) > 70){
    $exam = 70;
}
else{
    $exam = round($exam);
}

$query = "select * from result_info WHERE code='$code' AND matricNo='$matricNo'AND sessionId='$sessionId'
AND semester='$semester' AND exam='$exam'";
$result = mysqli_query($con,$query)or die("Unable To Execute");
$nRows = mysqli_num_rows($result);

if($nRows == 0){
    $query2 = "select * from registerredcourses WHERE code='$code' AND matricNo='$matricNo'
    AND sessionId='$sessionId' AND semester='$semester'";
    $result2 = mysqli_query($con,$query2)or die("Unable To Execute");
    $nRows2 = mysqli_num_rows($result2);

    if($nRows2 > 0){
        $query = "select * from result_info where code='$code' AND matricNo='$matricNo'
        AND sessionId='$sessionId' AND semester='$semester'";
        $result = mysqli_query($con,$query);
        while($row = mysqli_fetch_assoc($result)){
            $ca = $row['ca'];
            $final = floatval($exam)+floatval($ca);

            if($final <= 44){
                $grade = 'F';
            }
            elseif($final >=45 || $final <= 49){
                $grade = 'D';
            }
            elseif($final >=50 || $final <=59){
                $grade = 'C';
            }
            elseif($final >=60 || $final <=69){
                $grade = 'B';
            }
            elseif($final >=70 || $final <=100){
                $grade = 'A';
            }

            $query = "UPDATE result_info SET exam='$exam',final='$final',grade='$grade' WHERE code='$code' AND matricNo='$matricNo'
                    AND sessionId='$sessionId' AND semester='$semester'";
            mysqli_query($con,$query2)or die("Unable To Execute");
            header("HTTP/1.0 201 Success");
        }
    }
    else{
        header("HTTP/1.0 401 Student Not Registered");
    }
}
else{
    header("HTTP/1.0 402 Already Upload");
}





ob_end_flush();