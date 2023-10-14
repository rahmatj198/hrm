@extends('layout.main_transaction')

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

@section('orders')
    <div class="quote">{!! $phpgrid_output !!}</div>
					 
    <script type="text/javascript">
        $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
    </script>    

@endsection

@section('order_details')
    <div class="quote">{!! $order_details !!}</div>
					 
    <script type="text/javascript">
        $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
    </script>    

@endsection

@section('order_files')
    <div class="quote">{!! $order_files !!}</div>
					 
    <script type="text/javascript">
        $.ajaxSetup({headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}});
    </script>    

@endsection