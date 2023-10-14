<!DOCTYPE html>
<html lang="en-us" id="extr-page">
	<head>
		<meta charset="utf-8">
		<title>{{ $title }}</title>
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		
		<!-- #CSS Links -->
		<!-- Basic Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/font-awesome.min.css">

		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/smartadmin-skins.min.css">

		<!-- SmartAdmin RTL Support -->
		<link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/smartadmin-rtl.min.css"> 

		<!-- #FAVICONS -->
		<link rel="shortcut icon" href="{{ asset('/') }}smartadmin/img/favicon/favicon.ico" type="image/x-icon">
		<link rel="icon" href="{{ asset('/') }}smartadmin/img/favicon/favicon.ico" type="image/x-icon">

		<!-- #GOOGLE FONT -->
		<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">

	</head>
	
	<body class="animated fadeInDown">

		<header id="header">

			<div id="logo-group">
				<span id="logo"> <img src="{{ asset('/') }}smartadmin/img/logo.png" alt="SmartAdmin"> </span>
			</div>			

		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">Complete App Template</h1>
						<div class="hero">

							<div class="pull-left login-desc-box-l">
								<h4 class="paragraph-header">Main Template Features :</h4>
									<ul>
										<li>CRUD (Create Read Update Delete)</li>
										<li>Export/Import Data(Excell and CSV File)</li>
										<li>Master Detail Data</li>
										<li>Query Builder for Report</li>
										<li>Report</li>
										<li>Chart</li>
										
									</ul>
								<h4 class="paragraph-header">Simplify for you in a package to fulfill your bussiness process</h4>	
							</div>
							
							<img src="{{ asset('/') }}smartadmin/img/demo/iphoneview.png" class="pull-right display-image" alt="" style="width:210px">

						</div>

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">About My App - is this ready to run?</h5>
								<p>
									My App is already tested and run for managing day to day transaction. It is designed to help developer simplify development process. All basic feature is ready.
								</p>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<h5 class="about-heading">The Technology</h5>
									<p>
										PHP, Bootstrap, Jquery, PHP Grid, Query Builder, Chart 4 PHP, Stimulsoft Report
									</p>
							</div>
						</div>

					</div>
					<div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">
						<div class="well no-padding">
							<form action="login" method="POST" id="login-form" class="smart-form client-form">
								@csrf
								<header>
									Sign In
								</header>

								<fieldset>
									
									<section>
										<label class="label">Email</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
											<input type="text" name="email" id="email" placeholder="email" value="{{ old('email')}}" @error('email') is-invalid @enderror required>
											@error('email')
											<strong>Invalid email!</strong>
											@enderror
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Please enter email address/username</b></label>
									</section>

									<section>
										<label class="label">Password</label>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
											<input type="password" name="password" placeholder="Password" required>
											<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Enter your password</b> </label>
									
									    <div class="field-wrap">
									        <input type="hidden" name="screen_height" id="screen_height" class="form-control" required/>
									    </div>
									    
									    <script>
									      document.getElementById('screen_height').value = screen.height;
									    </script>									    
									    
										@if(session()->has('login_error'))
										<div class="alert alert-danger fade in">
											<button class="close" data-dismiss="alert">
												×
											</button>
											<i class="fa-fw fa fa-times"></i>
											<strong>Error!</strong> {{ session('login_error') }}.
										</div>
										@endif
									</section>


								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">
										Sign in
									</button>
								</footer>
							</form>

						</div>
						

						
					</div>
				</div>
			</div>

		</div>

		<!--================================================== -->	

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script src="{{ asset('/') }}smartadmin/js/plugin/pace/pace.min.js"></script>

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<script src="{{ asset('/') }}smartadmin/js/libs/jquery-2.1.1.min.js"><\/script>');} </script>

	    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="{{ asset('/') }}smartadmin/js/libs/jquery-ui-1.10.3.min.js"><\/script>');} </script>

		<!-- IMPORTANT: APP CONFIG -->
		<script src="{{ asset('/') }}smartadmin/js/app.config.js"></script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="smartadmin/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="{{ asset('/') }}smartadmin/js/bootstrap/bootstrap.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/jquery-validate/jquery.validate.min.js"></script>
		
		<!-- JQUERY MASKED INPUT -->
		<script src="{{ asset('/') }}smartadmin/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
		
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="{{ asset('/') }}smartadmin/js/app.min.js"></script>

	</body>
</html>