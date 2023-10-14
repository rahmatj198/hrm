		<!--================================================== -->

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script data-pace-options='{ "restartOnRequestAfter": true }' src="{{ asset('/') }}smartadmin/js/plugin/pace/pace.min.js"></script>

		<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script>
			if (!window.jQuery) {
				document.write('<script src="{{ asset('/') }}smartadmin/js/libs/jquery-2.1.1.min.js"><\/script>');
			}
		</script>

		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="{{ asset('/') }}smartadmin/js/libs/jquery-ui-1.10.3.min.js"><\/script>');
			}
		</script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="{{ asset('/') }}smartadmin/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
		<script src="{{ asset('/') }}smartadmin/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 

		<!-- BOOTSTRAP JS -->
		<script src="{{ asset('/') }}smartadmin/js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="{{ asset('/') }}smartadmin/js/notification/SmartNotification.min.js"></script>

		<!-- JARVIS WIDGETS -->
		<script src="{{ asset('/') }}smartadmin/js/smartwidgets/jarvis.widget.min.js"></script>

		<!-- EASY PIE CHARTS -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

		<!-- SPARKLINES -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/sparkline/jquery.sparkline.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/select2/select2.min.js"></script>

		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/fastclick/fastclick.min.js"></script>

		<!-- MAIN APP JS FILE -->
		<script src="{{ asset('/') }}smartadmin/js/app.min.js"></script>

		<!-- PAGE RELATED PLUGIN(S) -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/moment/moment.min.js"></script>
		<script src="{{ asset('/') }}smartadmin/js/plugin/chartjs/chart.min.js"></script>

		<script type="text/javascript">

			$(document).ready(function() {
			 		
				 pageSetUp();				
				 
				var barChartData = {!!  $out_orderby_emp !!};
				var pieChartData = {!!  $out_orderby_shipper !!};
				var lineChartData = {!!  $out_orderby_country !!};

			    // pie chart
			    var PieConfig = {
			        type: 'pie',
			        data: pieChartData,
			        options: {
			            responsive: true
			        }
			    };

				//line
		        var LineConfig = {
		            type: 'line',
		            data: lineChartData,
		            options: {
		                responsive: true
		            }
		        };

			window.onload = function() {
					
		        window.myBar = new Chart(document.getElementById("barChart"), {
		                type: 'bar',
		                data: barChartData,
		                options: {
		                    responsive: true,
		                }
		            });

				window.myPie = new Chart(document.getElementById("pieChart"), PieConfig);
				window.myLine = new Chart(document.getElementById("lineChart"), LineConfig);
		        };
			    
			})
		
		</script>