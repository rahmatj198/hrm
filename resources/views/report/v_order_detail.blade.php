@extends('layout.main_report')

@section('page_title')
    MyApp - {{ $title }}
@endsection

@section('navs')
    {!! $navs !!}
@endsection

@section('breadcrumb')
    {!! $breadcrumb !!}
@endsection

@section('widget_icon')
    {{ $widget_icon }}
@endsection

@section('widget_title')
    {{ $widget_title }}
@endsection
