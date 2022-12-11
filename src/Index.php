<?php

include("header.php");
if ($page === "/") {
    include("home.php");
} else if ($page === "inscription") {
    include("inscription.php");
}else{
    include("404.php");
}

include("footer.php");
?>