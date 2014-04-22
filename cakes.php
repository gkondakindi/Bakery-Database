<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html { 
        background: url('bakery.jpg') no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
}
table
{
border-collapse:collapse;
}
</style>
</head>
<body>
<?php
include "connect.php";
error_reporting(E_PARSE);
$key = $_GET["ingredient"];
$cake = $_GET["cake"];
$query = "SELECT c.cakename FROM cake AS c,contains AS co,ingredient AS i WHERE i.iname=? AND c.cakeid=co.cakeid AND co.ingredid=i.ingredid";
if ($stmt = $mysqli->prepare($query)) {
	$stmt->bind_param("s", $key);
	$stmt->execute();
	$stmt->bind_result($cakename);
	// Printing results in HTML
	echo "<center>";
	echo "<br><h3>Cakes having the ingredient $key</h3>";
	echo "<h3><table border = '1'>\n";
	echo "<th>Cake Name</th>";
	while ($stmt->fetch()) {
		echo "<tr>";
		echo "<td><a href=\"ingredients.php?cake=$cakename\">$cakename</a></td>";
		echo "</tr>\n";
	}
	echo "</table></h3>\n";
	echo "<h4><a href=\"ingredients.php?cake=$cake&CustID=$_GET[CustID]\">Go Back</a></h4></center>";
	$stmt->close();
	$mysqli->close();
}
?>
</body>
</html>