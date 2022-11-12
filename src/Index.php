<?php
define("PATHPAGES", "pages" . DIRECTORY_SEPARATOR);

include(PATHPAGES . "header.php");
if ($page === "/") {
    include(PATHPAGES . "home.php");
} else if ($page === "inscription") {
    include(PATHPAGES . "inscription.php");
}
?>