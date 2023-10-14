

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>@yield('page_title')</title>

	<!-- Report Office2013 style -->
	<link href="{{ asset('/') }}report/css/stimulsoft.viewer.office2013.whiteteal.css" rel="stylesheet">

	<!-- Stimusloft Reports.JS -->
	<script src="{{ asset('/') }}report/scripts/stimulsoft.reports.js" type="text/javascript"></script>
	<script src="{{ asset('/') }}report/scripts/stimulsoft.viewer.js" type="text/javascript"></script>
	
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
							
		report.loadFile("{{ asset('/') }}report/reports/" . {{  $report_name }});	
        report.dictionary.variables.getByName("condition").valueObject = "". {{  $condition }};				
		report.dictionary.variables.getByName("logo1").valueObject = "". {{  $img1 }};	
		report.dictionary.variables.getByName("logo2").valueObject = "". {{  $img2 }};		
		
		viewer.report = report;
		viewer.renderHtml("viewerContent");
	</script>
	</head>
<body>
	<div id="viewerContent"></div>
    Report name : {{  $report_name }} <br>
    cond : {{  $condition }} <br>
    img1 : {{  $img1 }} <br>
    img2 : {{  $img2 }} <br>
</body>
</html>