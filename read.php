<?php 
	$db = mysqli_connect('localhost','root','','studentdb');



	$sql = "SELECT * FROM studentinfo" ;

	$result = mysqli_query($db,$sql);



	$arr=[];
	while($row=mysqli_fetch_array($result))
	{
		$arr[]=$row;
	}

	echo json_encode($arr);


?>