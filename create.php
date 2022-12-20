<?php
	$db = mysqli_connect('localhost','root','','studentdb');
	if (!$db) {
		echo "Database connection faild";
	}

	$regno = $_POST['regno'];
	$name = $_POST['name'];
    $dept = $_POST['dept'];
	$semester = $_POST['semester'];


	$sql = "SELECT regno FROM studentinfo WHERE regno = '".$regno."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO studentinfo (regno,name,dept,semester)VALUES('".$regno."','".$name."','".$dept."','".$semester."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>





















