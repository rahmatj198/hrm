@extends('layout.main_import')

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
