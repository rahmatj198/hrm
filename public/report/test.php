<?php
require_once 'stimulsoft/helper.php';
	$reportname = 'main_orders.mrt';
	$kondisi = "WHERE PROJECT_CODE = 'P001'";   	
	$imgbase1 = 'http://localhost/myapp/public/img/logo/project1.jpg';
	$imgbase2 = 'http://localhost/myapp/public/img/logo/project2.jpg';
	
	/*
	// A user-defined error handler function
	function myErrorHandler($errno, $errstr, $errfile, $errline) {
		echo "<b>Custom error:</b> [$errno] $errstr<br>";
		echo " Error on line $errline in $errfile<br>";
	}
	// Set user-defined error handler function
	set_error_handler("myErrorHandler"); */


	# sembunyikan semua pesan error bawaan PHP
	error_reporting(0);
	set_error_handler('tanganiError');

	/**
	 * Fungsi untuk menangai error.
	 * 
	 * Fungsi ini wajib memiliki 4 paramter dan nama parameter bisa bebas.
	 */
	function tanganiError ($level, $message, $file, $line) {
	  echo "<div style='padding: 2rem; background: rgba(200, 0, 0, 0.5); color: white'>";
	  echo    "<b>Terjadi Error</b>";
	  echo    "<p>[{$level}] {$message} - {$file}:{$line}</p>";
	  echo "</div>";
	}	
	
	register_shutdown_function(function () {
		if (error_get_last()) {
			# ambil error terakhir
			$error = (object) error_get_last();

			tanganiError(
				$error->type, $error->message, $error->file, $error->line
			);
		}
	});	
	
?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Myapp Report</title>

	<!-- Report Office2013 style -->
	<link href="css/stimulsoft.viewer.office2013.whiteteal.css" rel="stylesheet">

	<!-- Stimusloft Reports.JS -->
	<script src="scripts/stimulsoft.reports.js" type="text/javascript"></script>
	<script src="scripts/stimulsoft.viewer.js" type="text/javascript"></script>
	
	<?php StiHelper::initialize(); ?>
	<script type="text/javascript">
		var options = new Stimulsoft.Viewer.StiViewerOptions();
		options.appearance.fullScreenMode = true;
		options.toolbar.showSendEmailButton = true;
		
		//by pass query
		StiOptions.Engine.escapeQueryParameters = false;
		
		var viewer = new Stimulsoft.Viewer.StiViewer(options, "StiViewer", false);
		
		// Process SQL data source
		viewer.onBeginProcessData = function (event, callback) {
			<?php StiHelper::createHandler(); ?>
		}
		
		viewer.onBeginExportReport = function (args) {
			//args.fileName = "MyReportName";
		}		
		
		// Send exported report to Email
		viewer.onEmailReport = function (event) {
			<?php StiHelper::createHandler(); ?>
		}
		
		// Load and show report
		var report = new Stimulsoft.Report.StiReport();
							
		report.loadFile("reports/<?=$reportname?>");					
		report.dictionary.variables.getByName("logo1").valueObject = "<?=$imgbase1?>";	
		report.dictionary.variables.getByName("logo2").valueObject = "<?=$imgbase2?>";		
		
		viewer.report = report;
		viewer.renderHtml("viewerContent");
	</script>
	</head>
<body>
	<div id="viewerContent"></div>
</body>
</html>
