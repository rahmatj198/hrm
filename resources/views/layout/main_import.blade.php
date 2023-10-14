<!DOCTYPE html>
<html>
<head>
@include('layout.general.header')
</head>
	<body class="{{ config('app.skin') }}">

    @include('layout.general.top')
    @include('layout.general.nav')

		<!-- MAIN PANEL -->
		<div id="main" role="main">

        @include('layout.import.style') 
			
			<!-- MAIN CONTENT -->
			<div id="content">
				
				<!-- widget grid -->
				<section id="widget-grid" class="">
				
					<!-- row -->
					<div class="row">
						
						<!-- NEW WIDGET START -->
						<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget" id="wid-id-0" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
								<header>
									<span class="widget-icon"> <i class="@yield('widget_icon')"></i> </span>									
									<h2> @yield('widget_title') </h2>				
									
								</header>
				
								<!-- widget div-->
								<div>
									<br>
									<div class="row">
										<div class="col-sm-1"></div>
										<ul class="bs-glyphicons">
											<li>
												<a href="{{ url('/') }}/import_cust">
												<span class="glyphicon glyphicon-user"></span>												
												<span class="glyphicon-class">Customers</span>
												</a>
											</li>
											<li>
												<a href="{{ url('/') }}/import_prod">
												<span class="glyphicon glyphicon-list-alt"></span>
												<span class="glyphicon-class">Products</span>
												</a>
											</li>																																
										</ul>
										<div class="col-sm-1"></div>

									</div>
		

								</div>

								<!-- end widget div -->
								
							</div>
							<!-- end widget -->
				
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

    @include('layout.general.script')

	</body>

</html>