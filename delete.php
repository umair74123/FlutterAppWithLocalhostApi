<?php 
	$db = mysqli_connect('localhost','root','','studentdb');

    $id = $_POST['id'];

	$sql = "DELETE FROM `studentinfo` WHERE id='$id'" ;

	$result = mysqli_query($db,$sql);
	$arr=[];
    if($result)
    {
        $arr["success"]=="true";
    }
    else
    {
        $arr["success"]=="false";
    }
    print(json_encode($arr));

?>