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
<form action = "<?php echo $_SERVER["PHP_SELF"];?>" method="GET">
<center><label style="text-align:center">Enter Customer id:</label><input type="text" name="CustID" id="CustID">
<input type = "submit" value = "Display Orders">
</center>	
</form>

<?php
include "connect.php";
//include "ingredients.php";
error_reporting(E_ALL);
if($_GET) 
{
	if($_SERVER["REQUEST_METHOD"]=="GET") 
	{
		if(trim($_GET["CustID"])=="")   
			echo "<script>alert('Please Enter Customer ID')</script>";
		
		else
		{
			$CustID = $_GET["CustID"];
			$query = "SELECT c.cakename,o.pricepaid,o.ordertime,o.pickuptime FROM cake AS c,orders AS o WHERE o.custid=? AND o.cakeid=c.cakeid";
			if ($stmt = $mysqli->prepare($query)) {
				$stmt->bind_param("s", $CustID);
				$stmt->execute();
				$stmt->bind_result($cakename, $pricepaid, $ordertime, $picuptime);
				// Printing results in HTML
				echo "<center>";
				echo "<br><h3><table border = '1'>\n";
				echo "<th>Cake Name</th><th>Price Paid</th><th>Order Time</th><th>Pickup Time</th>";
				while ($stmt->fetch()) {
					echo "<tr>";
					echo "<td><a href=\"ingredients.php?cake=$cakename&CustID=$CustID\">$cakename</a></td><td>$pricepaid</td><td>$ordertime</td><td>$picuptime</td>";
					echo "</tr>\n";
				}
				echo "</table></h3></center>\n";
				$stmt->close();
				$mysqli->close();
			}
			
		}
	}
	
}

?>
</body>
</html>