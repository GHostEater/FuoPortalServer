<?php
/**
 * Created by PhpStorm.
 * User: Bello J
 * Date: 4/21/2016
 * Time: 4:12 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$session = $_GET['session'];

$query = "insert into session VALUES(NULL,'$session')";
mysqli_query($con,$query)or die("Unable To Execute");

$query = "select * from student_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");

while($row = mysqli_fetch_assoc($result)){
    $matricNo = $row['matricNo'];
    $levelId = $row['levelId'];

    $query = "select * from level WHERE sn='$levelId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $level = $row5['level'];
    }

    if($level != 400){
        if($level == 100){
            $lvlId = 2;
        }
        else if($level == 200){
            $lvlId = 3;
        }
        else if($level == 300){
            $lvlId = 4;
        }

        $query = "UPDATE student_info SET levelId='$lvlId' where matricNo = '$matricNo'";
        mysqli_query($con,$query)or die("Unable To Execute");

    }
}

$query = "select * from leveladviser";
$result = mysqli_query($con,$query)or die("Unable To Execute");

while($row = mysqli_fetch_assoc($result)){
    $levelId = $row['levelId'];
    $id = $row['sn'];

    $query = "select * from level WHERE sn='$levelId'";
    $result5  = mysqli_query($con,$query)or die("Unable To Execute");
    while($row5 = mysqli_fetch_assoc($result5)){
        $level = $row5['level'];
    }

    if($level != 400){
        if($level == 100){
            $lvlId = 2;
        }
        else if($level == 200){
            $lvlId = 3;
        }
        else if($level == 300){
            $lvlId = 4;
        }

        $query = "UPDATE student_info SET levelId='$lvlId' where matricNo = '$matricNo'";
        mysqli_query($con,$query)or die("Unable To Execute");

    }
}

$query = "select * from lecturer_info";
$result = mysqli_query($con,$query)or die("Unable To Execute");

while($row = mysqli_fetch_assoc($result)){
    $email = $row['email'];

    $validChars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    $password = '';
    $numValidChars = strlen($validChars);

    for($i=0; $i<8; $i++){
        $randomPick = mt_rand(1,$numValidChars);
        $randomChar = $validChars[$randomPick-1];
        $password .= $randomChar;
    }

    $query = "update lecturer_info set password='$password'";
    mysqli_query($con,$query)or die("Unable To Execute");

    $title = "Your New Password - FUO Portal";
    $msg = "Your New password for ".$session." session is ".$password."\nYour Username remains unchanged";
    mail($email,$title,$msg);
}

header("HTTP/1.0 201 Success");
ob_end_flush();