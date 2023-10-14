<!DOCTYPE html>
<html>
	<head>
	@include('layout.grid.header')
	</head>

	<body class="{{ config('app.skin') }}">
	<!-- @include('layout.grid.header_script') -->
    @include('layout.general.top')
    @include('layout.general.nav')

		<!-- MAIN PANEL -->
		<div id="main" role="main">
			
			<!-- MAIN CONTENT -->
			<div id="content">
				
				<!-- widget grid -->
				<section id="widget-grid" class="">
				
					<!-- row -->
					<div class="row">
						
						<!-- NEW WIDGET START -->
						<article class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
							
							<div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
								
								<header>
									<span class="widget-icon"> <i class="@yield('widget_icon')"></i> </span>
									<h2>@yield('widget_title')</h2>				
									
								</header>
								
								<div>
									
									<div class="jarviswidget-editbox">
										<input class="form-control" type="text">	
									</div>
									
									<div class="widget-body">
									@yield('widget_content')									
										
									</div>
									
								</div>
								
							</div>
				
						</article>
						
						<article class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
							
							<div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
								
								<header>
									<h2><span class="widget-icon"> <i class="fa fa-history"></i> </span>Import History</h2>				
									
								</header>
								
								<div>
									
									<div class="jarviswidget-editbox">
										<input class="form-control" type="text">	
									</div>
									
									<div class="widget-body">
									@yield('widget_content_history')									
										
									</div>
									
								</div>
								
							</div>
				
						</article>	
						<!-- WIDGET END -->
						
					</div>
				
					<!-- end row -->
				
					<!-- row -->
				
					<div class="row">
				
						<!-- a blank row to get started -->
						<div class="col-sm-12">
                           
							<!-- your contents here -->
						</div>
							
					</div>
				
					<!-- end row -->
				
				</section>
				<!-- end widget grid -->

			</div>
			<!-- END MAIN CONTENT -->

		</div>
		<!-- END MAIN PANEL -->

    @include('layout.general.footer')

    @include('layout.general.shortcut')

    @include('layout.grid.script')

	</body>

</html>