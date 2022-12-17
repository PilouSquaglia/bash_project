<?php

include("header.html");
if ($page === "/") {
    include("home.html");
} else if ($page === "inscription") {
    include("inscription.html");
}else{
    include("404.html");
}

include("footer.html");
?>