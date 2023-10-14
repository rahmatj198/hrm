@extends('layout.main_import_data')

@section('page_title')
    MyApp - {{ $title }}
@endsection

@section('navs')
    {!! $navs !!}
@endsection

@section('widget_icon')
    {{ $widget_icon }}
@endsection

@section('widget_title')
    {{ $widget_title }}
@endsection

@section('widget_content')
    <div class="quote">{!! $phpgrid_output !!}</div>
					 
    <script type="text/javascript">
        $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
    </script>    

@endsection

@section('widget_content_history')
    <div class="quote">{!! $out_history !!}</div>
					 
    <script type="text/javascript">
        $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
    </script>    

@endsection
