<!DOCTYPE html>
<html lang="en-us">
	<head>
        @include('layout.general.header')
		@include('layout.dashboard.header')

	</head>

	<body class="{{ config('app.skin') }}">

    @include('layout.general.top')
    @include('layout.general.nav')

		<!-- MAIN PANEL -->
		<div id="main" role="main">
			<div id="content">

				<div class="tab-pane fade in active" id="tabsum">
					<p>

					@include('layout.dashboard.chart')

					</p>

				</div>

			</div>

		</div>

		@include('layout.general.footer')

		@include('layout.general.shortcut')

		@include('layout.dashboard.script')

	</body>

</html>

