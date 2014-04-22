<?php
error_reporting(E_PARSE);
$mysqli = new mysqli("localhost", "USERNAME", "", "bakery");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
?>