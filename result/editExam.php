<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 5/17/2016
 * Time: 1:32 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: appliexamtion/json");

include("../conn.php");
$id = $_GET['id'];
$exam = floatval($_GET['exam']);
if(floatval($exam) > 70){
    $exam = 70;
}

$query = "select * from result_info where sn='$id'";
$result = mysqli_query($con,$query) or die("Unable to Execute Select");
while($row = mysqli_fetch_assoc($result)){
    $ca = floatval($row['ca']);
    $final = $ca+$exam;
    $gp = '';
    if(floatval($final) > 100){
        $final = 100;
    }
    else{
        $final = round($final);
    }

    if($final >=70 && $final <=100){
        $grade = 'A';
        $gp = 5;
    }
    elseif($final >=60 && $final <=69){
        $grade = 'B';
        $gp = 4;
    }
    elseif($final >=50 && $final <=59){
        $grade = 'C';
        $gp = 3;
    }
    elseif($final >=45 && $final < 50){
        $grade = 'D';
        $gp = 2;
    }
    elseif($final <= 44){
        $grade = 'F';
        $gp = 0;
    }
    if ($grade ==='A' || 'B' || 'C' || 'D'){
        $statusId = 1;
    }
    elseif($grade === 'F'){
        $statusId = 2;
    }

    $query = "UPDATE result_info SET exam='$exam',final='$final',grade='$grade',gp='$gp',statusId='$statusId' where sn = '$id'";
    mysqli_query($con,$query)or die("Unable To Execute");

    header("HTTP/1.0 201 Success");
}
ob_end_flush();