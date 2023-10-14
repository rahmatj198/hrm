<?php

// PHP Grid database connection settings, Only need to update these in new project

// replace mysqli with one of these: mysqli,oci8 (for oracle),mssqlnative,postgres,sybase
define("PHPGRID_DBTYPE","mysqli"); 
define("PHPGRID_DBHOST","localhost");
define("PHPGRID_DBUSER","root");
define("PHPGRID_DBPASS","");
define("PHPGRID_DBNAME","myapp");

// database charset
define("PHPGRID_DBCHARSET","utf8");

// Basepath for lib
define("PHPGRID_LIBPATH",dirname(__FILE__).DIRECTORY_SEPARATOR."lib".DIRECTORY_SEPARATOR);