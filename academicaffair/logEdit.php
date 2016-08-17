<?php
/**
 * Created by PhpStorm.
 * User: GHostEater
 * Date: 17-Aug-16
 * Time: 7:39 AM
 */
ob_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include("../conn.php");
$resultId = $_GET['resultId'];
$type = $_GET['type'];
$prevScore = $_GET['prevScore'];
$newScore = $_GET['newScore'];
$dateEdited = date('Y-m-d H:i:s',strtotime($_GET['dateEdited']));
$editedBy = $_GET['editedBy'];

$query = "insert into editlogs(id,resultId,type,prevScore,newScore,dateEdited,editedBy)
values(null,'$resultId','$type','$prevScore','$newScore','$dateEdited','$editedBy')";
mysqli_query($con,$query)or die("Unable To Execute");

header("HTTP/1.0 201 Success");
ob_end_flush();