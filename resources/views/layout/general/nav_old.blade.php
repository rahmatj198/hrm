		<!-- #NAVIGATION -->
		<!-- Left panel : Navigation area -->
		<!-- Note: This width of the aside area can be adjusted through LESS variables -->
		<aside id="left-panel">

			<!-- User info -->
			<div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as it --> 
					
					<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut"> 
						<img src="{{ asset('/') }}smartadmin/img/avatars/sunny.png" alt="me" class="online" /> 
						<span>
							@auth
								{{ auth()->user()->name }}
							@endauth
						</span>
						<i class="fa fa-angle-down"></i>
					</a>  
					
				</span>
			</div>
			<!-- end user info -->

			<nav>
				<!-- 
				NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul>
					<li>
						<a href="#" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Dashboard</span></a>
						<ul>
							<li class="{{ Request::is('dashboard')? 'active' : '' }}">
								<a href="dashboard"><i class="fa fa-home"></i>Dashboard</a>
							</li>
						</ul>	
					</li>

					<!-- using gate to authorize menu-->
					@can('gate_admin')
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-group"></i> <span class="menu-item-parent">Admin</span></a>
						<ul>
							<li class="{{ Request::is('appuser')? 'active' : '' }}">
								<a href="appuser"><i class="fa fa-user"></i>User Management</a>
							</li>
							<li class="{{ Request::is('appmenu')? 'active' : '' }}">
								<a href="appmenu"><i class="fa fa-building"></i> Menu Management</a>
							</li>
							<li class="{{ Request::is('applevel')? 'active' : '' }}">
								<a href="applevel"><i class="fa fa-level-up"></i> Level Management</a>
							</li>
							<li class="{{ Request::is('appuser_table')? 'active' : '' }}">
								<a href="appuser_table"><i class="fa fa-database"></i> User Table Management</a>
							</li>							
						</ul>
					</li>
					@endcan		
					
					<!-- using gate to authorize menu-->
					@can('gate_entrydata')
					<li>
						<a href="#"><i class="fa fa-lg fa-fw fa-file-pdf-o"></i> <span class="menu-item-parent">Report</span></a>
						<ul>
							<li class="{{ Request::is('order_detail')? 'active' : '' }}">
								<a href="order_detail"><i class="fa fa-file-pdf-o"></i>Order Detail</a>
							</li>							
						</ul>
					</li>
					@endcan						
					
				</ul>
			</nav>
			

			<span class="minifyme" data-action="minifyMenu"> 
				<i class="fa fa-arrow-circle-left hit"></i> 
			</span>

		</aside>
		<!-- END NAVIGATION -->