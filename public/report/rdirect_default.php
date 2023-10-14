<?php
require_once 'stimulsoft/helper.php';

    ob_start();
    include('index_ci.php');
    ob_end_clean();
    $CI =& get_instance();  
    $CI->load->model('Myapp_model');  
	$project_code = $CI->session->userdata('project_code');				
	$project_code = $CI->db->escape($project_code);	
	
	$kondisi = "WHERE PROJECT_CODE = $project_code";   	
	$imgbase1 = base_url() . $CI->config->item('PROJECT_LOGO1');
	$imgbase2 = base_url() . $CI->config->item('PROJECT_LOGO2');
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
							
		report.loadFile("reports/<?=$_GET['reportname']?>");					
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
