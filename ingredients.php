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
error_reporting(E_ALL);
include "connect.php";
$key = $_GET["cake"];
$custid = $_GET["CustID"];
$query = "SELECT i.iname,co.qty FROM cake AS c,contains AS co,ingredient AS i WHERE c.cakename=? AND c.cakeid=co.cakeid AND co.ingredid=i.ingredid";
if ($stmt = $mysqli->prepare($query)) {
	$stmt->bind_param("s", $key);
	$stmt->execute();
	$stmt->bind_result($iname, $qty);
	// Printing results in HTML
	echo "<center>";
	echo "<br><h3>Ingredients in $key</h3>";
	echo "<h3><table border = '1'>\n";
	echo "<th>Ingredient Name</th><th>Quantity</th>";
	while ($stmt->fetch()) {
		echo "<tr>";
		echo "<td><a href=\"cakes.php?ingredient=$iname&cake=$key\">$iname</a></td><td>$qty</td>";
		echo "</tr>\n";
	}
	echo "</table></h3>\n";
	echo "<h4><a href=\"index.php?CustID=$_GET[CustID]\">Go Back</a></h4></center>";
	$stmt->close();
	$mysqli->close();
}
?>
</body>
</html>