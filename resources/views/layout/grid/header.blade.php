        <meta charset="utf-8">
        <title> @yield('page_title')</title>
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
        <!--byR
        <link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}smartadmin/css/smartadmin-rtl.min.css"> 
        -->

        <!-- #FAVICONS -->
        <link rel="shortcut icon" href="{{ asset('/') }}smartadmin/img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="{{ asset('/') }}smartadmin/img/favicon/favicon.ico" type="image/x-icon">

        <!-- #GOOGLE FONT -->
        <!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700"> -->
		        
        
        <!-- grid -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

        <link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}phpgrid/js/themes/redmond/jquery-ui.custom.css"></link>	
        <link rel="stylesheet" type="text/css" media="screen" href="{{ asset('/') }}phpgrid/js/jqgrid/css/ui.jqgrid.css"></link>	
		
        <script src="{{ asset('/') }}phpgrid/js/jquery.min.js" type="text/javascript"></script>
        <script src="{{ asset('/') }}phpgrid/js/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
        <script src="{{ asset('/') }}phpgrid/js/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
        <script src="{{ asset('/') }}phpgrid/js/themes/jquery-ui.custom.min.js" type="text/javascript"></script>

        
        <link href="{{ asset('/') }}phpgrid/js/jqgrid/css/select2.min.css" rel="stylesheet" />
	<script src="{{ asset('/') }}phpgrid/js/jqgrid/js/select2.min.js"></script>	
	
        <link href="{{ asset('/') }}phpgrid/js/jqgrid/css/multiple-select.css" rel="stylesheet" />
	<script src="{{ asset('/') }}phpgrid/js/jqgrid/js/multiple-select.js"></script> 
        <!-- end grid -->