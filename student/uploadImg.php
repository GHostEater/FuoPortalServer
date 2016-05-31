<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 04-May-16
 * Time: 5:10 PM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");

$matricNo = $_POST['matricNo'];
$i = str_replace("/", "", $matricNo);

$img = $i.'.jpg';

mysqli_query($con,"UPDATE student_info SET img = '$img' WHERE matricNo = '$matricNo';");

$destination = '../img/students/'.$img;
move_uploaded_file($_FILES['file']['tmp_name'],$destination);