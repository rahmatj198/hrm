		<!-- IMPORTANT: APP CONFIG -->
		<script src="{{ asset('/') }}smartadmin/js/app.config.js"></script>

		<!-- BOOTSTRAP JS -->
		<script src="{{ asset('/') }}smartadmin/js/bootstrap/bootstrap.min.js"></script>

		<!-- CUSTOM NOTIFICATION -->
		<script src="{{ asset('/') }}smartadmin/js/notification/SmartNotification.min.js"></script>		

		<!-- JARVIS WIDGETS -->
		<script src="{{ asset('/') }}smartadmin/js/smartwidgets/jarvis.widget.min.js"></script>			

		<!-- MAIN APP JS FILE -->
		<script src="{{ asset('/') }}smartadmin/js/app.min.js"></script>

		<script type="text/javascript">

			$(document).ready(function() {
			 					
				 pageSetUp();				
				

			})
		
		</script>

		<script type="text/javascript">
					
			// load grid row in form
			var load_form = function ()
					{ 
						var row = jQuery("#list1").jqGrid('getGridParam','selrow'); 
						 
						var stat,label;  
						if(row)
						{ 
							jQuery("#list1").jqGrid('GridToForm',row,"#query_form");  
							var stat = jQuery('#list1').jqGrid('getCell', row, 'status');
							switch (stat) {
								case 'created' : label = "<span class=\"label label-info\">CREATED</span>"; break;
								case 'in progress' : label = "<span class=\"label label-warning\">IN PROGRESS</span>"; break;
								case 'completed' : label = "<span class=\"label label-success\">COMPLETED</span>"; break;
								case 'cancelled' : label = "<span class=\"label label-danger\">CANCELLED</span>"; break;
								default:
							} 							
							jQuery("#status").html(label);  							                        
																											
						} 
						else 
						{ 
							// alert("Please select Row") 
						} 
														
					}                  
			
		</script>
			
		<script>			
			function fdata_select()
			{				
					var ids = $("#list1").jqGrid('getDataIDs');				
					setTimeout( function(){jQuery('#list1').jqGrid('setSelection', ids[0], true);}, 1000);
			}	  	
		</script>		