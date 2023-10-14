<!DOCTYPE html>
<html>
<head>
@include('layout.grid.header')
</head>
	<body class="{{ config('app.skin') }}">

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
						<article class="col-sm-6 col-md-7 col-lg-7"> 
					 	 <!-- master -->
							<div class="jarviswidget jarviswidget-color-teal" id="wid-id-0" data-widget-sortable="false" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
								
								<header>
									<h2>Order</h2>				
									
								</header>
								
								<div>
									
									<div class="jarviswidget-editbox">
										<input class="form-control" type="text">	
									</div>
									
									<div class="widget-body"> 	
									<div class="table-responsive">
										
										<table class="table table-bordered" border="0">		
										<tr>
										<td>										
										
											<form id="query_form" class="form-horizontal">
												<fieldset>												
													
													<input name="id" id="id" type="hidden" >
													
													<div class="form-group">													  													 
													 <label class="col-md-2 control-label" for="textinput">Customer</label>  
													 <div class="col-md-4">													  	
													  	<input name="customer_id" id="textinput" type="text" placeholder="Type Customer" class="form-control input-md" list="listcustomer">
													  	<datalist id="listcustomer">
															{!! $ddata['list_customer'] !!}
														</datalist>
													  </div>																	
													  <label class="col-md-2 control-label" for="textinput">Handle By</label>  
													  <div class="col-md-4">													  	
													  	<input name="employee_id" id="textinput" type="text" placeholder="Type Employee" class="form-control input-md" list="listemployee">
													  	<datalist id="listemployee">																											  
														  {!! $ddata['list_employee'] !!}
														</datalist>
													  </div>
												  													  
													</div>
													
													<div class="form-group">													  
													<label class="col-md-2 control-label" for="textinput">Order Date</label>  
													  <div class="col-md-4">
													  	<input name="order_date" type="text" class="form-control datepicker" data-dateformat="dd-M-yy" placeholder="Select Date">
													  </div>
						
													  <label class="col-md-2 control-label" for="textinput">Required Date</label>  
													  <div class="col-md-4">
													  	<input name="required_date" type="text" class="form-control datepicker" data-dateformat="dd-M-yy" placeholder="Select Date">
													  </div>
													 																									  													  
													</div>
													
													<div class="form-group">
													 <label class="col-md-2 control-label" for="textinput">Shipped Date</label>  
													  <div class="col-md-4">
													  	<input name="shipped_date" type="text" class="form-control datepicker" data-dateformat="dd-M-yy" placeholder="Select Date">
													  </div>	
													  
													  <label class="col-md-2 control-label" for="textinput">Shipper</label>  
													  <div class="col-md-4">													  	
													  	<input name="ship_via" id="textinput" type="text" placeholder="Type Shipper" class="form-control input-md" list="listship">
													  	<datalist id="listship">
														  {!! $ddata['list_shipper'] !!}
														</datalist>
													  </div>													  													  
													</div>	

													
													<div class="form-group">
													 <label class="col-md-2 control-label" for="textinput">Status</label>  
													  <div class="col-md-4">
														<div id="status"></div>													
													  </div>	
													</div>													


													<div class="form-group">
													  <label class="col-md-2 control-label" for="button1id"></label>
													  <div class="col-md-10">
													    <input value=" Save " type="button" id="savedata" class="btn btn-success btn-xs">	
													    <div id="PRINT_ORDER" class="btn btn-info btn-xs"><a id="print_order" href="" target="_blank">Print Order</a></div>													   
													  </div>
													</div>
																										
												</fieldset>
												</form>
										
										</td>
																					
										</tr>
										</table>										
										
										</div>	
									</div>
									
								</div>
								
							</div>
							<!-- end master -->
							
							<!-- detail -->
							<div class="jarviswidget" id="wid-id-2" data-widget-sortable="false" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">
								
								<div>									
									
									<div class="widget-body">
									
											
										<ul id="myTab1" class="nav nav-tabs bordered">

												   <li class="active">
														<a href="#s1" data-toggle="tab"><i class="fa fa-fw fa-lg fa-database"></i> Order Details</a>
													</li>											
													<li>
														<a href="#s2" data-toggle="tab"><i class="fa fa-fw fa-lg fa-file"></i> Files</a>
													</li>																							
																										
												</ul>
						
												<div id="myTabContent1" class="tab-content padding-10">
													
																																																
													<div class="tab-pane fade in active" id="s1" style="overflow-x: scroll">														
														 @yield('order_details')	
																																																																	
													</div>
																																																			
													<div class="tab-pane fade in" id="s2" style="overflow-x: scroll">															
														 @yield('order_files')	
													</div>	
																																																																													
																																																				
												</div>									
										
									</div>
									
								</div>
								
							</div>
							<!-- end detail -->
						</article>
					
						<article class="col-sm-6 col-md-5 col-lg-5"> 
							<!-- list master -->
							<div class="jarviswidget jarviswidget-color-teal" id="wid-id-1" data-widget-sortable="false" data-widget-editbutton="false" data-widget-colorbutton="false" data-widget-deletebutton="false">	
									<header>
										<h2>List of Order</h2>																					
										
									</header>								
									<div>
																		
										<div class="widget-body">
										
										@yield('orders')
											
										</div>
										
									</div>
									
								</div>	
							<!-- end list master -->																																														
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

    @include('layout.grid.script_md')
	</body>

</html>